import 'package:flutter/material.dart';


class Electronics extends StatefulWidget {
  const Electronics({Key? key}) : super(key: key);

  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}
