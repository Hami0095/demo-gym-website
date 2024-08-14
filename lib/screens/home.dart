import 'package:demo_gym_website/widgets/hero_section.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_section.dart';
import '../widgets/navbar.dart';
import '../widgets/programs_section.dart';
import 'about_us_screen.dart';
import 'become_member_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(double position) {
    _scrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Navbar(
          onAboutUsTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsScreen()),
            );
          },
          onContactUsTap: () => _scrollToSection(1000), // Adjust this position
          onProgramsTap: () => _scrollToSection(500), // Adjust this position
          onBecomeMemberTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const BecomeMemberScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            // Hero Section
            HeroSection(),

            // Our Programs Section
            ProgramSection(),

            // Contact Us Section
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
