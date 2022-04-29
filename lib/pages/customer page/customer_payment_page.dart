import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class customerPaymentPage extends StatefulWidget {
  @override
  State<customerPaymentPage> createState() => _customerPaymentPageState();
}

class _customerPaymentPageState extends State<customerPaymentPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget SelectedPayment(int index, String payment) {
      return GestureDetector(
        onTap: () => setState(
          () {
            selectedIndex = index;
          },
        ),
        child: Container(
          height: 129,
          width: 360,
          decoration: BoxDecoration(
            color: Color(0xffB1D0E0),
            border: Border.all(
              width: 2,
              color: selectedIndex == index
                  ? Color(0xff1A374D)
                  : Color(0xff6998AB),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, top: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment,
                  style: addressTextStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 38,
                ),
                selectedIndex == index
                    ? Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Color(0xff1A374D),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'your current payment',
                            style: addressStatusTextStyle,
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'PAYMENT METHOD',
            style: titlePageTextStyle,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Color(0xff1A374D),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Color(0xffB1D0E0),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 21,
            ),
            SelectedPayment(0, 'Cash of delivery'),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle_rounded,
                  size: 40,
                  color: Color(0xffB1D0E0),
                ))
          ],
        ),
      ),
    );
  }
}
