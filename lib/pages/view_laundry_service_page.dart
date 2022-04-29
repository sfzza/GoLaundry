import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class viewLaundryServicePage extends StatefulWidget {
  const viewLaundryServicePage({Key? key}) : super(key: key);

  @override
  State<viewLaundryServicePage> createState() => _viewLaundryServicePageState();
}

class _viewLaundryServicePageState extends State<viewLaundryServicePage> {
  List<Tab> serviceTab = [
    Tab(text: "wash"),
    Tab(
      text: "iron",
    ),
    Tab(
      text: "wash&iron",
    ),
    Tab(
      text: "dry",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xffB1D0E0),
          appBar: PreferredSize(
            child: AppBar(
              // title: Text('laundry service'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                color: Color(0xff1A374D),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Color(0xffB1D0E0),
              bottom: TabBar(
                unselectedLabelColor: Color(0xff6998AB),
                unselectedLabelStyle: tabBarTextStyle,
                labelColor: Color(0xff1A374D),
                labelStyle: tabBarTextStyle,
                indicatorColor: Color(0xff1A374D),
                tabs: serviceTab,
              ),
            ),
            preferredSize: Size.fromHeight(100),
          ),
          body: TabBarView(
            children: [
              Text('data'),
              Text(''),
              Text('data'),
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
