import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/laundries.dart';

import '../../controllers/firebase_api.dart';
import '../../theme.dart';
import 'chat_body_widget.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'NOTIFICATION',
              style: titlePageTextStyle,
            ),
            elevation: 0,
            backgroundColor: Color(0xffB1D0E0),
          ),
          preferredSize: Size.fromHeight(80),
        ),
        backgroundColor: Color(0xFF6998AB),
        body: SafeArea(
          child: StreamBuilder<List<Laundries>>(
            stream: FirebaseApi.getLaundriesChatList(),
            builder: (context, snapshotLaundry) {
              // print(snapshotTech.data);
              switch (snapshotLaundry.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshotLaundry.hasError) {
                    print(snapshotLaundry.error);
                    return buildText('Something Went Wrong Try later');
                  } else {
                    final laundry = snapshotLaundry.data;

                    if (laundry!.isEmpty) {
                      return buildText('No Users Found');
                    } else {
                      return Column(
                        children: [ChatBodyWidget(laundries: laundry)],
                      );
                    }
                  }
              }
            },
          ),
        ),
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}
