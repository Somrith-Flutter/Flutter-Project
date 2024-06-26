import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'chat_screen.dart';

class MatchScreen extends StatelessWidget {
  final Profile user1;
  final Profile user2;

  MatchScreen({required this.user1, required this.user2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('It\'s a Match!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have matched with',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user1.imageUrl),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user1.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user2.imageUrl),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user2.name,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Start a conversation now!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      matchName: user2.name,
                      matchImageUrl: user2.imageUrl,
                    ),
                  ),
                );
              },
              child: Text('Chat Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
