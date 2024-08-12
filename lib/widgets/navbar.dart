import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('DENO GYM', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('About Us', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {},
          child:
              const Text('Contact Us', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {},
          child:
              const Text('Our Packages', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Classes', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Become a Member'),
        ),
      ],
    );
  }
}
