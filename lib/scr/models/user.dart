import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_course/scr/models/cart_item.dart';

class UserModel {
  static const ID = "id";
  static const FIRSTNAME = "firstName";
  static const SECONDNAME = "secondName";
  static const EMAIL = "email";
  static const CART = "cart";
  static const MOBILE = "mobile";

  String _firstName;
  String _secondName;
  String _email;
  String _id;
  int _priceSum = 0;
  String _mobile;

//  getters
  String get firstName => _firstName;
  String get email => _email;
  String get secondName => _secondName;
  String get id => _id;  
  String get mobile => _mobile;

//  public variable
  List cart;
  int totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _firstName = snapshot.data[FIRSTNAME];
    _secondName = snapshot.data[SECONDNAME];
    _email = snapshot.data[EMAIL];
    _mobile = snapshot.data[MOBILE];
    _id = snapshot.data[ID];
    cart = snapshot.data[CART] ?? [];
    totalCartPrice = snapshot.data[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.data[CART]);
  }

  int getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }

    int total = _priceSum;
    return total;
  }

}
