import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindbot/common/common.dart';
import 'package:mindbot/common/constant/app_colors.dart';
import 'package:mindbot/screen/canvers/s_canpers.dart';
import 'package:mindbot/screen/main/s_main.dart';
import 'package:mindbot/screen/my/s_my.dart';
import 'package:mindbot/screen/sketch/s_sketch.dart';
import 'package:mindbot/screen/today/s_today.dart';

import '../provider/page_index_provider.dart';

class MainFregment extends ConsumerStatefulWidget {
  const MainFregment({super.key});

  @override
  ConsumerState<MainFregment> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainFregment> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final indexProvider = ref.watch(pageIndexProvider);

    final List<Widget> body = [
      Visibility(visible: indexProvider == 0, child: const TodayScreen()),
      Visibility(visible: indexProvider == 1, child:  SketchScreen()),
      Visibility(visible: indexProvider == 2, child:  MainScreen()),
      Visibility(visible: indexProvider == 3, child:  CanversScreen()),
      Visibility(visible: indexProvider == 4, child:  MyScreen()),
    ];

    /// Todo : 반응형 높이와 크기 계산을 상태관리로 관리할지?
    final height = context.screenHeight;

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
        child:  IndexedStack(
          index: indexProvider,
          children: body,
        ),
      ),

      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: AppColors.primaryColor,
        elevation: 10, // 그림자
        top: - height * 0.03, // 아이콘 높이
        items: const [
          TabItem(icon: Icons.calendar_today, title: '투데이'),
          TabItem(icon: Icons.scatter_plot_rounded, title: '마음 스케치'),
          TabItem(icon: Icons.star),
          TabItem(icon: Icons.assessment, title: '마음 캔버스'),
          TabItem(icon: Icons.person_2_outlined, title: 'my'),
        ],
        // 초기값
        initialActiveIndex: 0,
        onTap: (int i) {
          ref.read(pageIndexProvider.notifier).state = i;
        },

      ),
    );
  }

}
