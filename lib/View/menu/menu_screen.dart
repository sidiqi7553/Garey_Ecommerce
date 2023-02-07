import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garey_ecom/View/menu/widget/options_view.dart';

import '../../utils/demensions.dart';
import '../../utils/routes.dart';
import '../../utils/styles.dart';
import 'dart:io';

class MenuScreen extends StatefulWidget {
  final Function onTap;

  MenuScreen({required this.onTap});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // bool? _isLoggedIn;

  //
  // @override
  // void initState() {
  //   _isLoggedIn =
  //       Provider.of<AuthProvider>(context, listen: false).isLoggedIn();
  //   if (_isLoggedIn) {
  //     Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
  //   }
  //   super.initState();
  // }

  // XFile? file;
  // XFile? data;
  // final picker = ImagePicker();
  // final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  //     GlobalKey<ScaffoldMessengerState>();

  // void _choose() async {
  //   XFile? pickedFile = await picker.pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 50,
  //       maxHeight: 500,
  //       maxWidth: 500);
  //   setState(() {
  //     if (pickedFile != null) {
  //       file = pickedFile;
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  // _pickImage() async {
  //   data =
  //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Categories",
            style: rubikMedium.copyWith(
                fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.getNotificationRoute()),
              icon: SvgPicture.asset("assets/icon/bag.svg",
                  semanticsLabel: 'A red up arrow'),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(children: [

          // Center(
          //   child: Container(
          //     width: 1170,
          //     padding: EdgeInsets.symmetric(vertical: 50),
          //     decoration: BoxDecoration(color: ColorResources.COLOR_WHITE),
          //     child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //                 vertical: Dimensions.PADDING_SIZE_LARGE),
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: ColorResources.BORDER_COLOR,
          //               border: Border.all(
          //                   color: ColorResources.COLOR_GREY_CHATEAU, width: 3),
          //               shape: BoxShape.circle,
          //             ),
          //             child: InkWell(
          //               // onTap: _choose,
          //               child: Stack(
          //                 clipBehavior: Clip.none,
          //                 children: [],
          //               ),
          //             ),
          //           ),
          //           // Column(children: [
          //           //   // _isLoggedIn
          //           //   //     ? profileProvider.userInfoModel != null
          //           //   //         ? Text(
          //           //   //             '${profileProvider.userInfoModel.fName ?? ''} ${profileProvider.userInfoModel.lName ?? ''}',
          //           //   //             style: rubikRegular.copyWith(
          //           //   //                 fontSize: Dimensions
          //           //   //                     .FONT_SIZE_EXTRA_LARGE,
          //           //   //                 color: ColorResources.COLOR_BLACK),
          //           //   //           )
          //           //   //         : Container(
          //           //   //             height: 15,
          //           //   //             width: 150,
          //           //   //             color: Colors.grey[300])
          //           //   //     :
          //           //
          //           //   SizedBox(height: 10),
          //           //   // _isLoggedIn
          //           //   //     ? profileProvider.userInfoModel != null
          //           //   //         ? Text(
          //           //   //             '${profileProvider.userInfoModel.email ?? ''}',
          //           //   //             style: rubikRegular.copyWith(
          //           //   //                 color: ColorResources.COLOR_BLACK),
          //           //   //           )
          //           //   //         : Container(
          //           //   //             height: 15,
          //           //   //             width: 100,
          //           //   //             color: Colors.grey[300])
          //           //   //     :
          //           //   Text(
          //           //     'demo@demo.com',
          //           //     style: rubikRegular.copyWith(
          //           //         fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
          //           //         color: ColorResources.COLOR_BLACK),
          //           //   ),
          //           // ])
          //         ]),
          //   ),
          // ),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: OptionsView(onTap: widget.onTap)),
        ]),
      ),
    );
  }
}
