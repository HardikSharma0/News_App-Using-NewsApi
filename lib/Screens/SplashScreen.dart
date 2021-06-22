import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../Screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      homeScreen();
    });
  }

  void homeScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NewsHeadlines()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.75,
            colors: [Colors.white, Colors.white60, Colors.white38, Colors.grey],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.network(Constant.news_image_url),
              Text(
                'Powered by Hardik Sharma',
                style: TextStyle(
                    wordSpacing: 5,
                    color: Colors.black87,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
