import 'package:flutter/material.dart';


class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.orange,

    );
  }
}
