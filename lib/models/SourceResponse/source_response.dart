import 'package:news_app/models/SourceResponse/source.dart';

class SourceResponse {
  final String? status;
  final List<Source>? sources;
  final Object? code;
  final Object? message;
  const SourceResponse(
      {required this.code,
      required this.message,
      required this.status,
      required this.sources});

  //maybe need to be Map<String,dynamic>
  static SourceResponse fromJson(Map<String, Object?> json) {
    return SourceResponse(
      status: json['status'] == null ? null : json['status'] as String,
      sources: json['sources'] == null
          ? null
          : (json['sources'] as List)
              .map<Source>(
                  (data) => Source.fromJson(data as Map<String, Object?>))
              .toList(),
      code: json["code"] ,
      message: json["message"],
    );
  }
  
}
