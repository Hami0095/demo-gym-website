import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/programs_section.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/quote_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Navbar(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSection(),
            ProgramsSection(),
            WhyChooseUsSection(),
            QuoteSection(),
            TestimonialsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
