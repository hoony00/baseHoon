import 'package:flutter/material.dart';

class SketchScreen extends StatefulWidget {
  const SketchScreen({super.key});

  @override
  State<SketchScreen> createState() => _SketchScreenState();
}

class _SketchScreenState extends State<SketchScreen> {
  @override
  Widget build(BuildContext context) {


    print("sketch");

    return Visibility(
      visible: true,
        child: Center(child: const Text('SketchScreen', style: TextStyle(color: Colors.blueAccent),)));
  }
}
