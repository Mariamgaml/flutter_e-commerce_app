import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Beauty', 'Fashion', 'Kids', 'Mens', 'Womens'];
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              CircleAvatar(radius: 25, backgroundColor: Colors.grey[300]),
              SizedBox(height: 5),
              Text(categories[index]),
            ],
          ),
        ),
      ),
    );
  }
}