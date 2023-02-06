

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garey_ecom/View/Home/Widget/category_view.dart';
import 'package:garey_ecom/utils/color_resources.dart';
import 'package:garey_ecom/utils/images.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> drawerGlobalKey = GlobalKey();

  // Future<void> _loadData(BuildContext context, bool reload) async {
  //   Provider.of<SplashProvider>(context, listen: false).getPolicyPage(context);
  //   if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
  //     await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
  //   }
  //   Provider.of<CategoryProvider>(context, listen: false).getCategoryList(
  //     context, true, Provider.of<LocalizationProvider>(context, listen: false).locale.languageCode,
  //   );
  //   Provider.of<BannerProvider>(context, listen: false).getBannerList(context, reload);
  //   Provider.of<ProductProvider>(context, listen: false).getOfferProductList(
  //     context, true, Provider.of<LocalizationProvider>(context, listen: false).locale.languageCode,
  //   );
  //   Provider.of<ProductProvider>(context, listen: false).getPopularProductList(
  //     context, '1', true, Provider.of<LocalizationProvider>(context, listen: false).locale.languageCode,
  //   );
  //
  // }
  @override
  void initState() {
    _loadData(context, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        key: drawerGlobalKey,
        endDrawerEnableOpenDragGesture: false,
       // backgroundColor: ResponsiveHelper.isDesktop(context)? ColorResources.getWhiteAndBlackColor(context) : ColorResources.getWhiteAndBlackColor(context),
       // drawer: ResponsiveHelper.isTab(context) ? Drawer(child: OptionsView(onTap: null)) : SizedBox(),
       // appBar: ResponsiveHelper.isDesktop(context)? PreferredSize(child: WebAppBar(), preferredSize: Size.fromHeight(120))  : null,

        body: RefreshIndicator(
          onRefresh: () async {
            // Provider.of<ProductProvider>(context, listen: false).offset = 1;
            // await _loadData(context, true);
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Scrollbar(
            controller: _scrollController,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                // App Bar
    SliverAppBar(
                  floating: true,
                  elevation: 0,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).cardColor,


                  title:  Image.asset(Images.logo, width: 70, height: 80),
                  actions: [
                    // IconButton(
                    //   onPressed: () => Navigator.pushNamed(context, Routes.getNotificationRoute()),
                    //   icon: Icon(Icons.notifications_none_rounded, color: Theme.of(context).textTheme.bodyText1.color),
                    // ),
                    // ResponsiveHelper.isTab(context) ?
                    Row(
                      children: [
                        IconButton(
                    // onPressed: () => Navigator.pushNamed(context, Routes.getNotificationRoute()),
                          icon:SvgPicture.asset(
                              "assets/icon/bell.svg",
                              semanticsLabel: 'A red up arrow'
                          ),
                        ),
                        IconButton(
                         // onPressed: () => Navigator.pushNamed(context, Routes.getDashboardRoute('cart')),
                          icon: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset(
                                  "assets/icon/bag.svg",
                                  semanticsLabel: 'A red up arrow'
                              ),
                              Positioned(
                                bottom: -7, left: -7,
                                child: Container(
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                                  child: Center(
                                    child: Text(
                                      "1"
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

                // Search Button
                // SliverPersistentHeader(
                //   pinned: true,
                //   delegate: SliverDelegate(child: Center(
                //     child: InkWell(
                //       onTap: () => Navigator.pushNamed(context, Routes.getSearchRoute()),
                //       child: Container(
                //         height: 60, width: 1170,
                //         color: Theme.of(context).cardColor,
                //         padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: 5),
                //         child: Container(
                //           decoration: BoxDecoration(
                //               // color: ColorResources.getSearchBg(context),
                //               borderRadius: BorderRadius.circular(0),border: Border.all(color: ColorResources.COLOR_NEW_FORM_BORDER)),
                //           child: Row(children: [
                //             Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL), child: Icon(Icons.search, size: 25)),
                //             Expanded(child: Text("Search", style: rubikRegular.copyWith(fontSize: 12))),
                //           ]),
                //         ),
                //       ),
                //     ),
                //   )),
                // ),

                SliverToBoxAdapter(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight:  MediaQuery.of(context).size.height),
                    child: Column(
                      children: [
                        Center(
                          child: SizedBox(

                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                              // Consumer<CategoryProvider>(
                              //   builder: (context, category, child) {
                                //  return
                                    //category.categoryList == null ?
                        CategoryView()
                         // : category.categoryList.length == 0 ? SizedBox() : CategoryView();
                              //   },
                              // ),



                              // ResponsiveHelper.isDesktop(context) ? SizedBox() : Consumer<BannerProvider>(
                              //   builder: (context, banner, child) {
                              //     return banner.bannerList == null ?
                                  BannerView()
                              //         : banner.bannerList.length == 0 ? SizedBox() : BannerView();
                              //   },
                              // ) ,

                              ResponsiveHelper.isDesktop(context) ?
                              Padding(
                                padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_LARGE,bottom: Dimensions.PADDING_SIZE_LARGE),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("New Arrivals",style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_THIRTY, color: ColorResources.getBlackAndWhiteColor(context) )),
                                ),
                              )
                                  : Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                child: TitleWidget(title: "New Arrivals"),
                              ),
                              ProductView(productType: ProductType.POPULAR_PRODUCT, scrollController: _scrollController),
                              SizedBox()





                            ]),
                          ),
                        ),
                        ResponsiveHelper.isDesktop(context) ? FooterView() : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}
