import 'package:flutter/material.dart';
import 'package:garey_ecom/View/categorires/productCatalog2.dart';


class CatalogePage extends StatefulWidget {
  const CatalogePage({Key? key}) : super(key: key);

  @override
  State<CatalogePage> createState() => _CatalogePageState();
}

class _CatalogePageState extends State<CatalogePage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 3),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0)
                            ]),
                        child: Center(
                          child: ProductCatalog(
                            shopname: "Ahmad Collections",
                            images: [
                              'https://picsum.photos/200/300?image=1',
                              'https://picsum.photos/200/300?image=2',
                              'https://picsum.photos/200/300?image=3',
                              'https://picsum.photos/200/300?image=4',
                            ],
                            title: "Name",
                            price: 1300.0,
                          ),
                        ),
                      ),
              );
                },
              )
            )
          ],
        ),
      ),
    ));
  }
}
