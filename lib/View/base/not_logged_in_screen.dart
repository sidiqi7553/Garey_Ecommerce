//
// import 'package:flutter/material.dart';
//
// import '../../localization/language_constrants.dart';
// import '../../utils/demensions.dart';
// import '../../utils/images.dart';
// import '../../utils/styles.dart';
//
//
// class NotLoggedInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           ConstrainedBox(
//             constraints: BoxConstraints(minHeight:  MediaQuery.of(context).size.height -400 ),
//             child: Center(
//               child: Padding(
//                 padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
//                 child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//
//                   Image.asset(
//                     Images.guest_login,
//                     width: MediaQuery.of(context).size.height*0.25,
//                     height: MediaQuery.of(context).size.height*0.25,
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height*0.03),
//
//                   Text(
//                     getTranslated('guest_mode', context),
//                     style: rubikBold.copyWith(fontSize: MediaQuery.of(context).size.height*0.023),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height*0.02),
//
//                   Text(
//                     getTranslated('now_you_are_in_guest_mode', context),
//                     style: rubikRegular.copyWith(fontSize: MediaQuery.of(context).size.height*0.0175),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height*0.03),
//
//                   SizedBox(
//                     height: 40,
//                     width: 100,
//                     child: CustomButton(btnTxt: getTranslated('login', context), onTap: () {
//                       Navigator.pushNamed(context, Routes.getLoginRoute());
//                     }),
//                   ),
//
//                 ]),
//               ),
//             ),
//           ),
//           ResponsiveHelper.isDesktop(context) ? FooterView() : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
