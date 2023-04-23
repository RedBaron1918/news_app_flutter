import 'dart:convert';
import 'package:newsapp/model/news_model.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<List<Article>> getData() async {
    final params = {
      'country': 'us',
      'apiKey': 'f571d963be194d0c9f6ea51ac19f3d2b'
    };
    final uri = Uri.https('newsapi.org', '/v2/top-headlines', params);
    final response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
  }
}
