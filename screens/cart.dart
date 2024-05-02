import 'package:flutter/material.dart';
import 'package:foodie_buddy/components/bottomnavigation.dart';

class cart extends StatefulWidget {
  const cart({super.key, required this.title});
  final String title;
  @override
  State<cart> createState() => _Profile();
}

class _Profile extends State<cart> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xFFC9EFC6),

      body: Center(
        child: Column(
          children: [
            Text(
              "cart",
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}