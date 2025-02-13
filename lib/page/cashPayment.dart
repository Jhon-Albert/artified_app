import 'package:flutter/material.dart';
//import 'package:le_katsu_app/services/auth/database/firestore.dart';
import 'package:le_katsu_app_new/components/receipt.dart';
import 'package:le_katsu_app_new/models/restaurant.dart';
import 'package:le_katsu_app_new/services/auth/database/firestore.dart';
import 'package:provider/provider.dart';

class CashPayment extends StatefulWidget {
  const CashPayment({super.key});

  @override
  State<CashPayment> createState() => _CashPaymentState();
}

class _CashPaymentState extends State<CashPayment> {
  FireStoreService db = FireStoreService();
  //RealTimeDataBase dbrt = RealTimeDataBase();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // firestore
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);

    // realtimedatabase
    Future.delayed(Duration.zero, () async {
      //await dbrt.saveOrderToDatabase(receipt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Cash Payment",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );
  }
}
