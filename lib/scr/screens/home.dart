import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/providers/app.dart';
import 'package:food_course/scr/providers/product.dart';
import 'package:food_course/scr/providers/user.dart';
import 'package:food_course/scr/screens/AllProducts.dart';
import 'package:food_course/scr/screens/aboutUs.dart';
import 'package:food_course/scr/screens/cart.dart';
import 'package:food_course/scr/screens/categories/honey.dart';
import 'package:food_course/scr/screens/categories/grains.dart';
import 'package:food_course/scr/screens/categories/diet.dart';
import 'package:food_course/scr/screens/categories/oil.dart';
import 'package:food_course/scr/screens/categories/spirulina.dart';
import 'package:food_course/scr/screens/categories/special.dart';
import 'package:food_course/scr/screens/categories/herbs.dart';
import 'package:food_course/scr/screens/categories/beauty.dart';
import 'package:food_course/scr/screens/login.dart';
import 'package:food_course/scr/screens/order.dart';
import 'package:food_course/scr/screens/product_search.dart';
import 'package:food_course/scr/widgets/custom_text.dart';
import 'package:food_course/scr/widgets/featured_products.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _launchinBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String _launchFBurl = 'https://www.facebook.com/eataraonline/';
    UserProvider user = Provider.of<UserProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: primary,
        title: CustomText(
          text: "عطارة أونلاين ",
          color: black,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: CustomText(
                text: user.userModel?.firstName ?? '',
                color: black,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: user.userModel?.email ?? '',
                color: black,
              ),
            ),
            SizedBox(height: 25),
            ListTile(
              onTap: () {
                print(user.userModel);
                // changeScreen(context, Home());
              },
              leading: Icon(Icons.home),
              title: CustomText(text: "الرئيسية"),
            ),
            ListTile(
              onTap: () async {
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "طلباتي"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, AllProducts());
              },
              leading: Icon(Icons.apps),
              title: CustomText(text: "جميع منتجاتنا "),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "عربة التسوق"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, AboutUs());
              },
              leading: Icon(Icons.info_outline),
              title: CustomText(text: "من نحن"),
            ),
            ListTile(
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "خروج"),
            ),
            ListTile(
              leading: InkWell(
                onTap: () {
                  _launchinBrowser(_launchFBurl);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Image.asset(
                    'assets/images/FB.png',
                    width: 35,
                  ),
                ),
              ),
              title: CustomText(text: "فيسبوك"),
            ),
            Container(
                margin: EdgeInsets.only(top: 115, left: 15),
                child: Text('Copyright © عطارة أونلاين , All rights reserved'))
          ],
        ),
      ),
      backgroundColor: white,
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.search,
                        color: green,
                      ),
                      title: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (pattern) async {
                          app.changeLoading();
                          if (app.search == SearchBy.PRODUCTS) {
                            await productProvider.search(productName: pattern);
                            changeScreen(context, ProductSearchScreen());
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "ابحث عن منتجك ",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(height: 150.0),
                items: [
                  productProvider.products[0].image,
                  productProvider.products[1].image,
                  productProvider.products[2].image,
                  productProvider.products[3].image,
                  productProvider.products[4].image,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Image.network(
                          i,
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          height: 60,
                          width: 60,
                          child: GestureDetector(
                            child: Image.asset('assets/images/honey.png'),
                            onTap: () {
                              changeScreen(context, Honey());
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 60,
                          width: 60,
                          child: GestureDetector(
                            child:
                                Image.asset('assets/images/special_food.png'),
                            onTap: () {
                              changeScreen(context, Special());
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 60,
                          width: 60,
                          child: GestureDetector(
                            child: Image.asset('assets/images/grains.png'),
                            onTap: () {
                              changeScreen(context, Grains());
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          height: 60,
                          width: 60,
                          child: GestureDetector(
                            child: Image.asset('assets/images/dietfood.png'),
                            onTap: () {
                              changeScreen(context, DietFood());
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              height: 60,
                              width: 60,
                              child: GestureDetector(
                                child:
                                    Image.asset('assets/images/spirulina.jpg'),
                                onTap: () {
                                  changeScreen(context, Spirulina());
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 60,
                              width: 60,
                              child: GestureDetector(
                                child: Image.asset('assets/images/oil.png'),
                                onTap: () {
                                  changeScreen(context, Oil());
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 60,
                              width: 60,
                              child: GestureDetector(
                                child: Image.asset('assets/images/herbs.png'),
                                onTap: () {
                                  changeScreen(context, Herbs());
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 60,
                              width: 60,
                              child: GestureDetector(
                                child: Image.asset('assets/images/beauty.png'),
                                onTap: () {
                                  changeScreen(context, Beauty());
                                },
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomText(
                      text: "الأكثر مبيعًا ",
                      size: 20,
                      color: grey,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Featured(),
              SizedBox(
                height: 25,
              ),
              // OurProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
