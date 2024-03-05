import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindbot/common/common.dart';



class MyMindScreen extends ConsumerStatefulWidget {
  const MyMindScreen({super.key});

  @override
  ConsumerState<MyMindScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MyMindScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('MainScreen'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('MainScreen'),
      ),
    );
  }
}
