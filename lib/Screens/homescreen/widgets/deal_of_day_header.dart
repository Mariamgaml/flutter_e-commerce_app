import 'package:flutter/material.dart';

class DealOfDayHeader extends StatelessWidget {
  const DealOfDayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Deal of the Day', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('22h 55m 20s remaining')
            ],
          ),
          TextButton(onPressed: () {}, child: Text('View all')),
        ],
      ),
    );
  }
}