import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String rating;
  final String discount;

  const ProductCard({super.key, required this.name, required this.price, required this.image, required this.rating, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 100),
          Text(name, maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text(discount, style: TextStyle(color: Colors.red)),
              SizedBox(width: 5),
              Text(rating, style: TextStyle(color: Colors.orange)),
            ],
          )
        ],
      ),
    );
  }
}