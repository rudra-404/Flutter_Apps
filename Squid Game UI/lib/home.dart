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
        backgroundColor: Color(0xFF025958),
        body: Stack(
          children: [
            Positioned(
              top: 130,
              left: 110,
              child: Square(
                size: 20,
                weight: 2,
              ),
            ),
            Positioned(
              top: 350,
              right: 50,
              child: Square(
                size: 40,
                weight: 5,
              ),
            ),
            Positioned(
              top: -400,
              right: -560,
              child: Circle(
                size: 800,
                weight: 65,
              ),
            ),
            Positioned(
              top: 160,
              left: -20,
              child: Circle(
                size: 100,
                weight: 10,
              ),
            ),
            Positioned(
              top: 290,
              left: 55,
              child: Triangle(
                size: 25,
              ),
            ),
            Positioned(
              top: 100,
              right: 30,
              child: Triangle(
                size: 60,
              ),
            ),
            Positioned(
              top: 450,
              right: 10,
              child: Image.asset(
                'assets/images/squid game text.png',
                scale: 3,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "@rudra",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 200,
                                spreadRadius: 5,
                                color: Colors.greenAccent.withOpacity(0.3),
                              )
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/solider.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Games(),
                        //   ),
                        // );
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40,
                              spreadRadius: 5,
                              color: Colors.greenAccent.withOpacity(0.7),
                            ),
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 3,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ],
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF046e3f),
                              Colors.greenAccent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[900]!,
                            width: 6,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          'Ready To Push The Button?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

class Square extends StatelessWidget {
  const Square({
    super.key,
    required this.size,
    required this.weight,
  });

  final double size;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFF5B2C8),
          width: weight,
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.size,
    required this.weight,
  });

  final double size;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color(0xFFF5B2C8),
          width: weight,
        ),
      ),
    );
  }
}

class Triangle extends StatelessWidget {
  const Triangle({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Transform.rotate(
        angle: 145,
        child: Icon(
          Icons.change_history,
          color: Color(0xFFF5B2C8),
          size: size,
        ),
      ),
    );
  }
}