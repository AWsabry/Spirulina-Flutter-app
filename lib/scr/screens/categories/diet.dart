import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/providers/product.dart';
import 'package:food_course/scr/screens/details.dart';
import 'package:food_course/scr/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DietFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    productProvider.loadDietFoodCategory(categoryName: 'dietFood');
    return Scaffold(
      appBar: AppBar(
        title: Text('منتجات التخسيس'),
        backgroundColor: Colors.yellow[300],
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: productProvider.dietFoodCategory.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                    _,
                    Details(
                      product: productProvider.dietFoodCategory[index],
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
                                      .dietFoodCategory[index].image,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              onTap: () {
                                changeScreen(
                                    _,
                                    Details(
                                      product: productProvider
                                          .dietFoodCategory[index],
                                    ));
                              },
                            ),
                            SizedBox(width: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: CustomText(
                                text: productProvider
                                    .dietFoodCategory[index].name
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
                                    "\L\.\E ${productProvider.dietFoodCategory[index].price}",
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
