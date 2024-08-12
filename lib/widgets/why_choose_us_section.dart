import 'package:flutter/material.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Choose Us?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center, size: 48, color: Colors.blue),
                  SizedBox(height: 5),
                  Text('Quality Equipment'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.restaurant, size: 48, color: Colors.blue),
                  SizedBox(height: 5),
                  Text('Nutrition'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.local_dining, size: 48, color: Colors.blue),
                  SizedBox(height: 5),
                  Text('Healthy Diet Plan'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.sports, size: 48, color: Colors.blue),
                  SizedBox(height: 5),
                  Text('Sports Training'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
