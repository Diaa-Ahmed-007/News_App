import 'package:news_app/models/SourceResponse/source.dart';

class ArticleModel {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const ArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  // Map<String, Object?> toJson() {
  //   return {
  //     'source': Source.toJson(),
  //     'author': author,
  //     'title': title,
  //     'description': description,
  //     'url': url,
  //     'urlToImage': urlToImage,
  //     'publishedAt': publishedAt,
  //     'content': content
  //   };
  // }

  static ArticleModel fromJson(Map<String, Object?> json) {
    return ArticleModel(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, Object?>),
        author: json['author'] == null ? null : json['author'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        urlToImage:
            json['urlToImage'] == null ? null : json['urlToImage'] as String,
        publishedAt:
            json['publishedAt'] == null ? null : json['publishedAt'] as String,
        content: json['content'] == null ? null : json['content'] as String);
  }
}
