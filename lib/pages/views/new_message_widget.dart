// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controllers/firebase_api.dart';
import '../../theme.dart';
import '../global/global.dart';

class NewMessageWidget extends StatefulWidget {
  final String id_laundry;

  const NewMessageWidget({
    required this.id_laundry,
  });

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';
  String id_cust = currentFirebaseUser!.uid;

  void sendMessage() async {
    FocusScope.of(context).unfocus();

    await FirebaseApi.uploadCustMessage(id_cust, message, widget.id_laundry);

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) => Container(
        color: Color(0xff6998AB),
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                style: textFieldTextStyle,
                autocorrect: false,
                controller: _controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Color(0xff406882), width: 3)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Color(0xff1A374D), width: 3)),
                  fillColor: Color(0xffB1D0E0),
                  hintText: 'Type your message',
                  hintStyle: hintTextStyle,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0),
                    gapPadding: 10,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onChanged: (value) => setState(() {
                  message = value;
                }),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: message.trim().isEmpty ? null : sendMessage,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffB1D0E0),
                ),
                child: Icon(
                  Icons.send,
                  color: Color(0xff2C88D9),
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      );
}
