import 'package:flutter/material.dart';

class CanversScreen extends StatefulWidget {
  const CanversScreen({super.key});

  @override
  State<CanversScreen> createState() => _CanversScreenState();
}

class _CanversScreenState extends State<CanversScreen> {


  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('CanversScreen', style: TextStyle(color: Colors.blueAccent, fontSize: 30),));
  }
}
