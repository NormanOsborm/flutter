import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import for Carousel Slider

void main() {
  runApp(MaterialApp(home: Carousel(), debugShowCheckedModeBanner: false));
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Widget> items = [
    Image.asset('assets/images/row-1-column-1.png', fit: BoxFit.fitWidth),
    Image.asset('assets/images/row-1-column-2.png', fit: BoxFit.fitWidth),
    Image.asset('assets/images/row-1-column-3.png', fit: BoxFit.fitWidth),
    Image.asset('assets/images/row-1-column-4.png', fit: BoxFit.fitWidth),
  ];

  // Function to handle page changes
  void callbackFunction(int index, CarouselPageChangedReason reason) {
    print("Current page: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarouselSlider(
          items: items,
          options: CarouselOptions(
            height: 1000,
            aspectRatio: 2048 / 2720,
            viewportFraction: 0.1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 1),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            enlargeCenterPage: false,
            enlargeFactor: 0.3,
            onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
