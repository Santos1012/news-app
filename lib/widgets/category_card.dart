import 'package:flutter/material.dart';
import 'package:my_news_test/modules/category_module.dart';
import 'package:my_news_test/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final String country;

  const CategoryCard({super.key, required this.categoryModel, required this.country});


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CategoryView(
                categoryType: categoryModel, country: country,
              ),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 120,
          width: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                categoryModel.categoryImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            categoryModel.categoryName,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
