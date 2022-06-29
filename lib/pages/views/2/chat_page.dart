import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../messages_widget.dart';
import '../new_message_widget.dart';
import '../profile_header_widget.dart';

class ChatPage2 extends StatefulWidget {
  // final Customer customer;
  final String id_laundry;

  const ChatPage2({
    required this.id_laundry,
    Key? key,
  }) : super(key: key);

  @override
  _ChatPage2State createState() => _ChatPage2State();
}

class _ChatPage2State extends State<ChatPage2> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFF7B4067),
        body: SafeArea(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("admins")
                  .doc(widget.id_laundry)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator.adaptive();
                }
                return Column(
                  children: [
                    ProfileHeaderWidget(
                        name: snapshot.data!['laundry_name'].toString(),
                        id_laundry: widget.id_laundry),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: MessagesWidget(id_laundry: widget.id_laundry),
                      ),
                    ),
                    NewMessageWidget(id_laundry: widget.id_laundry)
                  ],
                );
              }),
        ),
      );
}
