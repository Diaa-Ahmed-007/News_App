import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/layouts/home/screens/article_details_screen.dart';
import 'package:news_app/models/ArticleResponse/article_model.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.article,
  });
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArticleDetailsScreen.routeName,
            arguments: article);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage!,
              height: hight * 0.29,
              width: double.infinity,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text(
            article.source!.name ?? "",
          ),
          Text(
            article.title ?? "",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              DateFormat("yyyy-MM-dd hh:mm").format(
                DateTime.parse(article.publishedAt ?? ""),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
