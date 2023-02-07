import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/product_model.dart';
import '../../../utils/demensions.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';

class ProductImageView extends StatelessWidget {
 final Product? productModel;
  ProductImageView({
    @required this.productModel
  });

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    // return Consumer<ProductProvider>(
    //   builder: (context, product, child) {
        return
          Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                Routes.getProductImageRoute(

                ),
                arguments: Container()
                //ProductImageScreen(imageList: productModel.image),
              ),
              child: Stack(children: [
                SizedBox(
                  height:  MediaQuery.of(context).size.width * 0.7,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: 3,
                    // productModel.image.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.home,
                          image: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone14pro-202209?wid=680&hei=528&fmt=p-jpg&qlt=95&.v=1663611329492',
                          //'${Provider.of<SplashProvider>(context,listen: false).baseUrls.productImageUrl}/${productModel.image[index]}',
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          imageErrorBuilder: (c, o, s) => Image.asset(Images.home),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                     // product.setImageSliderIndex(index);
                    },
                  ),
                ),
                Positioned(
                  left: 0, right: 0, bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _indicators(context),
                    ),
                  ),
                ),

              ]),
            ),
          ],
        );
    //   },
    // );
  }

  List<Widget> _indicators(BuildContext context) {
    List<Widget> indicators = [];
    TabPageSelectorIndicator(
      backgroundColor:  Colors.white,
      borderColor: Colors.white,
      size: 10,
    );
    // for (int index = 0; index < productModel.image.length; index++) {
    //   indicators.add();
    // }
    return indicators;
  }

}
