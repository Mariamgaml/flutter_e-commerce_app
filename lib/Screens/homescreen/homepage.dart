import 'package:flutter/material.dart';

class StylishHomePage extends StatelessWidget {
  final List<String> categories = ['Beauty', 'Fashion', 'Kids', 'Mens', 'Womens'];

   StylishHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 32),
            SizedBox(width: 8),
            Text(
              'Stylish',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // 🔍 Search bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search any Product...",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),

          // 🟡 All Featured (horizontal list)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('All Featured', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  Icon(Icons.sort, size: 20),
                  SizedBox(width: 8),
                  Icon(Icons.filter_list, size: 20),
                ],
              )
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 22,
                        child: Icon(Icons.image, size: 20, color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(categories[index], style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
