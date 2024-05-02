import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie_buddy/screens/home/homepage.dart';
import 'package:foodie_buddy/screens/signup/SignUpPage.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure this happens in the same context
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Buddy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: SplashScreen(),
      home: homepage(),
      //home: ProfileScreen(),

      
      routes: {
        '/signup': (context) => SignUpPage(),
        '/homepage': (context) => homepage(),
      },
    );
  }
}
