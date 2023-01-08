import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //todo open camera
      },
      child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
            color: const Color(0xff98A8F9),
            borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
