import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../provider/splash_provider.dart';
import '../../utils/images.dart';
import '../../utils/routes.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).cardColor,
        width: 1170,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, Routes.getMainRoute()),
                child:
                // Consumer<SplashProvider>(builder:(context, splash, child) => splash.configModel.ecommerceLogo != null? FadeInImage.assetNetwork(
                //         // placeholder: Images.placeholder(context),
                //         // image:  '${splash.baseUrls.ecommerceImageUrl}/${splash.configModel.ecommerceLogo}',width: 70, height: 50) :
                SizedBox(),
                ),
              ),


            MenuBar(children: [],),
          ],
        )
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
