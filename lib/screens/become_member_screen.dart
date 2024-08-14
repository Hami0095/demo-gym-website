import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BecomeMemberScreen extends StatelessWidget {
  const BecomeMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.yellow,
        title: const Text('Become a Member'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(16),
                child: Lottie.asset("assets/animation.json")),
            const Text(
              "Let's MAKE a DEAL and START your OWN MEMBERSHIP!",
              style: TextStyle(color: Colors.yellow, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
