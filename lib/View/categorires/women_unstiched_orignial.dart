import 'package:flutter/material.dart';
import 'package:garey_ecom/View/categorires/products.dart';

class WomenUnstichedOrginal extends StatefulWidget {
  const WomenUnstichedOrginal({Key? key}) : super(key: key);

  @override
  State<WomenUnstichedOrginal> createState() => _WomenUnstichedOrginalState();
}

class _WomenUnstichedOrginalState extends State<WomenUnstichedOrginal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: Colors.grey,
                        //   width: 1.0,
                        // ),
                      ),
                      child: Column(
                        children: [
                          products[index]['image'] != null
                              ? Expanded(
                                  child: Image.asset(
                                    products[index]['image'],
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            products[index]['name'],
                            style: TextStyle(
                              fontSize: 15.0,
                              // fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
