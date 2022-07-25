// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

import '../models/message.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageWidget({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(15);
    final borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          margin: EdgeInsets.only(bottom: 16, right: 16, left: 16),
          constraints: BoxConstraints(maxWidth: 140),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.8, 1.8),
                blurRadius: 2.0,
              )
            ],
            color: isMe ? Color(0xffB1D0E0) : Color(0xFF406882),
            borderRadius: isMe
                ? borderRadius.subtract(BorderRadius.only(bottomRight: radius))
                : borderRadius.subtract(BorderRadius.only(bottomLeft: radius)),
          ),
          child: buildMessage(),
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.message,
            style:
                TextStyle(color: isMe ? Color(0xff1A374D) : Color(0xffB1D0E0)),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
        ],
      );
}
