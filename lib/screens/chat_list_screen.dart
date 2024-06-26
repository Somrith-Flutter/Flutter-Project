import 'package:flutter/material.dart';
import 'chat_screen.dart';
import '../models/chat.dart';

class ChatListScreen extends StatelessWidget {
  final List<Chat> chats = [
    Chat(
      name: 'Alex',
      imageUrl: 'https://example.com/image1.jpg',
      lastMessage: 'Hey, how are you?',
    ),
    Chat(
      name: 'Jordan',
      imageUrl: 'https://example.com/image2.jpg',
      lastMessage: 'Let\'s meet up tomorrow!',
    ),
    Chat(
      name: 'Taylor',
      imageUrl: 'https://example.com/image3.jpg',
      lastMessage: 'Did you watch the game last night?',
    ),
    // Add more chats as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[index].imageUrl),
            ),
            title: Text(chats[index].name),
            subtitle: Text(chats[index].lastMessage),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    matchName: chats[index].name,
                    matchImageUrl: chats[index].imageUrl,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
