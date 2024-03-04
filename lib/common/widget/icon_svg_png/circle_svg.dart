import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleSvg extends StatelessWidget {
  final double diameter;
  final String fileDirectory;
  final String fileName;
  final BoxFit boxFit;
  final Color backGroundColor;

  final double? svgWidth;
  final double? svgHeight;


  const CircleSvg({
    required this.diameter,
    required this.fileDirectory,
    required this.fileName,
    this.boxFit = BoxFit.cover,
    this.backGroundColor = Colors.white,
    this.svgWidth,
    this.svgHeight,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: diameter,
      height: diameter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(diameter * 0.5),
        child: Container(
          color: backGroundColor,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "asset/svg/$fileDirectory/$fileName.svg",
            fit: boxFit,
            width: svgWidth ?? diameter,
            height: svgHeight ?? diameter,
          ),
        ),
      ),
    );
  }
}
