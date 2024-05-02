// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_buddy/screens/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  String? _gender;
  String? _passwordError;
  String? _emptyFieldError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC9EFC6),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create an account',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(
                  hintText: 'User name',
                  controller: _userNameController,
                  icon: Icons.account_circle,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  icon: Icons.email,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  hintText: 'Profession',
                  controller: _professionController,
                  icon: Icons.work,
                ),
                SizedBox(height: 20),
                _buildDropdownField(
                  hintText: 'Gender',
                  value: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as String?;
                    });
                  },
                  items: ['Male', 'Female'],
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  icon: Icons.lock,
                  isObscure: true,
                  errorText: _passwordError,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  hintText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  icon: Icons.lock,
                  isObscure: true,
                  errorText: _passwordError,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4AA469),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                if (_emptyFieldError != null)
                  Text(
                    _emptyFieldError!,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    IconData? icon,
    bool isObscure = false,
    String? errorText,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: Colors.black,
            obscureText: isObscure,
            onChanged: (_) {
              setState(() {
                _emptyFieldError = null;
                _passwordError = null;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field cannot be empty';
              }
              return null;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
              icon: icon != null
                  ? Icon(
                      icon,
                      color: Colors.black,
                    )
                  : null,
            ),
          ),
          if (errorText != null)
            Text(
              errorText,
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required String hintText,
    required String? value,
    required Function(dynamic) onChanged,
    required List<String> items,
    IconData? icon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: Colors.black,
            ),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: value,
              icon: Container(),
              onChanged: (newValue) {
                setState(() {
                  _emptyFieldError = null;
                  _passwordError = null;
                  _gender = newValue;
                });
                onChanged(newValue);
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field cannot be empty';
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.only(left: icon != null ? 10 : 0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await FirebaseFirestore.instance.collection('userdata').doc(userCredential.user!.uid).set({
        'username': _userNameController.text,
        'email': _emailController.text,
        'profession': _professionController.text,
        'gender': _gender,
      });

      _userNameController.clear();
      _emailController.clear();
      _professionController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      setState(() {
        _gender = null;
        _emptyFieldError = null;
        _passwordError = null;
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyLoginPage()),
      );
    } catch (e) {
      print('Failed to sign up: $e');
      // Handle sign-up failure
    }
  }
}
