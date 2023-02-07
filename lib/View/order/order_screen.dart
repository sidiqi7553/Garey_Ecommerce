import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garey_ecom/View/order/widget/order_view.dart';

import '../../utils/demensions.dart';
import '../../utils/routes.dart';
import '../../utils/styles.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool isRunning = true;

  // bool _isLoggedIn;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 22,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Order",
              style: rubikMedium.copyWith(
                  fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Colors.black),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.getNotificationRoute()),
                icon: SvgPicture.asset("assets/icon/bag.svg",
                    semanticsLabel: 'A red up arrow'),
              ),
            ]),
        body: Column(children: [
          Divider(),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isRunning = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("Running", style: TextStyle(fontSize: 15)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: isRunning
                              ? Theme.of(context).primaryColor
                              : Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isRunning = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("History", style: TextStyle(fontSize: 15)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: isRunning
                              ? Colors.white
                              : Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isRunning = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("Returned", style: TextStyle(fontSize: 15)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: isRunning
                              ? Colors.white
                              : Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              Tab(child: OrderView(isRunning: true)),
              Tab(child: OrderView(isRunning: false)),
              Tab(child: OrderView(isRunning: false)),
            ],
          )),
        ]));
  }
}
