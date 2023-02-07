// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
//
// import '../../utils/demensions.dart';
// import '../../utils/routes.dart';
// import '../../utils/styles.dart';
//
// class DetailsAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final Key? key;
//   DetailsAppBar({this.key});
//   //
//   @override
//   DetailsAppBarState createState() => DetailsAppBarState();
//
//   @override
//   Size get preferredSize => Size(double.maxFinite, 50);
// }
//
// class DetailsAppBarState extends State<DetailsAppBar> with SingleTickerProviderStateMixin {
//   AnimationController? controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     controller!.dispose();
//     super.dispose();
//   }
//
//   void shake() {
//     controller!.forward(from: 0.0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 15.0).chain(CurveTween(curve: Curves.elasticIn)).animate(controller!)
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           controller!.reverse();
//         }
//       });
//
//     return AppBar(
//       leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).textTheme.bodyText1!.color), onPressed: () => Navigator.pop(context)),
//       backgroundColor: Theme.of(context).cardColor,
//       elevation: 0,
//       title: Text(
//         'product_details',
//         style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).textTheme.bodyText1!.color),
//       ),
//       centerTitle: true,
//       actions: [AnimatedBuilder(
//         animation: offsetAnimation,
//         builder: (buildContext, child) {
//           return Container(
//             padding: EdgeInsets.only(left: offsetAnimation.value + 15.0, right: 15.0 - offsetAnimation.value),
//             child: Stack(children: [
//               IconButton(
//                   icon: SvgPicture.asset('assets/icon/bag.svg'), onPressed: () {
//                 Navigator.pushNamed(context, Routes.getDashboardRoute('cart'),
//                     arguments: Container(color: Colors.green,)
//                     //CartScreen(fromDetails: true)
//                 );
//               }),
//               Positioned(
//                 bottom: 7, left: 7,
//                 child: Container(
//                   padding: EdgeInsets.all(4),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
//                   child: Text(
//                     '1',
//                     // Provider.of<CartProvider>(context).cartList.length.toString(),
//                     style: rubikMedium.copyWith(color: Colors.white, fontSize: 8),
//                   ),
//                 ),
//               ),
//
//             ]),
//           );
//         },
//       )],
//     );
//   }
// }
