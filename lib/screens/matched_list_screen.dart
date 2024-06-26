import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'profile_screen.dart'; // Import the ProfileScreen

class MatchedListScreen extends StatelessWidget {
  final List<Profile> matchedProfiles;

  MatchedListScreen({required this.matchedProfiles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matched Profiles'),
      ),
      body: matchedProfiles.isEmpty
          ? Center(
              child: Text('No matches yet.'),
            )
          : ListView.builder(
              itemCount: matchedProfiles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(matchedProfiles[index].imageUrl),
                  ),
                  title: Text(matchedProfiles[index].name),
                  subtitle: Text(matchedProfiles[index].bio),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(profile: matchedProfiles[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
