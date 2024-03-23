import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:news_app/layouts/home/widgets/source_widget.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return DefaultTabController(
      length: SourceModel.sourseList.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              dividerHeight: 0,
              onTap: (index) {
                provider.changeSelectedSource(index);
              },
              tabs: SourceModel.sourseList
                  .map(
                    (source) => SourceWidget(
                      source: source,
                      isSelected: provider.selectedSource ==
                          SourceModel.sourseList.indexOf(source),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
