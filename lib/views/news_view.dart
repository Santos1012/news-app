import 'package:flutter/material.dart';
import 'package:my_news_test/widgets/category_list_view_widget.dart';
import 'package:my_news_test/widgets/news_future_list_view_widget.dart';

class NewsView extends StatelessWidget {
  final String country;

  const NewsView({super.key, required this.country});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
             SizedBox(
              width: 20,
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
            physics: const BouncingScrollPhysics(),
            slivers: [
               SliverToBoxAdapter(
                child: CategoryListView(country: country,),
              ),
              NewsFutureListView(
                country: country,
              ),
            ],
          )),
    );
  }
}
