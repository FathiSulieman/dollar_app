import 'dart:convert';

import 'package:dollar/news/models/us_business_article.dart';
import 'package:http/http.dart' as http;

class NewsService {
//https://newsapi.org/

  Future<List<Article>> getBusinessNews() async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e888eb5a9211414695ab14626f6876d4');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var decodedJson = jsonDecode(response.body);
      List s = decodedJson['articles'];
      return s.map((article) => Article.fromJson(article)).toList();
    } on Exception catch (e) {
      print(e);
      return [];
    }
  }
}
