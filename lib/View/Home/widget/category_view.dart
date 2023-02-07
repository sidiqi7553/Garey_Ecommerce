import 'package:flutter/material.dart';
import 'package:garey_ecom/View/base/title_widget.dart';
import 'package:garey_ecom/utils/demensions.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../helper/responsive_helper.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';
import '../../../utils/styles.dart';
import 'view_all_page.dart';

class CategoryView extends StatelessWidget {
  List allCatogries = [
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg"
  ];
  List allcatogriesnames = [
    "laptop",
    "laptop",
    "laptop",
  ];

  @override
  Widget build(BuildContext context) {
    // return Consumer<CategoryProvider>(
    //   builder: (context, category, child) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: TitleWidget(
            title: "Categories",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewAll()));
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 110,
                child: allCatogries != null
                    ? allCatogries.length > 0
                        ? ListView.builder(
                            itemCount: allCatogries.length,
                            padding: EdgeInsets.only(
                                left: Dimensions.PADDING_SIZE_SMALL),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: Dimensions.PADDING_SIZE_SMALL),
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    Routes.getCategoryRoute(
                                        allCatogries[index]),
                                    // arguments: CategoryScreen(
                                    //     categoryModel:allCatogries[index]),
                                  ),
                                  child: Column(children: [
                                    Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              width: .5,
                                              color:
                                                  Theme.of(context).hintColor)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: FadeInImage.assetNetwork(
                                          placeholder: Images.home,
                                          image: '${allCatogries[index]}',
                                          width: 65,
                                          height: 65,
                                          fit: BoxFit.cover,
                                          imageErrorBuilder: (c, o, t) =>
                                              Image.asset(
                                            Images.home,
                                            width: 65,
                                            height: 65,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      width: 60,
                                      child: Center(
                                        child: Text(
                                          allcatogriesnames[index],
                                          style: rubikMedium.copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_SMALL),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          )
                        : Center(child: Text('no_category_available'))
                    : CategoryShimmer(),
              ),
            ),
            ResponsiveHelper.isMobile(context)
                ? SizedBox()
                : allcatogriesnames != null
                    ? Column(
                        children: [
                          // InkWell(
                          //   onTap: (){
                          //     showDialog(context: context, builder: (con) => Dialog(
                          //         child: Container(height: 550, width: 600, child: CategoryPopUp())
                          //     ));
                          //   },
                          //   child: Padding(
                          //     padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                          //     child: CircleAvatar(
                          //       radius: 35,
                          //       backgroundColor: Theme.of(context).primaryColor,
                          //       child: Text(getTranslated('view_all', context), style: TextStyle(fontSize: 14,color: Colors.white)),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    : CategoryAllShimmer()
          ],
        ),
      ],
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
            child: Shimmer(
              duration: Duration(seconds: 2),
              // enabled:
              //     Provider.of<CategoryProvider>(context).categoryList == null,
              child: Column(children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 5),
                Container(height: 10, width: 50, color: Colors.grey[300]),
              ]),
            ),
          );
        },
      ),
    );
  }
}

class CategoryAllShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
        child: Shimmer(
          duration: Duration(seconds: 2),
          // enabled: Provider.of<CategoryProvider>(context).categoryList == null,
          child: Column(children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 5),
            Container(height: 10, width: 100, color: Colors.grey[300]),
          ]),
        ),
      ),
    );
  }
}
