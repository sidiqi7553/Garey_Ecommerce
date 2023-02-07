
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';
import '../../utils/routes.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  CustomAppBar2({@required this.title,  this.isBackButtonExist = true, this.onBackPressed, });

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [BoxShadow(
              color: Colors.grey,
              spreadRadius: 1, blurRadius: 5,
            )],
          ),

          width: 1170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, Routes.getMainRoute()),

                  child:
                  SizedBox(),
                ),
              ),
              MenuBar(
              children: [],
              )]
          )
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
