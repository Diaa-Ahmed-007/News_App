import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:news_app/layouts/home/widgets/category_details.dart';
import 'package:news_app/layouts/home/widgets/category_widget.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/style/App_colors.dart';
import 'package:provider/provider.dart';

// typedef onCategoryClick = void Function(CategoryModel categoryModel);

class CategoryBuild extends StatelessWidget {
  CategoryBuild({
    super.key,
  });

  final List<CategoryModel> categories = CategoryModel.getAllCategories();
  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category \nof interest",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.pickCategoryColor, fontSize: 22),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 20,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  provider.changeSelectedWidget(
                    CategoryDetails(
                      category: categories[index],
                    ),
                  );
                  provider.changeAppBarTitle(categories[index].title);
                },
                child: CategoryWidget(
                  index: index,
                  category: categories[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
