import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:le_katsu_app_new/global/common/toast.dart';

class FireStoreService {
  //get orders
  final CollectionReference orders =
  FirebaseFirestore.instance.collection('orders');

  //save orders - FireStore
  Future<void> saveOrderToDatabase(
      String receipt,
      ) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await orders.add({
        'date': DateTime.now(),
        'order': receipt,
        'UserId': currentUser.uid,
        'Username': currentUser.displayName,
      });
      showToast(message: 'Order is saved.');
    } else {
      print("Error.");
    }
  }
}

/*class RealTimeDataBase {
  // ref to orders node
  final DatabaseReference ordersRef = FirebaseDatabase.instance.ref('orders');

  // save order
  Future<void> saveOrderToDatabase(String receipt) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      Map<String, dynamic> orderData = {
        'date': DateTime.now().toString(),
        'order': receipt,
        'UserId': currentUser.uid,
        'Username': currentUser.displayName,
      };
      await ordersRef.push().set(orderData);
    }
  }
}*/
