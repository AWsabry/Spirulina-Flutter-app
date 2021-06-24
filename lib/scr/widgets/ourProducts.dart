// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:food_course/scr/helpers/screen_navigation.dart';
// import 'package:food_course/scr/providers/product.dart';
// import 'package:food_course/scr/screens/details.dart';
// import 'package:provider/provider.dart';
// import 'package:transparent_image/transparent_image.dart';
// import '../helpers/style.dart';
// import 'custom_text.dart';
// import 'loading.dart';

// class OurProducts extends StatefulWidget {
//   @override
//   _OurProductsState createState() => _OurProductsState();
// }

// class _OurProductsState extends State<OurProducts> {
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     productProvider.loadProductsByCategory(categoryName: 'honey');
//     return Container(
//       height: 220,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: productProvider.productsByCategory.length,
//           itemBuilder: (_, index) {
//             return Padding(
//               padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
//               child: GestureDetector(
//                 onTap: () {
//                   changeScreen(
//                       _,
//                       Details(
//                         product: productProvider.productsByCategory[index],
//                       ));
//                 },
//                 child: Container(
//                   height: 220,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey[300],
//                             offset: Offset(-2, -1),
//                             blurRadius: 5),
//                       ]),
//                   child: Column(
//                     children: <Widget>[
//                       ClipRRect(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20)),
//                         child: Stack(
//                           children: <Widget>[
//                             Positioned.fill(
//                                 child: Align(
//                               alignment: Alignment.center,
//                               child: Loading(),
//                             )),
//                             Center(
//                               child: FadeInImage.memoryNetwork(
//                                 placeholder: kTransparentImage,
//                                 image: productProvider.productsByCategory[index].image,
//                                 height: 126,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               '${productProvider.productsByCategory[index].name}' ??
//                                   "id null",
//                               textAlign: TextAlign.right,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8),
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Container(),
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               right: 8.0,
//                             ),
//                             child: CustomText(
//                               text:
//                                   "\L\.\E ${productProvider.productsByCategory[index].price}",
//                               weight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
