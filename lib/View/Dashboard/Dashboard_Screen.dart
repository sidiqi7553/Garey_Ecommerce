import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garey_ecom/View/Home/Home_Screen.dart';
import 'package:garey_ecom/utils/color_resources.dart';

import '../categorires/main_category_page.dart';
import '../menu/menu_screen.dart';
import '../order/order_screen.dart';
import '../search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;

  DashboardScreen({required this.pageIndex});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  List<Widget>? _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // final _splashProvider = Provider.of<SplashProvider>(context, listen: false);
    // if(_splashProvider.policyModel == null) {
    //   Provider.of<SplashProvider>(context, listen: false).getPolicyPage(context);
    // }

    _pageIndex = widget.pageIndex;

    _pageController = PageController(initialPage: widget.pageIndex);

    _screens = [
      HomeScreen(),
      main_category_page(),
      // Container(
      //   color: Colors.purple,
      // ),

      // HomeScreen(),
      //
      SearchScreen(),
      OrderScreen(),
      // // WishListScreen(),
      MenuScreen(onTap: (int pageIndex) {
        _setPage(pageIndex);
      })
    ];

    //   if(ResponsiveHelper.isMobilePhone()) {
    //    NetworkInfo.checkConnectivity(_scaffoldKey);
    //}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: ColorResources.COLOR_GREY,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem("assets/icon/home.svg", 'Home', 0),
            _barItem("assets/icon/category-icon.svg", 'category', 1),
            _barItem("assets/icon/Search.svg", 'search', 2),
            _barItem("assets/icon/basket.svg", 'order', 3),
            _barItem("assets/icon/user.svg", 'menu', 4)
          ],
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens!.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens![index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
        backgroundColor: index == _pageIndex
            ? Theme.of(context).primaryColor
            : ColorResources.COLOR_GREY,
        icon: CircleAvatar(
          backgroundColor:
              index == _pageIndex ? Colors.transparent : Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(icon,
                      color: index == _pageIndex
                          ? Colors.blue
                          : ColorResources.COLOR_BLACK,
                      height: 25),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 9,
                      color: index == _pageIndex
                          ? Colors.blue
                          : ColorResources.COLOR_BLACK,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        label: "");
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  Widget bottomNavigation(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 90,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottomItems(
                          Icons.home, 'assets/icon/home.svg', 'Home', 1),
                      bottomItems(Icons.video_settings,
                          'assets/icon/basket.svg', 'Watch', 0),
                      bottomItems(
                          Icons.groups, 'assets/icon/bag.svg', 'Groups', 2),
                      bottomItems(
                          Icons.pages, 'assets/icon/heart.svg', 'Pages', 3),
                      bottomItems(
                          Icons.menu, 'assets/icon/user.svg', 'Menu', 4),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack bottomItems(IconData icon, String svgname, String title, int index) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: bottomSelectorIcon(icon, index),
        ),
        bottomSelector(svgname, title, index),
      ],
    );
  }

  Widget bottomSelector(
    String svgpath,
    String title,
    int index,
  ) {
    if (_pageIndex == index) {
      return Column(
        children: [
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 50),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).iconTheme.color,
            ),
            child: Center(
              child: SvgPicture.asset(
                svgpath,
                color:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            // SizeofFont: 13,
            // WeightofFont: FontWeight.w500,
            // textcolor: Theme.of(context).iconTheme.color,
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget bottomSelectorIcon(
    IconData icon,
    int index,
  ) {
    return InkWell(
      onTap: (() {
        _setPage(index);
      }),
      child: _pageIndex == index
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 10,
                right: 10,
              ),
              child: Icon(
                icon,
                size: 22,
              ),
            ),
    );
  }
}
