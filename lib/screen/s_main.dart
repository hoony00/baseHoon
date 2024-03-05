import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindbot/common/common.dart';
import 'package:mindbot/common/constant/app_colors.dart';
import 'package:mindbot/screen/canvers/s_canpers.dart';
import 'package:mindbot/screen/my/s_my.dart';
import 'package:mindbot/screen/sketch/s_sketch.dart';
import 'package:mindbot/screen/today/s_today.dart';

import '../provider/page_index_provider.dart';
import 'bottom_navigation/w_convex_bottom.dart';
import 'my_mind/s_my_mind.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = ref.watch(pageIndexProvider);

    final List<Widget> body = [
      Visibility(visible: indexProvider == 0, child: TodayScreen()),
      Visibility(visible: indexProvider == 1, child: SketchScreen()),
      Visibility(visible: indexProvider == 2, child: MyMindScreen()),
      Visibility(visible: indexProvider == 3, child: CanversScreen()),
      Visibility(visible: indexProvider == 4, child: MyScreen()),
    ];

    return Scaffold(
      floatingActionButton: Visibility(
        visible: indexProvider != 2,
        child: FloatingActionButton(
          onPressed: () {
            print("floatingActionButton");
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: indexProvider,
          children: body,
        ),
      ),
      bottomNavigationBar: const ConvexBottomNavigation(),
    );
  }
}




