import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/providers/product.dart';
import 'package:food_course/scr/screens/details.dart';
import 'package:food_course/scr/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class Oil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.loadOilCategory(categoryName: 'oil');

    return Scaffold(
      appBar: AppBar(
        title: Text('الزيوت'),
        backgroundColor: Colors.yellow[300],
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: productProvider.oilCategory.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                    _,
                    Details(
                      product: productProvider.oilCategory[index],
                    ),
                  );
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: productProvider
                                      .oilCategory[index].image,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              onTap: () {
                                changeScreen(
                                    _,
                                    Details(
                                      product: productProvider
                                          .oilCategory[index],
                                    ));
                              },
                            ),
                            SizedBox(width: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: CustomText(
                                text: productProvider
                                    .oilCategory[index].name
                                    .toString(),
                                color: black,
                                size: 14.0,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: CustomText(
                                text:
                                    "\L\.\E ${productProvider.oilCategory[index].price}",
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
