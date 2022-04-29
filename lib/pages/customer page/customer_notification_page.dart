// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class customerNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
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
      body: ListView(
        children: [
          ListTile(
              title: Text(
                'Laundry 1',
                style: chatTitleTextStyle,
              ),
              subtitle: Text(
                'so basically, which is literally eventually blablabla',
                style: chatSubtitleTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              leading: Image.asset(
                'assets/profilepicture.png',
                width: 40,
                height: 40,
              ),
              trailing: Text(
                '10:00 PM',
                style: chatSubtitleTextStyle,
              )),
          Divider(
            thickness: 1,
            color: Color(0xffB1D0E0),
          ),
          ListTile(
            title: Text(
              'Laundry 2',
              style: chatTitleTextStyle,
            ),
            subtitle: Text(
              'yes that will be like that',
              style: chatSubtitleTextStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            leading: Image.asset(
              'assets/profilepicture.png',
              width: 40,
              height: 40,
            ),
            trailing: Text(
              'Yesterday',
              style: chatSubtitleTextStyle,
            ),
          ),
          Divider(
            thickness: 1,
            color: Color(0xffB1D0E0),
          ),
        ],
      ),
    );
  }
}
