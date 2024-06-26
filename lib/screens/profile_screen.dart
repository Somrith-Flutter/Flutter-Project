// Update your existing profile_screen.dart file
import 'package:flutter/material.dart';
//import 'profile.dart'; // Import the Profile model class
import '../models/profile.dart';


class ProfileScreen extends StatelessWidget {
  final Profile profile;

  ProfileScreen({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(profile.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profile.imageUrl),
              ),
              SizedBox(height: 20),
              Text(
                profile.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                profile.bio,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Interests',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: profile.interests
                    .map((interest) => Chip(
                          label: Text(interest),
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              // Add additional UI elements as needed
            ],
          ),
        ),
      ),
    );
  }
}
