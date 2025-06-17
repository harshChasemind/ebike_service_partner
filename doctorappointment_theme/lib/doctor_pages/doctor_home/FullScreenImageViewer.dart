import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;
  final String tag;

  const FullScreenImageViewer({
    Key? key,
    required this.imagePath,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Center(
          child: Hero(
            tag: tag,
            child: Image.asset(
              imagePath, // Or use Image.network
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
