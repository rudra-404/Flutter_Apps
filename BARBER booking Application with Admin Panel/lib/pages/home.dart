import 'package:barber/pages/booking.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2b1615),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section with greeting and profile picture
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello,",
                          style: TextStyle(
                            color: Color(0xFFdfa746),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Rudra Kaiser",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    height: 90.0,
                    width: 90.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "images/rk.jpg",
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              const Divider(color: Colors.white38),
              const SizedBox(height: 30.0),

              // Services header
              const Text(
                "Services",
                style: TextStyle(
                  color: Color(0xFFe29454),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),

              // Services Grid
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  _buildServiceCard(
                    context,
                    service: "Classic Shaving",
                    imagePath: "images/shaving.png",
                  ),
                  _buildServiceCard(
                    context,
                    service: "Hair Wash",
                    imagePath: "images/hair-wash.png",
                  ),
                  _buildServiceCard(
                    context,
                    service: "Hair Cutting",
                    imagePath: "images/hair-cutting.png",
                  ),
                  _buildServiceCard(
                    context,
                    service: "Beard Trimming",
                    imagePath: "images/beard-trimming.png",
                  ),
                  _buildServiceCard(
                    context,
                    service: "Facials",
                    imagePath: "images/facials.png",
                  ),
                  _buildServiceCard(
                    context,
                    service: "Kids Hair Cutting",
                    imagePath: "images/kids-hair-cutting.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required String service, required String imagePath}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Booking(service: service)),
        );
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 60) / 2, // Dynamic width
        height: 150.0,
        decoration: BoxDecoration(
          color: const Color(0xFFe29454),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10.0),
            Text(
              service,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
