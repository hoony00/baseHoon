import 'package:flutter/material.dart';

class CustomPng extends StatelessWidget {

  final String fileDirectory;
  final String fileName;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CustomPng({
    required this.fileDirectory,
    required this.fileName,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250,
      height: height ?? 250,
      child: Image.asset("asset/png/$fileDirectory/$fileName.png", fit: fit,),
    );
  }

}
