import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layouts/home/screens/web_view_screen.dart';
import 'package:news_app/models/ArticleResponse/article_model.dart';
import 'package:intl/intl.dart' as format;

class ArticleDetailsWidget extends StatelessWidget {
  const ArticleDetailsWidget({
    super.key,
    required this.article,
    required this.hight,
  });

  final ArticleModel article;
  final double hight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage!,
            height: hight * 0.29,
            width: double.infinity,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Text(article.source!.name ?? ""),
        Text(
          article.title ?? "",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        SizedBox(
          height: hight * 0.01,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            format.DateFormat("yyyy-MM-dd hh:mm").format(
              DateTime.parse(article.publishedAt ?? ""),
            ),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: hight * 0.07,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(article.description ?? "",
              style: Theme.of(context).textTheme.titleSmall),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => NewsWebViewScreen(urlView: article.url??""),));
              },
              icon: const Icon(Icons.arrow_left_outlined),
              label: const Text("View Full Article"),
            ),
          ),
        )
      ],
    );
  }
}
