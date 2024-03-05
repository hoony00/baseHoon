import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MyMindScreen extends ConsumerStatefulWidget {
  const MyMindScreen({super.key});

  @override
  ConsumerState<MyMindScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MyMindScreen> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Center(child: const Text('MyMindScreen', style: TextStyle(color: Colors.blueAccent, fontSize: 30),));
  }
}
