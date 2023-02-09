import 'package:flutter/material.dart';
import 'package:garey_ecom/View/categorires/catalogePage.dart';
import 'package:garey_ecom/View/categorires/productCatalog2.dart';
import 'package:garey_ecom/View/categorires/item_page.dart';

class SubCategoryScreen extends StatelessWidget {
  // final String categoryName;

  // SubCategoryScreen({this.categoryName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.blue.shade900,
              )),
          backgroundColor: Colors.white,
          title: Text(
            'Women Shirts',
            style: TextStyle(color: Colors.blue.shade900),
          ),
          // title: Text(categoryName),
          bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue.shade900,
            labelColor: Colors.blue.shade900,
            tabs: [
              Tab(
                text: 'Items',
              ),
              Tab(
                text: 'Catalogs',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ItemPage(),
            CatalogePage(),

          ],
        ),
      ),
    );
  }
}
