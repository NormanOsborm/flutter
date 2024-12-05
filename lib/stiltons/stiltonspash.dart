import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutterpro/stiltons/stiltonlog.dart';

void main() {
  runApp(const MaterialApp(
    home: Stiltonspash(),
    debugShowCheckedModeBanner: false,
  ));
}

class Stiltonspash extends StatefulWidget {
  const Stiltonspash({super.key});

  @override
  State<Stiltonspash> createState() => _StiltonspashState();
}

class _StiltonspashState extends State<Stiltonspash> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController!);

    // Timer for navigation after 6 seconds
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Stiltonlog()),
      );
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final backgroundColor = lightDynamic?.primary ?? const Color(0xFFFFFFFF);

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              image: const DecorationImage(
                image: AssetImage("assets/images/bg5.png"),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeInAnimation!,
                  child: const Image(
                    image: AssetImage("assets/images/Screenshot_2024-10-28_121217-removebg-preview.png"),
                    height: 300,
                    width: 300,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


