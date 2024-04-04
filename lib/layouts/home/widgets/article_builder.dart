import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/widgets/article_widget.dart';
import 'package:news_app/shared/api/api_manager.dart';

class ArticleBuilder extends StatefulWidget {
  const ArticleBuilder({
    super.key,
    required this.source,
    required this.searchValue,
  });
  final String? source;
  final String? searchValue;
  @override
  State<ArticleBuilder> createState() => _ArticleBuilderState();
}

class _ArticleBuilderState extends State<ArticleBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(
          source: widget.source ?? "", searchValue: widget.searchValue),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (snapshot.hasError || snapshot.data!.status == "error") {
          return SliverToBoxAdapter(
            child: Column(
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
            ),
          );
        }
        var articles = snapshot.data!.articles ?? [];
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: articles[index],
              );
            },
          ),
        );
      },
    );
  }
}
