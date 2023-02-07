
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/demensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';

class OrderInfoView extends StatelessWidget {
  final OrderProvider order;
  const OrderInfoView({Key? key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isCashOnDeliveryActive;
    _isCashOnDeliveryActive = Provider.of<SplashProvider>(context, listen: false).configModel.cashOnDelivery == 'true';

    return Container(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            Text(('order_id')),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(order.trackModel.id.toString(), style: rubikMedium),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Expanded(child: SizedBox()),
            Icon(Icons.watch_later, size: 17),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            // Text(DateConverter.isoStringToLocalDateOnly(order.trackModel.createdAt), style: rubikRegular),
          ]),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

          Row(children: [
            Text('item',),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(order.orderDetails.length.toString(), style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
            Expanded(child: SizedBox()),
            order.trackModel.orderType == 'delivery' ? TextButton.icon(
              onPressed: () {
                // AddressModel _address;
                // for(AddressModel address in Provider.of<LocationProvider>(context, listen: false).addressList) {
                //   if(address.id == order.trackModel.deliveryAddressId) {
                //     _address = address;
                //     break;
                //   }
                // }
                // if(_address != null) {
                //   Navigator.pushNamed(context, Routes.getMapRoute(_address));
                // }
                if(order.trackModel.deliveryAddress != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => MapWidget(address: order.trackModel.deliveryAddress)));
                }
                else{
                  showCustomSnackBar('Address not found', context);
                }
              },
              icon: Icon(Icons.map, size: 18),
              label: Text('delivery_address'),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1)),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  minimumSize: Size(1, 30)
              ),
            ) : order.trackModel.orderType == 'pos' ? Text(('pos_order'), style: rubikMedium) : Text(('self_pickup' ), style: rubikMedium),

          ]),
          Divider(height: 20),

          // Payment info
          Align(
            alignment: Alignment.center,
            child: Text(('payment_info'), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
          ),
          SizedBox(height: 10),
          Row(children: [
            Expanded(flex: 2, child: Text(('status'), style: rubikRegular)),

          ]
    ),
          SizedBox(height: 5),
          Row(children: [
            Expanded(flex: 2, child: Text(('method'), style: rubikRegular)),
            Expanded(flex: 8, child: Row(children: [
              Text(
                (order.trackModel.paymentMethod != null && order.trackModel.paymentMethod.length > 0)
                    ? order.trackModel.paymentMethod == 'cash_on_delivery' ? ('cash_on_delivery')
                    : '${order.trackModel.paymentMethod[0].toUpperCase()}${order.trackModel.paymentMethod.substring(1).replaceAll('_', ' ')}'
                    : ('digital_payment'),
                style: rubikMedium.copyWith(color: Theme.of(context).primaryColor),
              ),
              (order.trackModel.paymentStatus != 'paid' && order.trackModel.paymentMethod != 'cash_on_delivery'
                  && order.trackModel.orderStatus != 'delivered') ? InkWell(
                onTap: () {

                  if(!_isCashOnDeliveryActive){
                  //   showCustomSnackBar('cash_on_delivery_is_not_activated', )
                  // );
                  }
                 else{
                  showDialog(context: context, builder: (context) => ChangeMethodDialog(orderID: order.trackModel.id.toString(), callback: (String message, bool isSuccess) {
                  showCustomSnackBar(message, context, isError: isSuccess ? false : true);
                  }));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL, vertical: 2),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).primaryColor.withOpacity(0.3)),
                  child: Text(('change'), style: rubikMedium.copyWith(fontSize: 10, color: Colors.black)),
                ),
              ) : SizedBox(),
            ])),
          ]),
          Divider(height: 40),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: order.orderDetails.length,
            itemBuilder: (context, index) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.placeholder(context),
                      image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productImageUrl}/'
                          '${order.orderDetails[index].productDetails.image[0]}',
                      height: 70, width: 80,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder(context), height: 70, width: 80),
                    ),
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              order.orderDetails[index].productDetails.name,
                              style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('quantity'),
                          Text(order.orderDetails[index].quantity.toString(), style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(children: [
                        Text(
                          PriceConverter.convertPrice(context, order.orderDetails[index].price - order.orderDetails[index].discountOnProduct),
                          style: rubikBold,
                        ),
                        SizedBox(width: 5),
                        order.orderDetails[index].discountOnProduct > 0 ? Expanded(child: Text(
                          PriceConverter.convertPrice(context, order.orderDetails[index].price),
                          style: rubikBold.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: Dimensions.FONT_SIZE_SMALL,
                            color: ColorResources.COLOR_GREY,
                          ),
                        )) : SizedBox(),


                      ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      order.orderDetails[index].variation != null && order.orderDetails[index].variation.isNotEmpty?
                      Row(children: [
                        order.orderDetails[index].variation != null?
                        Container(height: 10, width: 10, decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        )) : SizedBox.shrink(),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                        Text(order.orderDetails[index].variation?? '',
                          style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                        ),
                      ]):SizedBox() ,
                    ]),
                  ),
                ]),
                Divider(height: 40),
              ]);
            },
          ),

          (order.trackModel.orderNote != null && order.trackModel.orderNote.isNotEmpty) ? Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_LARGE),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: ColorResources.COLOR_GREY),
            ),
            child: Text(order.trackModel.orderNote, style: rubikRegular.copyWith(color: ColorResources.COLOR_GREY)),
          ) : SizedBox(),
        ],
      ),
    );
  }
}