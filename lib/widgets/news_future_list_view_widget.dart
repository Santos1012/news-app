import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_news_test/modules/article_module.dart';
import 'package:my_news_test/modules/category_module.dart';
import 'package:my_news_test/service/dio_service.dart';
import 'package:my_news_test/widgets/news_list_view.dart';

class NewsFutureListView extends StatefulWidget {
  final CategoryModel? categoryType;
  final String country;

  const NewsFutureListView(
      {super.key, this.categoryType, required this.country});

  @override
  State<NewsFutureListView> createState() => _NewsFutureListViewState();
}

class _NewsFutureListViewState extends State<NewsFutureListView> {
  late Future<List<ArticleModule>> articles;

  @override
  void initState() {
    articles = DioService(
      dio: Dio(),
      categoryType:
          widget.categoryType?.categoryName.toLowerCase() ?? "general",
      country: widget.country,
    ).getTopHeadlineNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModule>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data![0].articleImage == "0"
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "\nOpps Something Getting wrong,\n Please try again Later.",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                )
              : NewsListView(
                  article: snapshot.data!,
                  categoryType: widget.categoryType,
                );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
