import 'package:flutter/material.dart';
import 'package:foodie_buddy/components/bottomnavigation.dart';



class camera extends StatefulWidget {
  const camera({super.key, required this.title});
  final String title;
  @override
  State<camera> createState() => _Profile();
}

class _Profile extends State<camera> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "camera",
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}