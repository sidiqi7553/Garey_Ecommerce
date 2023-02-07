
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';
import '../../utils/demensions.dart';
import '../../utils/styles.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  CustomAppBar2({@required this.title,  this.isBackButtonExist = true, this.onBackPressed, });

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title!, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).textTheme.bodyText1!.color)),
      centerTitle: true,
      leading: isBackButtonExist ? IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: Theme.of(context).textTheme.bodyText1!.color,
        onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context),
      ) : SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,

    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
