import 'dart:convert';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=a588bc64e84f4351b47f74c697ef6fe3'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'] ?? "",
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'] ?? "",
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a588bc64e84f4351b47f74c697ef6fe3'));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'] ?? "",
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'] ?? "",
          );
          news.add(articleModel);
        }
      });
    }
  }
}
