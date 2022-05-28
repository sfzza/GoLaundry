import 'package:flutter/material.dart';
import 'package:golaundry/maps/maps.dart';
import 'package:golaundry/pages/assistant_method/address_changer.dart';
import 'package:golaundry/pages/models/address.dart';
import 'package:provider/provider.dart';

class AddressDesign extends StatefulWidget {
  final Address? model;
  final int? selectedIndex;
  final int? value;
  final String? addressID;

  AddressDesign({this.model, this.selectedIndex, this.value, this.addressID});

  @override
  State<AddressDesign> createState() => _AddressDesignState();
}

class _AddressDesignState extends State<AddressDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<AddressChanger>(context, listen: false)
            .displayResult(widget.value);
      },
      child: Card(
        color: Color(0xff6998AB),
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Color(0xff1A374D),
                  value: widget.value!,
                  groupValue: widget.selectedIndex!,
                  onChanged: (val) {
                    Provider.of<AddressChanger>(context, listen: false)
                        .displayResult(val);
                    print(val);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              const Text(
                                "Address Line: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.flatNumber.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "City: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.city.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "State: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.state.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              const Text(
                                "Full Address: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(widget.model!.fullAddress.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                width: 400,
                height: 40,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // MapUtils.openMapWithPosition(
                    //   widget.model!.lat!, widget.model!.lng!);

                    MapUtils.openMapWithAddress(widget.model!.fullAddress!);
                  },
                  child: Text('check on map'),
                  style: ElevatedButton.styleFrom(primary: Color(0xff2C88D9)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
