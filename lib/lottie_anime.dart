import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
void main(){
  runApp(MaterialApp(home: LottieAnime(),debugShowCheckedModeBanner: false,));
}
class LottieAnime extends StatefulWidget {
  const LottieAnime({super.key});

  @override
  State<LottieAnime> createState() => _LottieAnimeState();
}

class _LottieAnimeState extends State<LottieAnime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/Anime/Animation - 1725864809467.json" ),
      ),
    );
  }
}
