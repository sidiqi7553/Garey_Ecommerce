import 'package:flutter/material.dart';


import '../../utils/color_resources.dart';
import '../../utils/demensions.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? btnTxt;
  final Color? backgroundColor;
  final double? radius;
  CustomButton({this.onTap, @required this.btnTxt, this.backgroundColor, this.radius = 25});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onTap == null ? ColorResources.COLOR_GRAY : backgroundColor == null ? Theme.of(context).primaryColor : backgroundColor,
      minimumSize: Size(MediaQuery.of(context).size.width, 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius!),
      ),
    );

    return TextButton(
      onPressed: onTap,
      style: flatButtonStyle,
      child: Text(btnTxt??"",
          style: Theme.of(context).textTheme.headline3!.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_LARGE)),
    );
  }
}
