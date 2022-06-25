import 'package:flutter/material.dart';

import '../../theme.dart';

class OnprogressCustomerCard extends StatefulWidget {
  const OnprogressCustomerCard({Key? key}) : super(key: key);

  @override
  State<OnprogressCustomerCard> createState() => _OnprogressCustomerCardState();
}

class _OnprogressCustomerCardState extends State<OnprogressCustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xffB1D0E0),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Laundry Name: ",
                    style: bookingTotalTextStyle,
                  ),
                  Text(
                    "Simple Laundry",
                    style: bookingEmailTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
