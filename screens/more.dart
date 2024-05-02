import 'package:flutter/material.dart';
import 'package:foodie_buddy/components/bottomnavigation.dart';

class more extends StatefulWidget {
  const more({super.key, required this.title});
  final String title;
  @override
  State<more> createState() => _Profile();
}

class _Profile extends State<more> {
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
              "more",
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}