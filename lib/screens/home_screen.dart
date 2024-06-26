import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'match_screen.dart';
import 'chat_list_screen.dart';
import '../models/profile.dart';

class HomeScreen extends StatelessWidget {
  final List<Profile> profiles = [
    Profile(
      name: 'Alex',
      imageUrl: 'https://example.com/image1.jpg',
      bio: 'Loves hiking and outdoor adventures.',
      interests: ['Hiking', 'Photography', 'Travel'],
    ),
    Profile(
      name: 'Jordan',
      imageUrl: 'https://example.com/image2.jpg',
      bio: 'Avid reader and coffee enthusiast.',
      interests: ['Reading', 'Coffee', 'Cooking'],
    ),
    Profile(
      name: 'Taylor',
      imageUrl: 'https://example.com/image3.jpg',
      bio: 'Tech geek and gamer.',
      interests: ['Gaming', 'Technology', 'Music'],
    ),
    // Add more profiles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatListScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profiles[index].imageUrl),
              ),
              title: Text(profiles[index].name),
              subtitle: Text(profiles[index].bio),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(profile: profiles[index]),
                  ),
                );
              },
              trailing: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchScreen(
                        user1: profiles[index],
                        user2: profiles[(index + 1) % profiles.length],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
