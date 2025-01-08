import 'package:barber/pages/booking.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/barber.jpg"),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 25.0
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFdf711a), // df711a & dfa746
                  borderRadius: BorderRadius.circular(50.0)
              ),
              child: Text(
                "Get A Stylish Haircut",
                style: TextStyle(
                  color: Colors.white, // 2b1615
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
