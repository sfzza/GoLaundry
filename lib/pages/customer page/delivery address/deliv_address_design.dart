// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:golaundry/maps/maps.dart';
import 'package:golaundry/pages/assistant_method/address_changer.dart';
import 'package:golaundry/pages/models/address.dart';
import 'package:golaundry/pages/models/deliv_address.dart';
import 'package:golaundry/theme.dart';
import 'package:provider/provider.dart';

import '../../widgets/error_dialog.dart';

class DelivAddressDesign extends StatefulWidget {
  final DelivAddress? model;
  final int? selectedIndex;
  final int? value;
  final String? addressID;

  DelivAddressDesign(
      {this.model, this.selectedIndex, this.value, this.addressID});

  @override
  State<DelivAddressDesign> createState() => _DelivAddressDesignState();
}

class _DelivAddressDesignState extends State<DelivAddressDesign> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffB1D0E0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Text(
                      widget.model!.delivAddress.toString(),
                      style: addressTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 15),
            child: Container(
              width: 400,
              height: 40,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // MapUtils.openMapWithPosition(
                  //   widget.model!.lat!, widget.model!.lng!);
                  if (widget.model!.delivAddress == null) {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorDialog(
                            message: "enter your address first.",
                          );
                        });
                  } else {
                    MapUtils.openMapWithAddress(widget.model!.delivAddress!);
                  }
                },
                child: Text('check on map'),
                style: ElevatedButton.styleFrom(primary: Color(0xff2C88D9)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
