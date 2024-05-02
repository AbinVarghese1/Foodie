import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signup');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, // set the height here
      width: 300, // set the width here
      child: Scaffold(
        backgroundColor: Color(0xFFC9EFC6), // hex color code for C9EFC6
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/Main-icon.png', // replace with your app logo
                  height: 350,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}