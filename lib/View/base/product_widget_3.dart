import 'package:flutter/material.dart';
import 'package:garey_ecom/utils/demensions.dart';

import 'package:provider/provider.dart';

import '../../helper/responsive_helper.dart';
import '../../localization/language_constrants.dart';
import '../../provider/auth_provider.dart';
import '../../provider/wishlist_provider.dart';
import '../../utils/color_resources.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';
import '../../utils/styles.dart';
import '../product/product_details_screen.dart';
import 'custom_snackbar.dart';
import 'rating_bar.dart';

class ProductWidget3 extends StatelessWidget {
  // final Product product;
  //  ProductWidget3({
  //    //required this.product
  //  });
  List allproductnames = [
    "laptop",
    "laptop",
    "laptop",
  ];
  List allproduct = [
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    //  final bool _isLoggedIn = Provider.of<AuthProvider>(context, listen: false).isLoggedIn();

    double _startingPrice;
    double _endingPrice;
    // if(product.variations.length != 0) {
    //   List<double> _priceList = [];
    //   product.variations.forEach((variation) => _priceList.add(variation.price));
    //   _priceList.sort((a, b) => a.compareTo(b));
    //   _startingPrice = _priceList[0];
    //   if(_priceList[0] < _priceList[_priceList.length-1]) {
    //     _endingPrice = _priceList[_priceList.length-1];
    //   }
    // }else {
    //   _startingPrice = product.price;
    //
    // }

    //  double _discountedPrice = PriceConverter.convertWithDiscount(context, product.price, product.discount, product.discountType);

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => ProductDetailsScreen(),
              //     ));
              //  Navigator.of(context).pushNamed(
              //    Routes.getProductDetailsRoute(
              //      //product.id
              //    ),
              //    arguments:
              //   ProductDetailsScreen(),
              // );
            },
            child: Container(
              height: 285,
              width: MediaQuery.of(context).size.width*0.35,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(color: ColorResources.COLOR_NEW_FORM_BORDER),
                  borderRadius: BorderRadius.circular(8)
                // borderRadius: BorderRadius.circular(10),
                // boxShadow: [Provider.of<ThemeProvider>(context).darkTheme ? BoxShadow() :BoxShadow(
                //   color: Colors.grey[300],
                //   blurRadius: 5, spreadRadius: 1,
                // )],
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.logo,
                          image:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYeCB2cHWl6utDN3Cehnl7_iTbGpVjZFdqVw&usqp=CAU',
                          //{Provider.of<SplashProvider>(context, listen: false).baseUrls.productImageUrl}/${product.image[0]}',
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fitWidth,
                          imageErrorBuilder: (c, o, s) => Image.asset(
                              Images.placeholder(context),
                              height: 130,
                              width: 85,
                              fit: BoxFit.cover),
                        ),
                      ),
                      // SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Shop name',
                                style: TextStyle(color: Colors.grey.shade300),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(height: 3,),
                            Text('I phone X pro Max 2023',
                                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(height: 10),
                            Text(
                              'Rs . 2,34,00',
                              // '${PriceConverter.convertPrice(context, _startingPrice, discount: product.discount, discountType: product.discountType, asFixed: 1)}'
                              //     '${_endingPrice!= null ? ' - ${PriceConverter.convertPrice(context, _endingPrice, discount: product.discount,
                              //     discountType: product.discountType, asFixed: 1)}' : ''}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(children: [
                              Icon(Icons.star,color: Colors.blue,size: 13,),
                              // RatingBar(
                              //     rating:
                              //     // productModel!.rating != null
                              //     //     ? productModel!.rating!.length > 0
                              //     //         ? double.parse(
                              //     //             productModel.rating[0].average)
                              //     //         : 0.0
                              //     //     :
                              //     3.0
                              // ),
                              SizedBox(width: 5),
                              Text(
                                // productModel.rating != null
                                //     ? productModel.rating.length > 0
                                //         ? double.parse(
                                //                 productModel.rating[0].average)
                                //             .toStringAsFixed(1)
                                //         : '0.0'
                                //     :
                                  '3.0',
                                  style: rubikRegular.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  )),
                            ]),


                            // product.price > _discountedPrice ? Text('${PriceConverter.convertPrice(context, _startingPrice, asFixed: 1)}'
                            //     '${_endingPrice!= null ? ' - ${PriceConverter.convertPrice(context, _endingPrice, asFixed: 1)}' : ''}', style: rubikMedium.copyWith(
                            //   color: ColorResources.COLOR_GREY,
                            //   decoration: TextDecoration.lineThrough,
                            //   fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            // )) : SizedBox(),
                          ]),
                      IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.blue,))
                      // Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      //   // Icon(Icons.add),
                      //   // Expanded(child: SizedBox()),
                      //   RatingBar(rating: product.rating.length > 0 ? double.parse(product.rating[0].average) : 0.0, size: 10),
                      // ]),
                    ]),
              ),
            ),));

}}