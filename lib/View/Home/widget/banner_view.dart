
import 'package:flutter/material.dart';
import 'package:garey_ecom/provider/banner_provider.dart';
import 'package:garey_ecom/provider/splash_provider.dart';
import 'package:garey_ecom/provider/theme_provider.dart';
import 'package:garey_ecom/utils/color_resources.dart';
import 'package:garey_ecom/utils/demensions.dart';
import 'package:garey_ecom/utils/images.dart';
import 'package:garey_ecom/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../helper/responsive_helper.dart';

class BannerView extends StatefulWidget {
  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  final PageController _pageController = PageController();

  int selectedIndex = 0 ;

  List allBanners = [
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg"
  ];
  List<Widget> _pageIndicators(var onBoardingList, BuildContext context) {
    List<Container> _indicators = [];

    for (int i = 0; i < onBoardingList.length; i++) {
      _indicators.add(
        Container(
          width: i == selectedIndex ? 20 : 7,
          height: 7,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: i == selectedIndex ? Colors.transparent: Theme.of(context).primaryColor ,
              borderRadius: i == selectedIndex ? BorderRadius.circular(50) : BorderRadius.circular(25),
              border:Border.all(color: Theme.of(context).primaryColor)
          ),
        ),
      );
    }
    return _indicators;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        // Padding(
        //   padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        //   child: TitleWidget(title: getTranslated('banner', context)),
        // ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),

        SizedBox(
          height: 170,
          child:
          // Consumer<BannerProvider>(
          //   builder: (context, banner, child) {
          //     return
                allBanners != null ?
                allBanners.length > 0 ?

                Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: PageView.builder(
                        itemCount: allBanners.length,
                        controller: _pageController,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left:Dimensions.PADDING_SIZE_SMALL,right: Dimensions.PADDING_SIZE_SMALL),
                            decoration: BoxDecoration(
                              boxShadow: [
                                // Provider.of<ThemeProvider>(context).darkTheme ? BoxShadow() :
                                BoxShadow(
                                    // color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ? 700 : 300],
                                    spreadRadius: 1, blurRadius: 5),
                              ],
                              color: ColorResources.COLOR_WHITE,
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.update,
                                image: '${allBanners[index]}',
                                width: 250, height: 150, fit: BoxFit.cover,
                                imageErrorBuilder: (context,a,b) => Image.asset(Images.update,width: 250, height: 150, fit: BoxFit.cover,),

                              ),
                            ),
                          );
                        },
                        onPageChanged: (index) {
                          setState((){
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _pageIndicators(allBanners, context),
                    ),
                  ],
                )

                : Center(child: Text('No Banner Available')) : BannerShimmer()
            // },
          ),
        // ),

      ],
    );
  }
}

class BannerShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Shimmer(
          duration: Duration(seconds: 2),
          enabled: Provider.of<BannerProvider>(context).bannerList == null,
          child: Container(
            width: 250, height: 85,
            margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 5)],
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

