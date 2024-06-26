import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/matched_list_screen.dart'; // Add matched list screen import
import 'models/profile.dart';


void main() {
  runApp(DatingApp());
}

class DatingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/matched_list': (context) => MatchedListScreen(
          matchedProfiles: [
            Profile(
              name: 'User1',
              imageUrl: 'https://example.com/image1.jpg',
              bio: 'Bio1',
              interests: ['Interest1', 'Interest2'],
            ),
            Profile(
              name: 'User2',
              imageUrl: 'https://example.com/image2.jpg',
              bio: 'Bio2',
              interests: ['Interest3', 'Interest4'],
            ),
          ],
        ),
      },
    );
  }
}
