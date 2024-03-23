import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;
  final Color color;
  const CategoryModel(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});

  static List<CategoryModel> getAllCategories() => [
        const CategoryModel(
            id: "sports",
            title: "Sports",
            imagePath: "sports.png",
            color: Color(0xffC91C22)),
        const CategoryModel(
            id: "general",
            title: "General",
            imagePath: "Politics.png",
            color: Color(0xff003E90)),
        const CategoryModel(
            id: "health",
            title: "Health",
            imagePath: "health.png",
            color: Color(0xffED1E79)),
        const CategoryModel(
            id: "business",
            title: "Business",
            imagePath: "business.png",
            color: Color(0xffCF7E48)),
        const CategoryModel(
            id: "technology",
            title: "Technology",
            imagePath: "technology.png",
            color: Color(0xff4882CF)),
        const CategoryModel(
            id: "science",
            title: "Science",
            imagePath: "science.png",
            color: Color(0xffF2D352)),
      ];
}
