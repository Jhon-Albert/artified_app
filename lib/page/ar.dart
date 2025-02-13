import 'package:flutter/material.dart';
import 'package:le_katsu_app_new/models/food.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARFood extends StatefulWidget {
  final Food food;
  const ARFood({
    super.key,
    required this.food,
  });

  @override
  State<ARFood> createState() => _ARFoodState();
}

class _ARFoodState extends State<ARFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Food of ${widget.food.name}"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ModelViewer(
            backgroundColor: const Color(0xFFBF0E0E),
            src: widget.food.foodAR,
            alt: "A 3D model of food",
            ar: true,
            autoRotate: true,
            disableZoom: true,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black54,
              child: Text(
                'Calories: ${widget.food.foodCalorie}',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
