import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:news_app/layouts/home/widgets/article_builder.dart';
import 'package:news_app/layouts/home/widgets/source_widget.dart';
import 'package:news_app/shared/api/api_manager.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({
    super.key,
    required this.categoryId,
  });
  final String categoryId;
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int sourceIndex = 0;
  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return FutureBuilder(
        future: ApiManager.getSources(categoryId: widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError || snapshot.data!.status == "error") {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message.toString() ??
                    snapshot.error.toString()),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("try again"),
                )
              ],
            );
          }
          var sources = snapshot.data!.sources ?? [];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 2));
                  provider.setSearchValue('');
                  setState(() {});
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: TabBar(
                        enableFeedback: false,
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        dividerHeight: 0,
                        onTap: (index) {
                          sourceIndex = index;
                          setState(() {});
                        },
                        tabs: sources
                            .map(
                              (source) => SourceWidget(
                                source: source,
                                isSelected:
                                    sourceIndex == sources.indexOf(source),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    ArticleBuilder(
                      source: sources[sourceIndex].id!,
                      searchValue: provider.searchValue,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
