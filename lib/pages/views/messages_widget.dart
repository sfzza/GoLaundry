import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/views/message_widget.dart';
import 'package:golaundry/theme.dart';

import '../../controllers/firebase_api.dart';
import '../models/message.dart';

// import '../data.dart';

class MessagesWidget extends StatelessWidget {
  final String id_laundry;

  const MessagesWidget({
    required this.id_laundry,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Message>>(
        stream: FirebaseApi.getLaundryMessages(
            id_laundry, currentFirebaseUser!.uid),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return buildText('Something Went Wrong Try later');
              } else {
                final messages = snapshot.data;
                print(messages!.length);
                return messages.isEmpty
                    ? buildText('Say hi...')
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          print(message.userId);
                          return MessageWidget(
                            message: message,
                            isMe: message.userId == currentFirebaseUser!.uid,
                          );
                        },
                      );
              }
          }
        },
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: noHistoryTextStyle,
        ),
      );
}
