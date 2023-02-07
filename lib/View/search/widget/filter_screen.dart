import 'package:flutter/material.dart';

import '../../../../helper/responsive_helper.dart';

import 'filter_widget.dart';

class FliterScreen extends StatefulWidget {
  const FliterScreen({Key? key}) : super(key: key);

  @override
  State<FliterScreen> createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : null,
      body: Column(
        children: [
          FilterWidget()
        ],
      ),

    );
  }
}
