import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data .dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: 200,
      ),
    ));
  }
}
//DUMMY_CATEGORIES .map((catData) => CategoryItem(catData.id, catData.title, catData.color)) .toList(),