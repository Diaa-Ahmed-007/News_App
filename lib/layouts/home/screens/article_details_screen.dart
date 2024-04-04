import 'package:flutter/material.dart';

import 'package:news_app/layouts/home/provider/home_provider.dart';
import 'package:news_app/layouts/home/widgets/article_details_widget.dart';
import 'package:news_app/models/ArticleResponse/article_model.dart';
import 'package:provider/provider.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});
  static const String routeName = "ArticlePage";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var hight = MediaQuery.of(context).size.height;
    var article = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/BG.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: hight * 0.08,
          title: Text(provider.appBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ArticleDetailsWidget(article: article, hight: hight),
        ),
      ),
    );
  }
}
