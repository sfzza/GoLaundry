import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class ProgressAdminCard extends StatefulWidget {
  const ProgressAdminCard({Key? key}) : super(key: key);

  @override
  State<ProgressAdminCard> createState() => _ProgressAdminCardState();
}

class _ProgressAdminCardState extends State<ProgressAdminCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xffB1D0E0),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "nurulizza.safira@gmail.com",
                  style: bookingEmailTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "jalan banyuwangi nomor 56 blok A Waru Sidoarjo Jawa Timur Indonesia",
                  style: bookingAddressTextStyle,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Total: ",
                      style: bookingTotalTextStyle,
                    ),
                    Text(
                      "RP 7000",
                      style: bookingEmailTextStyle,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 48,
                        height: 21,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {},
                          child: Text(""),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 48,
                        height: 21,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {},
                          child: Text(
                            "",
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
