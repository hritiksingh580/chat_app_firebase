import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: Firestore.instance
              .collection('chats/NODlH95WgbWZccmAsYr9/message')
              .snapshots(),
          builder: (ctx, streamSnapShot) {
            if (streamSnapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final document = streamSnapShot.data.document;
            return ListView.builder(
                itemCount: document.length,
                itemBuilder: (ctx, index) => Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(document[index]['test']),
                    ));
          },
        ),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: () {}));
  }
}
