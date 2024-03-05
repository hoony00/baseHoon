import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('MyScreen', style: TextStyle(color: Colors.blueAccent, fontSize: 30),));
  }
}
