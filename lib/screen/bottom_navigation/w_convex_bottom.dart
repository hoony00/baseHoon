import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mindbot/common/common.dart';

import '../../common/constant/app_colors.dart';
import '../../provider/height_widgth_provider.dart';
import '../../provider/page_index_provider.dart';

class ConvexBottomNavigation extends ConsumerStatefulWidget {
  const ConvexBottomNavigation({super.key});

  @override
  ConsumerState<ConvexBottomNavigation> createState() =>
      _ConvexBottomNavigationState();
}

class _ConvexBottomNavigationState
    extends ConsumerState<ConvexBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final alarmBadge = ref.watch(alarmBadgeProvider);
    final indexProvider = ref.watch(pageIndexProvider);

    final height = context.screenHeight;

    return ConvexAppBar.badge(
      {
        0: alarmBadge != 0 ? alarmBadge.toString() : null,
      },
      badgeMargin: EdgeInsets.only(left: height * 0.028, bottom: height * 0.04),
      style: TabStyle.fixedCircle,
      backgroundColor: AppColors.primaryColor,
      elevation: 7,
      cornerRadius: 15,
      height: height * 0.09,
      // height: indexProvider == 2 ? height * 0.056 : height * 0.09,

      items: [
        TabItem(icon: Icons.calendar_today_outlined, title: '투데이'),
        TabItem(icon: Icons.scatter_plot_outlined, title: '마음 스케치'),

        // lottie 아이콘 적용
        TabItem(
          icon: Lottie.asset('assets/json/lottie/poketmon.json',
              width: height * 0.03,
              height: height * 0.04,
              fit: BoxFit.cover,),
        ),
        TabItem(icon: Icons.assessment_outlined, title: '마음 캔버스'),
        TabItem(icon: Icons.person_2_outlined, title: 'my'),
      ],

      // 초기값
      initialActiveIndex: indexProvider,

      onTap: (int i) {
        if (i == 0) {
          // 선택된 인덱스의 알림벳지 카운트 조절
          print("투데이");
          ref.read(alarmBadgeProvider.notifier).state++;
        } else if (i == 1) {
          ref.read(alarmBadgeProvider.notifier).state = 0;
        }

        // 화면 이동
        ref.read(pageIndexProvider.notifier).state = i;
      },
    );
  }
}

class ConvexStyleProvider extends StyleHook {
  late double height;

  ConvexStyleProvider({required this.height});

  @override
  double get activeIconSize => height * 0.05;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => height * 0.03;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
        color: color, fontSize: height * 0.016, fontFamily: fontFamily);
  }
}
