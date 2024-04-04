import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/ArticleResponse/article_response.dart';
import 'package:news_app/models/SourceResponse/source_response.dart';

class ApiManager {
  static const String apiKey = "172d26aaa193453198cd2c85ae17d69a";
  static const String baseUrl = "newsapi.org";
  static const String topHeadLine = "/v2/top-headlines/sources";
  static const String everything = "/v2/everything";
  static Future<SourceResponse> getSources(
      {String categoryId = "Sports"}) async {
    var url = Uri.https(
      baseUrl,
      topHeadLine,
      {"apiKey": apiKey, "category": categoryId},
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    return sourceResponse;
  }

  static Future<ArticleResponse> getNews({required String source, String? searchValue}) async {
    var url = Uri.https(baseUrl, everything, {
      "apiKey": apiKey,
      "language": "en",
      "sources": source,
      "q":searchValue,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticleResponse articleResponse = ArticleResponse.fromJson(json);
    return articleResponse;
  }
}
