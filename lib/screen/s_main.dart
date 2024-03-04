import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mindbot/common/constant/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  bool get extendBody => true;

  static double get bottomNavigationBarBorderRadius => 30.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody, //bottomNavigationBar 아래 영역 까지 그림
      body: Container(
        padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
        child: SafeArea(
          bottom: !extendBody,
          child: Placeholder(),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: AppColors.primaryColor,
        elevation: 10, // 그림자
        top: -30, // 아이콘 높이
        items: [
          TabItem(icon: Icons.calendar_today, title: '투데이'),
          TabItem(icon: Icons.scatter_plot_rounded, title: '마음 스케치'),
          TabItem(icon: Icons.star),
          TabItem(icon: Icons.assessment, title: '마음 캔버스'),
          TabItem(icon: Icons.person_2_outlined, title: 'my'),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }

}
