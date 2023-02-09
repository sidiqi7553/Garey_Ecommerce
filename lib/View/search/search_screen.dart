import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/images.dart';
import '../../utils/routes.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _searchQuery;
  List<String> _productImages = [
    'assets/image/2 piece.jpg',
    'assets/image/3 piece.jpg',
    'assets/image/kurti.jpg',
    'assets/image/shirt.jpg',
    'assets/image/2 piece.jpg',
    'assets/image/3 piece.jpg',
    'assets/image/kurti.jpg',
    'assets/image/shirt.jpg',
    'assets/image/2 piece.jpg',
    'assets/image/3 piece.jpg',
    'assets/image/kurti.jpg',
    'assets/image/shirt.jpg',
    'assets/image/2 piece.jpg',
    'assets/image/3 piece.jpg',
    'assets/image/kurti.jpg',
    'assets/image/shirt.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        title: Image.asset(Images.logo, width: 70, height: 80),
        actions: [
          // IconButton(
          //   onPressed: () => Navigator.pushNamed(context, Routes.getNotificationRoute()),
          //   icon: Icon(Icons.notifications_none_rounded, color: Theme.of(context).textTheme.bodyText1.color),
          // ),
          // ResponsiveHelper.isTab(context) ?
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamed(
                    context, Routes.getNotificationRoute()),
                icon: SvgPicture.asset("assets/icon/bell.svg",
                    semanticsLabel: 'A red up arrow'),
              ),
              IconButton(
                onPressed: () => Navigator.pushNamed(
                    context, Routes.getDashboardRoute('cart')),
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset("assets/icon/bag.svg",
                        semanticsLabel: 'A red up arrow'),
                    Positioned(
                      bottom: -7,
                      left: -7,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(
                          child: Text("1"
                            // "\$"+Provider.of<CartProvider>(context).cartList.length.toString(),
                            // style: rubikMedium.copyWith(color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
          // : SizedBox(),
        ],
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(

                decoration: InputDecoration(
                  hintText: 'Enter product name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),

                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
                onSaved: (value) => _searchQuery = value,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _productImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      _productImages[index],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
