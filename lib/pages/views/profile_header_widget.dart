// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/laundry_page.dart';

import '../../theme.dart';
import '../customer page/add_details_page.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String id_laundry;

  const ProfileHeaderWidget({
    required this.name,
    required this.id_laundry,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(color: Color(0xff6998AB)),
        height: 80,
        padding: EdgeInsets.all(16).copyWith(left: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  color: Color(0xff1A374D),
                ),
                Expanded(
                  child: Text(
                    name,
                    style: titlePageTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // buildIcon(Icons.call),
                    // SizedBox(width: 12),
                    // buildIcon(Icons.videocam),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) =>
                                  AddDetailsPage(id_laundry: id_laundry),
                            ));
                      },
                      child: const Text("Book"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff2C88D9),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                    ),
                  ],
                ),
                SizedBox(width: 4),
              ],
            )
          ],
        ),
      );

  Widget buildIcon(IconData icon) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white54,
        ),
        child: Icon(icon, size: 25, color: Colors.white),
      );
}
