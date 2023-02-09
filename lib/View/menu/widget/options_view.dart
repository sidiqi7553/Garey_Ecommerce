import 'package:flutter/material.dart';

import '../../../helper/responsive_helper.dart';
import '../../../utils/images.dart';
import '../../../utils/routes.dart';

class OptionsView extends StatelessWidget {
  final Function onTap;

  OptionsView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      child: Center(
        child: SizedBox(
          // width: ResponsiveHelper.isTab(context) ? null : 1170,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            // SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade900, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.shade600,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'All Time',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.expand_more,
                              size: 18,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Rs. 0',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Total Sales',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0 \nCompleted \nOrders',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Rs.0 \nTotal \nProfit',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Rs.0 \nTotal \nBonus',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            //
            // SwitchListTile(
            //   value: Provider.of<ThemeProvider>(context).darkTheme,
            //   onChanged: (bool isActive) =>Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            //   title: Text(getTranslated('dark_theme', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            //   activeColor: Theme.of(context).primaryColor,
            // ),
            //
            // ResponsiveHelper.isTab(context) ? ListTile(
            //   onTap: () => Navigator.pushNamed(context, Routes.getDashboardRoute('home')),
            //   leading: Image.asset(Images.home, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
            //   title: Text(getTranslated('home', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            // ) :
            // SizedBox(),

            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () => ResponsiveHelper.isMobilePhone()
                    ? onTap(2)
                    : Navigator.pushNamed(
                        context, Routes.getDashboardRoute('order')),
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffECEDEE), width: 2)),
                    child: Center(
                        child: Image.asset(
                      Images.payment,
                      width: 20,
                      height: 20,
                    ))),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                title: Text(
                  ('Mera Profit'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getProfileRoute()),
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xffECEDEE), width: 2)),
                    child: Center(
                        child: Image.asset(
                      Images.profile,
                      width: 20,
                      height: 20,
                    ))),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                title: Text(
                  ('Bussiness Details'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getAddressRoute()),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.address,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('Payment MEthod Add Krein'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () {},
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.help,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('Followed Shops'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getCouponRoute()),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.done,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('Cataglogs Viewed'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () => Navigator.pushNamed(
                    context, Routes.getLanguageRoute('menu')),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.language,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('Favorites'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Help & Support',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getSupportRoute()),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.help_support,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('help_and_support'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getPolicyRoute()),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.privacy_policy,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('privacy_policy'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getTermsRoute()),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.terms_and_condition,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  ('terms_and_condition'),
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE)
                ),
              ),
            ),

            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
              )),
              child: ListTile(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.getReturnPolicyRoute()),
                // trailing: Icon(
                //   Icons.arrow_forward_ios,
                //   color: ColorResources.COLOR_BLACK,
                //   size: 20,
                // ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xffECEDEE), width: 2)),
                  child: Center(
                    child: Image.asset(
                      Images.returnPolicy,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: Text(
                  'return_policy',
                  // style: rubikMedium.copyWith(
                  //     fontSize: Dimensions.FONT_SIZE_LARGE),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ]),

          //    Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
          //       )),
          //   child: ListTile(
          //     onTap: () =>
          //         Navigator.pushNamed(
          //             context, Routes.getRefundPolicyRoute()),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       color: ColorResources.COLOR_BLACK,
          //       size: 20,
          //     ),
          //     leading: Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border:
          //           Border.all(color: Color(0xffECEDEE), width: 2)),
          //       child: Center(
          //         child: Image.asset(Images.refundPolicy,
          //           width: 20,
          //           height: 20,
          //         ),
          //       ),
          //     ),
          //     title: Text(('refund_policy'),
          //         style: rubikMedium.copyWith(
          //             fontSize: Dimensions.FONT_SIZE_LARGE)),
          //   ),
          // ),

          //   Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
          //       )),
          //   child: ListTile(
          //     onTap: () =>
          //         Navigator.pushNamed(
          //             context, Routes.getCancellationPolicyRoute()),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       color: ColorResources.COLOR_BLACK,
          //       size: 20,
          //     ),
          //     leading: Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border:
          //           Border.all(color: Color(0xffECEDEE), width: 2)),
          //       child: Center(
          //         child: Image.asset(Images.cancellationPolicy,
          //             width: 20,
          //             height: 20,
          //             ),
          //       ),
          //     ),
          //     title: Text(('cancellation_policy'),
          //         style: rubikMedium.copyWith(
          //             fontSize: Dimensions.FONT_SIZE_LARGE)),
          //   ),
          // ),
          // Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
          //       )),
          //   child: ListTile(
          //     onTap: () =>
          //         Navigator.pushNamed(context, Routes.getAboutUsRoute()),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       color: ColorResources.COLOR_BLACK,
          //       size: 20,
          //     ),
          //     leading: Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border:
          //           Border.all(color: Color(0xffECEDEE), width: 2)),
          //       child: Center(
          //         child: Image.asset(Images.about_us,
          //             width: 20,
          //             height: 20,
          //             ),
          //       ),
          //     ),
          //     title: Text(('about_us'),
          //         style: rubikMedium.copyWith(
          //             fontSize: Dimensions.FONT_SIZE_LARGE)),
          //   ),
          // ),
          // Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
          //       )),
          //   child: ListTile(
          //     leading: Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border:
          //           Border.all(color: Color(0xffECEDEE), width: 2)),
          //       child: Center(
          //         child: Image.asset(Images.version,
          //             width: 20,
          //             height: 20,
          //             ),
          //       ),
          //     ),
          //     title: Text('${('version',)}',
          //         style: rubikMedium.copyWith(
          //             fontSize: Dimensions.FONT_SIZE_LARGE)),
          //     trailing: Text(
          //         // '${Provider
          //         //     .of<SplashProvider>(context, listen: false)
          //         //     .configModel
          //         //     .softwareVersion ?? ''}',
          //         // style: rubikMedium.copyWith(
          //         //     fontSize: Dimensions.FONT_SIZE_LARGE)
          //     ),
          //     //
          //   ),
          // ),
          // _authProvider.isLoggedIn()
          //     ? Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
          //       )),
          //   child: ListTile(
          //     onTap: () {
          //       showAnimatedDialog(
          //           context,
          //           AccountDeleteDialog(
          //             icon: Icons.question_mark_sharp,
          //             title: getTranslated(
          //                 'are_you_sure_to_delete_account',
          //                 context),
          //             description: getTranslated(
          //                 'it_will_remove_your_all_information',
          //                 context),
          //             onTapFalseText: getTranslated('no', context),
          //             onTapTrueText: getTranslated('yes', context),
          //             isFailed: true,
          //             onTapFalse: () => Navigator.of(context).pop(),
          //             onTapTrue: () =>
          //                 _authProvider.deleteUser(context),
          //           ),
          //           dismissible: false,
          //           isFlip: true);
          //     },
          //     leading: Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(
          //               color: Color(0xffECEDEE), width: 2)),
          //       child: Center(
          //         child: Icon(Icons.delete,
          //             size: 20,
          //             color: Theme
          //                 .of(context)
          //                 .textTheme
          //                 .bodyText1
          //                 .color),
          //       ),
          //     ),
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       color: ColorResources.COLOR_BLACK,
          //       size: 20,
          //     ),
          //     title: Text(getTranslated('delete_account', context),
          //         style: rubikMedium.copyWith(
          //             fontSize: Dimensions.FONT_SIZE_LARGE)),
          //   ),
          // )

          // Container(
          //   height: 55,
          //   decoration: BoxDecoration(
          //       border: Border(
          //         top: BorderSide(width: 2.0, color: Color(0xffECEDEE)),
          //       )),
          //   child: ListTile(
          //     onTap: () {
          //       if (_authProvider.isLoggedIn()) {
          //         showDialog(
          //             context: context,
          //             barrierDismissible: false,
          //             builder: (context) => SignOutConfirmationDialog());
          //       } else {
          //         Navigator.pushNamed(context, Routes.getLoginRoute());
          //       }
          //     },
          //     trailing: Icon(
          //       Icons.arrow_forward_ios,
          //       color: ColorResources.COLOR_BLACK,
          //       size: 20,
          //     ),
          //     leading: Container(
          //       height: 40,
          //       width: 40,
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border:
          //           Border.all(color: Color(0xffECEDEE), width: 2)),
          //       child: Center(
          //         child: Image.asset(Images.login,
          //             width: 20,
          //             height: 20,
          //             color: Theme
          //                 .of(context)
          //                 .textTheme
          //                 .bodyText1
          //                 .color),
          //       ),
          //     ),
          //     title: Text(
          //         getTranslated(
          //             _authProvider.isLoggedIn() ? 'logout' : 'login',
          //             context),
          //         style: rubikMedium.copyWith(
          //             fontSize: Dimensions.FONT_SIZE_LARGE)),
          //   ),
          // ),
        ),
      ),
    ));
  }
}
