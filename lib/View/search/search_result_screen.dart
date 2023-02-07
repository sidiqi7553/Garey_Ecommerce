
import 'package:flutter/material.dart';
import 'package:garey_ecom/View/search/widget/filter_widget.dart';
import 'package:provider/provider.dart';

import '../../utils/demensions.dart';
import '../../utils/images.dart';
import '../base/custom_text_field.dart';



class SearchResultScreen extends StatefulWidget {
  final String searchString;
  SearchResultScreen({required this.searchString});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    int atamp = 0;
    if (atamp == 0) {
      _searchController.text = widget.searchString;
      atamp = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
            child:
          // Consumer<SearchProvider>(
            //   builder: (context, searchProvider, child) =>
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      width: 1170,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'search_items_here',
                              isShowBorder: true,
                              isShowSuffixIcon: true,
                              suffixIconUrl: Images.filter,
                              controller: _searchController,
                              isShowPrefixIcon: true,
                              prefixIconUrl: Images.search,
                              inputAction: TextInputAction.search,
                              isIcon: true,

                              onSuffixTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      List<double> _prices = [];
                                      //searchProvider.filterProductList.forEach((product) => _prices.add(product.price));
                                      _prices.sort();
                                      double _maxValue = _prices.length > 0 ? _prices[_prices.length-1] : 1000;
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)),
                                        child: Container(
                                            width: 550,
                                            child: FilterWidget(maxValue: _maxValue)),
                                      );
                                    });

                              },
                            ),
                          ),
                          SizedBox(width: 12),

                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // searchProvider.searchProductList != null ? Center(
                  //   child: SizedBox(
                  //     width: Dimensions.WEB_SCREEN_WIDTH,
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: Text(
                  //             '${searchProvider.searchProductList.length} ${getTranslated('product_found', context)}',
                  //             style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getGreyBunkerColor(context)),
                  //           ),
                  //         ),
                  //         InkWell(
                  //           onTap: () {
                  //             showDialog(
                  //                 context: context,
                  //                 builder: (BuildContext context) {
                  //                   List<double> _prices = [];
                  //                   searchProvider.filterProductList.forEach((product) => _prices.add(product.price));
                  //                   _prices.sort();
                  //                   double _maxValue = _prices.length > 0 ? _prices[_prices.length-1] : 1000;
                  //                   return Dialog(
                  //                     shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(20.0)),
                  //                     child: Container(
                  //                         width: 550,
                  //                         child: FilterWidget(maxValue: _maxValue)),
                  //                   );
                  //                 });
                  //
                  //           },
                  //           child: Container(
                  //             child : Image.asset(Images.filter),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ) :
                  SizedBox.shrink(),
                  SizedBox(height: 13),
                  Expanded(
                    child:
                    //searchProvider.searchProductList != null ? searchProvider.searchProductList.length > 0
                      //  ?
                      Scrollbar(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(minHeight:  _height - 400),
                                child: SizedBox(
                                  width: 1170,
                                  child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    itemCount: 10,
                                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    //     crossAxisSpacing:  5,
                                    //     mainAxisSpacing:  5,
                                    //     childAspectRatio:  3,
                                    //     crossAxisCount:  1),
                                    itemBuilder: (context, index) =>  Container()
                                        //ProductWidget(product: searchProvider.searchProductList[index]),
                                  ),
                                ),
                              ),
                            ),

                          //  if(ResponsiveHelper.isDesktop(context)) FooterView(),
                          ],
                        ),
                      ),
                    )
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    //       ConstrainedBox(
                    //         constraints: BoxConstraints(minHeight: !ResponsiveHelper.isDesktop(context) && _height < 600 ? _height : _height - 400),
                    //         child: NoDataScreen(),
                    //       ),
                    //       if(ResponsiveHelper.isDesktop(context)) FooterView(),
                    //     ],
                    //   ),
                    // ) :
                    // Center(
                    //   child: SizedBox(
                    //     width: 1170,
                    //     child: GridView.builder(
                    //       itemCount: 10,//searchProvider.searchProductList.length,
                    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisSpacing:  5,
                    //         mainAxisSpacing:  5,
                    //         childAspectRatio:  3,
                    //         crossAxisCount:  1,
                    //       ),
                    //       itemBuilder: (context, index) => Container()
                    //           // ProductShimmer(),
                    //     ),
                    //   ),
                    // ),
                  )
                ],
              ),
            // )
        ),
      ),
    );
  }
}
