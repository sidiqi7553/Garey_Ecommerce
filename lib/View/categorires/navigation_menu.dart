import 'package:flutter/material.dart';
import 'package:garey_ecom/utils/color_resources.dart';


class NavigationMenu extends StatelessWidget {
  NavigationMenu(
      {Key? key,
        required this.onClick,
        required this.isSelected,
        required this.IconText,
        required this.IconeName})
      : super(key: key);

  VoidCallback onClick;
  bool isSelected;
  String IconText;
  IconData IconeName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
         // color: isSelected ? ColorResources.navigationSelectionColor : Colors.transparent,

        // padding: EdgeInsets.only(left: 4, right: 5, bottom: 5),
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.red,
                      //     // blurRadius: 1,
                      //
                      //     // offset: Offset(2, 2), // Shadow position
                      //   ),
                      // ],
                    ),
                    child: Center(
                      child: Icon(IconeName,   color:
                      isSelected ? Colors.blue : Colors.grey.shade500, size: 32,),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  IconText,
                  style: TextStyle(fontSize: 9,color: isSelected ? Colors.blue : Colors.blueGrey.shade700,
                  ),
                ),
              ],
            ),
            // svgLoader(icon, height: height, width: width),
            Container(
              margin: EdgeInsets.all(5),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color:
                isSelected ? Colors.blue : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
