import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../utils/demensions.dart';

class OrderView extends StatelessWidget {
  final bool isRunning;

  OrderView({required this.isRunning});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: _height < 600 ? _height : _height - 450),
                child: SizedBox(
                  width: 1170,
                  child: ListView.builder(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    itemCount: 8,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Close to next Screen'),
                      );
                      //OrderItem(orderList: orderList, order: order, index: index, isRunning : isRunning);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // RefreshIndicator(
    //   onRefresh: () async {
    //     await Provider.of<OrderProvider>(context, listen: false).getOrderList(context);
    //   },
    //   backgroundColor: Theme.of(context).primaryColor,
    //   child: Scrollbar(
    //     child:
    //   ),
    // ),
    // Consumer<OrderProvider>(
    //   builder: (context, order, index) {
    //     List<OrderModel> orderList;
    //     if(order.runningOrderList != null) {
    //       orderList = isRunning ? order.runningOrderList.reversed.toList() : order.historyOrderList.reversed.toList();
    //     }
    //
    //     return orderList != null ? orderList.length > 0 ?
    //
    //               ),
    //               // if(ResponsiveHelper.isDesktop(context)) FooterView(),
    //
    //             ],
    //           ),
    //         ),
    //       ),
    //     )
    //         : SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             ConstrainedBox(
    //               constraints: BoxConstraints(minHeight:  _height - 400),
    //               child: NoDataScreen(isOrder: true),
    //             ),
    //          ],
    //         ))
    //         : OrderShimmer();
    //   },
    // ),
  }
}
