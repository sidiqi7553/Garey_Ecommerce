import 'package:flutter/material.dart';
import 'package:garey_ecom/utils/demensions.dart';
import 'package:garey_ecom/utils/styles.dart';


class TitleWidget extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;

  TitleWidget({@required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title!, style: rubikMedium),
      onTap != null ? InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Text(
            "View all >",
            style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: Theme.of(context).primaryColor),
          ),
        ),
      ) : SizedBox(),
    ]);
  }
}
