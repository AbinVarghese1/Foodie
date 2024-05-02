// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  String? _usernameError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFC9EFC6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Main-icon.png", height: 250, width: 250),
                const SizedBox(height: 32.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Mobile number or email address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) => _username = value!,
                  ),
                ),
                if (_usernameError != null) Text(_usernameError!), // Display username error
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                    obscureText: true,
                  ),
                ),
                if (_passwordError != null) Text(_passwordError!), // Display password error
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _signInWithEmailAndPassword();
                    }
                  },
                  child: const Text('Log in'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF4AA469)),
                    minimumSize: MaterialStateProperty.all(const Size(120, 40)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {
                    // Handle forgot password here
                  },
                  child: const Text('Forgot password?'),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _username,
        password: _password,
      );
      print('Signed in successfully with user ${userCredential.user!.uid}');
      Navigator.pushReplacementNamed(context, '/homepage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _usernameError = 'No user found for that email';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _passwordError = 'Wrong password provided for that user';
        });
      }
    }
  }
}
