import 'package:flutter/material.dart';
import 'package:my_news_test/modules/category_module.dart';
import 'package:my_news_test/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryModel> categories = const [
    CategoryModel(
      categoryName: "General",
      categoryImage: "assets/general.jpg",
    ),
    CategoryModel(
      categoryName: "Business",
      categoryImage: "assets/business.jpg",
    ),
    CategoryModel(
      categoryName: "Entertainment",
      categoryImage: "assets/entertaiment.jpg",
    ),
    CategoryModel(
      categoryName: "Health",
      categoryImage: "assets/health.jpg",
    ),
    CategoryModel(
      categoryName: "Science",
      categoryImage: "assets/science.jpg",
    ),
    CategoryModel(
      categoryName: "Technology",
      categoryImage: "assets/technology.jpeg",
    ),
    CategoryModel(
      categoryName: "Sports",
      categoryImage: "assets/sports.jpg",
    ),
  ];
  final String country;

  const CategoryListView({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryModel: categories[index], country:country,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        itemCount: categories.length,
      ),
    );
  }
}
