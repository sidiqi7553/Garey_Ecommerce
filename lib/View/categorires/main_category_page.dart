import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garey_ecom/View/categorires/Bedding.dart';
import 'package:garey_ecom/View/categorires/Laptops.dart';
import 'package:garey_ecom/View/categorires/Women_unstiched_page.dart';
import 'package:garey_ecom/View/categorires/electornics.dart';
import 'package:garey_ecom/View/categorires/food.dart';
import 'package:garey_ecom/View/categorires/mobiles.dart';
import 'package:garey_ecom/View/categorires/travel.dart';
import 'package:garey_ecom/View/categorires/women_unstiched_orignial.dart';

import '../../utils/color_resources.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
import 'navigation_menu.dart';

class main_category_page extends StatefulWidget {
  @override
  State<main_category_page> createState() => _main_category_pageState();
}

class _main_category_pageState extends State<main_category_page> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int selectedMenuIndex = 0;
  bool selected = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 8, vsync: this, );

    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).cardColor,
          title: Image.asset(Images.logo, width: 70, height: 80),
          actions: [
            // IconButton(
            //   onPressed: () => Navigator.pushNamed(context, Routes.getNotificationRoute()),
            //   icon: Icon(Icons.notifications_none_rounded, color: Theme.of(context).textTheme.bodyText1.color),
            // ),
            // ResponsiveHelper.isTab(context) ?
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(
                      context, Routes.getNotificationRoute()),
                  icon: SvgPicture.asset("assets/icon/bell.svg",
                      semanticsLabel: 'A red up arrow'),
                ),
                IconButton(
                  onPressed: () => Navigator.pushNamed(
                      context, Routes.getDashboardRoute('cart')),
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset("assets/icon/bag.svg",
                          semanticsLabel: 'A red up arrow'),
                      Positioned(
                        bottom: -7,
                        left: -7,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                            child: Text("1"
                                // "\$"+Provider.of<CartProvider>(context).cartList.length.toString(),
                                // style: rubikMedium.copyWith(color: Colors.white, fontSize: 8),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
            // : SizedBox(),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
          ),

          // margin: EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width*0.2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          NavigationMenu(
                              IconeName: Icons.phone_android,
                              IconText: 'Mobile Phones',
                              isSelected: selectedMenuIndex == 0,
                              onClick: () {
                                _tabController.animateTo(0);
                              }),
                        ],
                      ),
                      NavigationMenu(
                          IconeName: Icons.laptop_chromebook_outlined,
                          IconText: 'Laptops',
                          isSelected: selectedMenuIndex == 1,
                          onClick: () {
                            _tabController.animateTo(1);
                          }),
                      NavigationMenu(
                          IconeName: Icons.travel_explore_outlined,
                          IconText: 'Travel',
                          isSelected: selectedMenuIndex == 2,
                          onClick: () {
                            _tabController.animateTo(2);
                          }),
                      NavigationMenu(
                          IconeName: Icons.fastfood,
                          IconText: 'Food',
                          isSelected: selectedMenuIndex == 3,
                          onClick: () {
                            _tabController.animateTo(3);
                          }),
                      NavigationMenu(
                          IconeName: Icons.electrical_services_outlined,
                          IconText: 'Electronics',
                          isSelected: selectedMenuIndex == 4,
                          onClick: () {
                            _tabController.animateTo(4);
                          }),

                      NavigationMenu(
                          IconeName: Icons.woman,
                          IconText: 'Women Shirts',
                          isSelected: selectedMenuIndex == 5,
                          onClick: () {
                            _tabController.animateTo(5);
                          }),
                      NavigationMenu(
                          IconeName: Icons.child_friendly,
                          IconText: 'Child Category',
                          isSelected: selectedMenuIndex == 6,
                          onClick: () {
                            _tabController.animateTo(6);
                          }),
                      NavigationMenu(
                          IconeName: Icons.bed_outlined,
                          IconText: 'Bedding',
                          isSelected: selectedMenuIndex == 7,
                          onClick: () {
                            _tabController.animateTo(7);
                          }),

                    ],
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      WomenUnstiched(),
                      WomenUnstichedOrginal(),
                      Bedding(),
                      Food(),
                      Travel(),
                      Laptops(),
                      Mobiles(),
                      Electronics(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
