import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../chats/message_bubble.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('chat').orderBy('CreatedAt', descending: true).snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final chatData = chatSnapshot.data.documents;
        return ListView.builder(
          reverse: true,
          itemCount: chatData.length,
          itemBuilder: (ctx, index) => MessageBubble(chatData[index]['text'])
        );
      },
    );
  }
}
