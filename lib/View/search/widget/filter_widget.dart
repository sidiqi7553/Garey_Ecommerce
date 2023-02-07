import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/demensions.dart';
import '../../../utils/styles.dart';
import '../../base/custom_button.dart';

class FilterWidget extends StatelessWidget {
  final double? maxValue;
  FilterWidget({ this.maxValue});

  @override
  Widget build(BuildContext context) {
    return
      // Padding(
      // padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
      // child: Consumer<SearchProvider>(
      //   builder: (context, searchProvider, child) =>
            SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, size: 18, color: ColorResources.COLOR_GRAY),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'filter',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                        color: ColorResources.COLOR_GRAY,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // searchProvider.setRating(-1);
                      // Provider.of<CategoryProvider>(context, listen: false).updateSelectCategory(-1);
                      // searchProvider.setLowerAndUpperValue(0, 0);
                    },
                    child: Text(
                      'reset',
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),

              Text(
                'price',
                style: Theme.of(context).textTheme.headline3,
              ),

              // price range
              // RangeSlider(
              //   values: RangeValues(searchProvider.lowerValue, searchProvider.upperValue),
              //   max: maxValue,
              //   min: 0,
              //   activeColor: Theme.of(context).primaryColor,
              //   labels: RangeLabels(searchProvider.lowerValue.toString(), searchProvider.upperValue.toString()),
              //   onChanged: (RangeValues rangeValues) {
              //     searchProvider.setLowerAndUpperValue(rangeValues.start, rangeValues.end);
              //   },
              // ),

              Text(
                'rating',
                style: Theme.of(context).textTheme.headline3,
              ),

              Center(
                child: Container(
                  height: 30,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Icon(
                          // searchProvider.rating < (index + 1) ? Icons.star_border :
                          Icons.star,
                          size: 20,
                          color:
                          // searchProvider.rating < (index + 1) ? ColorResources.getGreyColor(context) :
                          Theme.of(context).primaryColor,
                        ),
                        onTap: () {}
                          // => searchProvider.setRating(index + 1),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'category',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 13),

              // Consumer<CategoryProvider>(
              //   builder: (context, category, child) {
              //     return category.categoryList != null
              //         ?
                  GridView.builder(
                        itemCount: 13,
                        padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 2.0, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                         //     category.updateSelectCategory(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
    // category.selectCategory == index
    //                                       ? Colors.transparent
    //                                       :
    ColorResources.COLOR_GRAY),
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Colors.transparent),
                              child: Text(
    'Name',
                               // category.categoryList[index].name,
                                textAlign: TextAlign.center,
                                style: rubikMedium.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                    color:
    // category.selectCategory == index ? Colors.white :
    ColorResources.COLOR_GRAY),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                      // : CategoryShimmer();

              SizedBox(height: 30),

              CustomButton(
                btnTxt: 'apply',
                onTap: () {
                  // searchProvider.sortSearchList(Provider.of<CategoryProvider>(context, listen: false).selectCategory,
                  //   Provider.of<CategoryProvider>(context, listen: false).categoryList,
                  // );

                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
    //   ),
    // );
  }
}
