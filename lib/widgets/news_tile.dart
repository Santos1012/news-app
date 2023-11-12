import 'package:flutter/material.dart';
import 'package:my_news_test/modules/article_module.dart';
import 'package:my_news_test/modules/category_module.dart';
import 'package:my_news_test/views/news_tile_webview.dart';

class NewsTile extends StatelessWidget {
  final ArticleModule article;
  final CategoryModel? categoryType;

  const NewsTile({super.key, required this.article, this.categoryType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => NewsTileWebView(
              url: article.articleUrl, header: article.articleTitle),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              6,
            ),
            child: Image.network(
              article.articleImage ??
                  categoryType?.categoryImage ??
                  "assets/general.jpg",
              height: 200,
              scale: 1,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                categoryType?.categoryImage ?? "assets/general.jpg",
                height: 200,
                scale: 1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            article.articleTitle,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            article.articleSubTitle ?? "No Describtion",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
