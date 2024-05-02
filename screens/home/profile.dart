
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Color(0xFFC9EFC6), // Set app bar color
        leading: BackButton(), // Add a back button
        title: Text('Profile'), // Set the title of the app bar
      ),
      body: Container(
        color: Color(0xFFC9EFC6), // Set background color
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 35), // Add some space between the app bar and the image
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_image.png'),
              ),
              SizedBox(height: 12), // Increase space between image and button
              TextButton(
                onPressed: () {}, // Add functionality to change profile picture
                child: Text('Change Profile', style: TextStyle(color: Colors.black)),
              ),
              Divider(), // Added a divider line
              SizedBox(height: 20), // Increase space between divider and text
              Text(
                'Niketh Anoop',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Increase space between texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                   'niketh124@gmail.com', // Added email address
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 12), // Increase space between texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    'Male',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 12), // Increase space between texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date of Birth:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    '10 Oct, 1994',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 12), // Increase space between texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Phone Number:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    '',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 12), // Increase space between texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'User ID:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    '45689',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 20), // Increase space between texts
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profession:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    'Student',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 32), // Increase space between texts and button
              TextButton(
                onPressed: () {}, // Add functionality to sign out
                child: Text('Sign Out', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}