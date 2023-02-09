import 'package:flutter/material.dart';
import 'package:garey_ecom/View/categorires/products.dart';

class Mobiles extends StatefulWidget {
  const Mobiles({Key? key}) : super(key: key);

  @override
  State<Mobiles> createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 15),
              child: Container(
                child: Text('Mobiles', style: TextStyle(color: Colors.blue),),

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38.0 , left: 10, right: 10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: products1.length,
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
                          products1[index]['image'] != null
                              ? Expanded(
                            child: Image.asset(
                              products1[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          )
                              : Container(),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            products1[index]['name'],
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
