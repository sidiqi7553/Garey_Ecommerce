

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garey_ecom/View/search/search_result_screen.dart';
import 'package:provider/provider.dart';

import '../../utils/color_resources.dart';
import '../../utils/demensions.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
import '../../utils/styles.dart';
import '../base/custom_text_field.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  // void initState() {
  //   super.initState();
  //
  //   Provider.of<SearchProvider>(context, listen: false).initHistoryList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
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
                onPressed: () =>
                    Navigator.pushNamed(context, Routes.getNotificationRoute()),
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
                          child: Text(
                            "2" ,
                                // Provider.of<CartProvider>(context)
                                //     .cartList
                                //     .length
                                //     .toString(),
                            style: rubikMedium.copyWith(
                                color: Colors.white, fontSize: 8),
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
      body: SafeArea(
        child: Center(
          child: Container(
            width: 1170,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_LARGE),
                child:
                // Consumer<SearchProvider>(
                //   builder: (context, searchProvider, child) =>
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText:
                                  'search_items_here',
                              isShowBorder: true,
                              isShowSuffixIcon: true,
                              suffixIconUrl: Images.search,
                              onSuffixTap: () {
                                if (_searchController.text.length > 0) {
                                  // searchProvider.saveSearchAddress(
                                  //     _searchController.text);
                                  // searchProvider.searchProduct(
                                  //     _searchController.text, context);
                                  Navigator.pushNamed(
                                      context,
                                      Routes.getSearchResultRoute(
                                          _searchController.text),
                                      arguments: SearchResultScreen(
                                          searchString:
                                              _searchController.text));
                                }
                              },
                              controller: _searchController,
                              inputAction: TextInputAction.search,
                              isIcon: true,
                              onSubmit: (text) {
                                if (_searchController.text.length > 0) {
                                  // searchProvider.saveSearchAddress(
                                  //     _searchController.text);
                                  // searchProvider.searchProduct(
                                  //     _searchController.text, context);
                                  Navigator.pushNamed(
                                      context,
                                      Routes.getSearchResultRoute(
                                          _searchController.text),
                                      arguments: SearchResultScreen(
                                          searchString:
                                              _searchController.text));
                                }
                              },
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'cancel',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color:
                                            ColorResources.COLOR_GRAY),
                              ))
                        ],
                      ),
                      // for resent search section
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'recent_search',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: ColorResources.COLOR_GREY_BUNKER),
                          ),
                          // searchProvider.historyList.length > 0
                          //     ? TextButton(
                          //         onPressed: searchProvider.clearSearchAddress,
                          //         child: Text(
                          //          'remove_all',
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .headline2!
                          //               .copyWith(
                          //                   color: ColorResources
                          //                       .COLOR_GREY_BUNKER),
                          //         ))
                          //     :
                          SizedBox.shrink(),
                        ],
                      ),

                      // for recent search list section
                      Expanded(
                        child: ListView.builder(
                            itemCount: 20,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    // searchProvider.searchProduct(
                                    //     searchProvider.historyList[index],
                                    //     context);
                                    // Navigator.pushNamed(
                                    //     context,
                                    //     Routes.getSearchResultRoute(
                                    //         searchProvider.historyList[index]));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        Dimensions.PADDING_SIZE_SMALL),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.history,
                                                size: 16,
                                                color:
                                                    ColorResources.COLOR_HINT),
                                            SizedBox(width: 13),
                                            Text(
                                              'okkkkkkkkk',
                                              // searchProvider.historyList[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      color: ColorResources
                                                          .COLOR_HINT,
                                                      fontSize: Dimensions
                                                          .FONT_SIZE_SMALL),
                                            )
                                          ],
                                        ),
                                        Icon(Icons.arrow_upward,
                                            size: 16,
                                            color: ColorResources.COLOR_HINT),
                                      ],
                                    ),
                                  ),
                                )),
                      )
                    ],
                  ),
                // )
                  ),
          ),
        ),
      ),
    );
  }
}
