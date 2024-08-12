import 'package:flutter/material.dart';

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Programs',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ProgramCard(
                title: 'Fat Burnout',
                description: 'High intensity workouts to burn fat quickly.',
                titleColor: Colors.blue,
              ),
              ProgramCard(
                title: 'Cutting Leopard',
                description: 'Precision training for muscle definition.',
                titleColor: Colors.black,
              ),
              ProgramCard(
                title: 'Bulking Bear',
                description: 'Strength and mass gaining programs.',
                titleColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText(
    this.text, {
    super.key,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}

class ProgramCard extends StatelessWidget {
  final String title;
  final String description;
  final Color titleColor;

  const ProgramCard({
    super.key,
    required this.title,
    required this.description,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Increased width for the cards
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
