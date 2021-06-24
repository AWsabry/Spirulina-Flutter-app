import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_course/scr/models/order.dart';

class OrderServices {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({
    String userId,
    String id,
    String status,
    String firstName,
    String secondName,
    List cart,
    int totalPrice,
  }) {
    _firestore.collection(collection).document(id).setData({
      "userId": userId,
      "id": id,
      "cart": cart,
      "total": totalPrice,
      "firstName": firstName,
      "secondName": secondName,
      "createdAt": DateTime.now(),
      "status": status
    });
    
  }

  Future<List<OrderModel>> getUserOrders({String userId}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.documents) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
