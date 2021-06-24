import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/order.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/providers/app.dart';
import 'package:food_course/scr/providers/user.dart';
import 'package:food_course/scr/screens/ThankYou.dart';
import 'package:food_course/scr/screens/home.dart';
import 'package:food_course/scr/widgets/custom_text.dart';
import 'package:food_course/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _key = GlobalKey<ScaffoldState>();
  OrderServices _orderServices = OrderServices();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                changeScreen(context, Home());
              },
              child: Text(
                'واصل التسوق ',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "عربة التسوق"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              changeScreen(context, Home());
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
          itemCount: user.userModel.cart.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: green.withOpacity(0.2),
                          offset: Offset(3, 2),
                          blurRadius: 30)
                    ]),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Image.network(
                        user.userModel.cart[index]["image"],
                        height: 120,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      user.userModel.cart[index]["name"] + "\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      "\L\.\E ${user.userModel.cart[index]["price"]} \n\n",
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "العدد : ",
                                  style: TextStyle(
                                      color: grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: user.userModel.cart[index]["quantity"]
                                      .toString(),
                                  style: TextStyle(
                                      color: primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ]),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: green,
                              ),
                              onPressed: () async {
                                // app.changeLoading();
                                bool value = await user.removeFromCart(
                                    cartItem: user.userModel.cart[index]);
                                if (value) {
                                  user.reloadUserModel();
                                  print("Item added to cart");
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Removed from Cart!")));
                                  // app.changeLoading();
                                  return;
                                } else {
                                  print("ITEM WAS NOT REMOVED");
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("ITEM WAS NOT REMOVED !")));
                                }
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        color: Colors.black12,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "الإجمالي: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " \L\.\E ${user.userModel.totalCartPrice} ",
                      style: TextStyle(
                          color: primary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ]),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: primary),
                child: FlatButton(
                  onPressed: () {
                    if (user.userModel.totalCartPrice == 0) {
                      return showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Your cart is empty',
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    if (user.userModel.totalCartPrice != 0)
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '  هل أنت متأكد من شراء منتجاتك مقابل  \L\.\E ${user.userModel.totalCartPrice} !  ',
                                        textAlign: TextAlign.right,
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                          onPressed: () async {
                                            var uuid = Uuid();
                                            String id = uuid.v4();
                                            _orderServices.createOrder(
                                                userId: user.user.uid,
                                                firstName: user.userModel.firstName,
                                                secondName: user.userModel.secondName,
                                                id: id,
                                                status: "Complete",
                                                totalPrice: user
                                                    .userModel.totalCartPrice,
                                                cart: user.userModel.cart);
                                            for (Map cartItem
                                                in user.userModel.cart) {
                                              bool value =
                                                  await user.removeFromCart(
                                                      cartItem: cartItem);
                                              if (value) {
                                                user.reloadUserModel();
                                              } else {
                                                print("ITEM WAS NOT REMOVED");
                                              }
                                              
                                            }
                                            Navigator.pop(context);
                                            changeScreen(context, ThankYou());
                                            return;
                                          },
                                          child: Text(
                                            "موافق",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          color: const Color(0xFF1BC0C5),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "أرفض",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: green),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                  },
                  child: CustomText(
                    text: "  اطلب الآن ",
                    size: 18,
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
