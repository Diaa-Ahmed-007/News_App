import 'package:news_app/models/ArticleResponse/article_model.dart';

class ArticleResponse {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;
  final Object? code;
  final Object? message;
  const ArticleResponse(
      {required this.code,
      required this.message,
      this.status,
      this.totalResults,
      this.articles});

  // Map<String, Object?> toJson() {
  //   return {
  //     'status': status,
  //     'totalResults': totalResults,
  //     'articles':
  //         articles?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
  //   };
  // }

  static ArticleResponse fromJson(Map<String, Object?> json) {
    return ArticleResponse(
      status: json['status'] == null ? null : json['status'] as String,
      totalResults:
          json['totalResults'] == null ? null : json['totalResults'] as int,
      articles: json['articles'] == null
          ? null
          : (json['articles'] as List)
              .map<ArticleModel>(
                  (data) => ArticleModel.fromJson(data as Map<String, Object?>))
              .toList(),
      code: json["code"],
      message: json["message"],
    );
  }
}
