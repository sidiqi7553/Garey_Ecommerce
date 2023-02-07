//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:garey_ecom/localization/language_constrants.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'dart:typed_data';
// import 'dart:ui';
//
// import '../../data/model/response/order_model.dart';
// import '../../utils/color_resources.dart';
// import '../../utils/demensions.dart';
// import '../../utils/images.dart';
// import '../../utils/styles.dart';
// import 'custom_app_bar.dart';
//
//
// class MapWidget extends StatefulWidget {
//   final DeliveryAddress address;
//   MapWidget({required this.address});
//
//   @override
//   _MapWidgetState createState() => _MapWidgetState();
// }
//
// class _MapWidgetState extends State<MapWidget> {
//   late LatLng _latLng;
//   Set<Marker> _markers = Set.of([]);
//
//   @override
//   void initState() {
//     super.initState();
//
//     _latLng = LatLng(double.parse(widget.address.latitude), double.parse(widget.address.longitude));
//     _setMarker();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final _height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       // appBar: CustomAppBar(title: , Svg: ''),
//       body: SingleChildScrollView(
//         physics:  NeverScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all( Dimensions.PADDING_SIZE_SMALL ),
//               child: Center(
//                 child: Container(
//                   padding: EdgeInsets.all(  Dimensions.PADDING_SIZE_SMALL  ),
//                   decoration:  BoxDecoration(
//                     color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(10),
//                     boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)],
//                   ) ,
//                   height: _height * 0.7,
//                   width: Dimensions.WEB_SCREEN_WIDTH,
//                   child: Stack(children: [
//                     GoogleMap(
//                       minMaxZoomPreference: MinMaxZoomPreference(0, 16),
//                       initialCameraPosition: CameraPosition(target: _latLng, zoom: 17),
//                       zoomGesturesEnabled: true,
//                       myLocationButtonEnabled: false,
//                       zoomControlsEnabled: false,
//                       indoorViewEnabled: true,
//                       markers:_markers,
//                     ),
//                     Positioned(
//                       left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE,
//                       child: Container(
//                         padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Theme.of(context).cardColor,
//                           boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 3, blurRadius: 10)],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             Row(children: [
//
//                               Icon(
//                                 widget.address.addressType == 'Home' ? Icons.home_outlined : widget.address.addressType == 'Workplace'
//                                     ? Icons.work_outline : Icons.list_alt_outlined,
//                                 size: 30, color: Theme.of(context).primaryColor,
//                               ),
//                               SizedBox(width: 10),
//
//                               Expanded(
//                                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
//
//                                   Text(widget.address.addressType, style: rubikRegular.copyWith(
//                                     fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_GREY,
//                                   )),
//
//                                   Text(widget.address.address, style: rubikMedium),
//
//                                 ]),
//                               ),
//                             ]),
//
//                             Text('- ${widget.address.contactPersonName}', style: rubikMedium.copyWith(
//                               color: Theme.of(context).primaryColor,
//                               fontSize: Dimensions.FONT_SIZE_LARGE,
//                             )),
//
//                             Text('- ${widget.address.contactPersonNumber}', style: rubikRegular),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ]),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _setMarker() async {
//     Uint8List destinationImageData = await convertAssetToUnit8List(Images.destination_marker, width: 70);
//
//     _markers = Set.of([]);
//     _markers.add(Marker(
//       markerId: MarkerId('marker'),
//       position: _latLng,
//       icon: BitmapDescriptor.fromBytes(destinationImageData),
//     ));
//
//     setState(() {});
//   }
//
//   Future<Uint8List> convertAssetToUnit8List(String imagePath, {int width = 50}) async {
//     ByteData data = await rootBundle.load(imagePath);
//     Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//     FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List();
//   }
//
// }
