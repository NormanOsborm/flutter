import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterpro/bodha/bodhalog.dart';

import 'package:flutterpro/bodha/bodhareg.dart';

void main() {
  runApp(MaterialApp(home: BodhaSplash(),debugShowCheckedModeBanner: false,));
}

class BodhaSplash extends StatefulWidget {
  @override
  State<BodhaSplash> createState() => _BodhaSplashState();
}

class _BodhaSplashState extends State<BodhaSplash> with TickerProviderStateMixin {

  AnimationController? _animationController;
  Animation<double>? _fadeInAnimation;

  @override
  void initState() {
    super.initState();


    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );


    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController as Animation<double>);


    _animationController?.forward();

    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Bodhalog(name: '',)),
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/white.png"),
            fit: BoxFit.fill,
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
              image: AssetImage("assets/images/Boddha_transparent-.png"),
              height: 300,
              width: 300,
            ),
          ),


          ],
        ),
      ),
    );
  }
}