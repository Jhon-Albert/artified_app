import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/components/history_tile.dart';

class TransacHistoryPage extends StatefulWidget {
  const TransacHistoryPage({super.key});

  @override
  State<TransacHistoryPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TransacHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Transaction History",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 520,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFBF0E0E), Color(0xFF290000)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const HistoryTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
