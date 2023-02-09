import 'package:flutter/material.dart';

import '../base/product_widget_3.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 58.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    return ProductWidget3(

                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
