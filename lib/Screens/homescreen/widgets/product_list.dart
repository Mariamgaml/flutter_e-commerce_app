import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          ProductCard(
            name: 'Women Printed Kurta',
            price: '₹1500',
            image: 'assets/kurta.png',
            discount: '40% OFF',
            rating: '★ 4.5',
          ),
          ProductCard(
            name: 'HRX by Hrithik Roshan',
            price: '₹2499',
            image: 'assets/shoe.png',
            discount: '50% OFF',
            rating: '★ 4.8',
          ),
        ],
      ),
    );
  }
}