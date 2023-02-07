import 'package:flutter/material.dart';

import '../data/repository/banner_repo.dart';


class BannerProvider extends ChangeNotifier {
  // final BannerRepo bannerRepo;
  // BannerProvider({required this.bannerRepo});

  List<String> _bannerList = [
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg"
  ];
  // List<Product> _productList = [];

  List<String> get bannerList => _bannerList;
  // List<Product> get productList => _productList;

  // Future<void> getBannerList(BuildContext context, bool reload) async {
  //   if(bannerList == null || reload) {
  //     ApiResponse apiResponse = await bannerRepo.getBannerList();
  //     if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //       _bannerList = [];
  //       apiResponse.response.data.forEach((category) {
  //         BannerModel bannerModel = BannerModel.fromJson(category);
  //         if(bannerModel.productId != null) {
  //           getProductDetails(context, bannerModel.productId.toString());
  //         }
  //         _bannerList.add(bannerModel);
  //       });
  //       notifyListeners();
  //     } else {
  //       ApiChecker.checkApi(context, apiResponse);
  //     }
  //   }
  // }
  //
  // void getProductDetails(BuildContext context, String productID) async {
  //   ApiResponse apiResponse = await bannerRepo.getProductDetails(productID);
  //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //     _productList.add(Product.fromJson(apiResponse.response.data));
  //   } else {
  //     ApiChecker.checkApi(context, apiResponse);
  //   }
  // }
}