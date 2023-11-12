


import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_news_test/modules/article_module.dart';

class DioService {
  final Dio dio;
  final String categoryType;
  final String country;

  DioService({required this.dio, required this.categoryType, required this.country});


  Future<List<ArticleModule>> getTopHeadlineNews() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$categoryType&apiKey=752a4113ff71449c9c78c5e57fd3e067",
      );
      Map<String, dynamic> jsonData = response.data;
      List<ArticleModule> topHeadlineArticleList = [];
      List<dynamic> articles = jsonData["articles"];
      for (var element in articles) {
        topHeadlineArticleList.add(
         ArticleModule.fromJson(json: element)
        );
      }
      return topHeadlineArticleList;
    } on Exception catch (e) {
      log(e.toString());
      return [
        ArticleModule(
          articleTitle: "0",
          articleImage: "0",
          articleSubTitle: "0",
          articleUrl: "0",
        ),
      ];
    }
  }
}
