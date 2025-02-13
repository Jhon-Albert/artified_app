import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/services/auth/database/storage.dart';
import 'package:provider/provider.dart';

class MyGcashReceipt extends StatefulWidget {
  const MyGcashReceipt({super.key});

  @override
  State<MyGcashReceipt> createState() => _MyGcashReceiptState();
}

class _MyGcashReceiptState extends State<MyGcashReceipt> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    await Provider.of<StorageService>(context, listen: false).fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StorageService>(builder: (context, storageService, child) {
      return Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
        child: Container(
          width: 360,
          height: 500,
          decoration: BoxDecoration(
            color: const Color(0xFFBF0E0E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(
                    image: AssetImage('assets/code.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: const Text(
                  "Le Katsu Manila",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '09123456789',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 200,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => storageService.uploadImage(),
                  child: const Text(
                    'Proof of Payment',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
