import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/laundries.dart';

import 'chat_page.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<Laundries> laundries;

  const ChatBodyWidget({
    required this.laundries,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: buildChats(),
        ),
      );

  Widget buildChats() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final laundry = laundries[index];

          return Container(
            height: 75,
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChatPage(laundry: laundry),
                ));
              },
              title: Text(laundry.laundry_name!),
            ),
          );
        },
        itemCount: laundries.length,
      );
}
