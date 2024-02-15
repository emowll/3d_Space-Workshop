import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class CustomO3DController extends O3DController {
  void rotate({required double dx, required double dy}) {}
}

class ThreeModelPage extends StatefulWidget {
  const ThreeModelPage({Key? key}) : super(key: key);

  @override
  State<ThreeModelPage> createState() => _ThreeModelPageState();
}

class _ThreeModelPageState extends State<ThreeModelPage> {
  CustomO3DController o3dController = CustomO3DController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                o3dController.rotate(
                  dx: details.delta.dx,
                  dy: details.delta.dy,
                );
              });
            },
            child: O3D(
              src: "assets/Astronaut.glb",
              controller: o3dController,
              ar: false,
              autoPlay: true,
              autoRotate: true,
            ),
          ),
          
        ],
      ),
    );
  }
}
