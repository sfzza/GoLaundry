import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class ProgressAdminCard extends StatefulWidget {
  // const ProgressAdminCard({Key? key}) : super(key: key);
  final String cust_email;
  final String cust_address;
  final String total;
  ProgressAdminCard(
      {required this.cust_address,
      required this.cust_email,
      required this.total});
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
                  widget.cust_email,
                  style: bookingEmailTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.cust_address,
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
                      widget.total,
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
