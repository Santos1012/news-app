import 'package:flutter/material.dart';
import 'package:my_news_test/modules/article_module.dart';
import 'package:my_news_test/modules/category_module.dart';
import 'package:my_news_test/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  final CategoryModel? categoryType;
  final List<ArticleModule> article;

  const NewsListView({super.key, this.categoryType, required this.article});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
        return NewsTile(
          article: article[index],
          categoryType: categoryType,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 22,
      ),
      itemCount: article.length,
    );
  }
}
