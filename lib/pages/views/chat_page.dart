import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/laundries.dart';
import 'package:golaundry/pages/views/messages_widget.dart';
import 'package:golaundry/pages/views/profile_header_widget.dart';

import 'new_message_widget.dart';

class ChatPage extends StatefulWidget {
  // final Customer customer;
  final Laundries laundry;

  const ChatPage({
    required this.laundry,
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFF7B4067),
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(
                  name: widget.laundry.laundry_name.toString(),
                  id_laundry: widget.laundry.id_laundry!),
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
                  child: MessagesWidget(
                    id_laundry: widget.laundry.id_laundry!,
                  ),
                ),
              ),
              NewMessageWidget(id_laundry: widget.laundry.id_laundry!)
            ],
          ),
        ),
      );
}
