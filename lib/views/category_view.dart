import 'package:flutter/material.dart';
import 'package:my_news_test/modules/category_module.dart';
import 'package:my_news_test/widgets/news_future_list_view_widget.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryType;
  final String country;

  const CategoryView(
      {super.key, required this.categoryType, required this.country});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              categoryType.categoryName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          slivers: [
            NewsFutureListView(
              categoryType: categoryType,
              country: country,
            ),
          ],
        ),
      ),
    );
  }
}
