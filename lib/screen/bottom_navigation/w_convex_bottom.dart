import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindbot/common/common.dart';

import '../../common/constant/app_colors.dart';
import '../../provider/height_widgth_provider.dart';
import '../../provider/page_index_provider.dart';

class ConvexBottomNavigation extends ConsumerStatefulWidget {
  const ConvexBottomNavigation({super.key});

  @override
  ConsumerState<ConvexBottomNavigation> createState() => _ConvexBottomNavigationState();
}

class _ConvexBottomNavigationState extends ConsumerState<ConvexBottomNavigation> {

  @override
  Widget build(BuildContext context) {

    final alarmBadge = ref.watch(alarmBadgeProvider);
    final indexProvider = ref.watch(pageIndexProvider);
    final height = context.screenHeight;


    return indexProvider == 2  ?
    ConvexSingleNavigation() :

      ConvexAppBar.badge(
      {
        0: alarmBadge != 0 ? alarmBadge.toString() : null,
        1: Icons.assistant_photo,
        2: Colors.redAccent,
      },
      badgeMargin: const EdgeInsets.only(left: 30, bottom: 40),

      style: TabStyle.fixedCircle,
      backgroundColor: AppColors.primaryColor,
      elevation: 10,
      // 그림자
      cornerRadius: 15,
      // 모서리 둥글기
      height: indexProvider == 2 ? height * 0.0552 : height * 0.08,
      // 아이콘 높이
      top: -height * 0.03,
      // 아이콘 높이

      items: const [
        TabItem(
          icon: Icons.calendar_today,
          title: '투데이',
        ),
        TabItem(icon: Icons.scatter_plot_rounded, title: '마음 스케치'),
        TabItem(icon: Icons.star),
        TabItem(icon: Icons.assessment, title: '마음 캔버스'),
        TabItem(icon: Icons.person_2_outlined, title: 'my'),
      ],

      initialActiveIndex: 0,
      // 초기값
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

class ConvexSingleNavigation extends ConsumerStatefulWidget {
  const ConvexSingleNavigation({super.key});

  @override
  ConsumerState<ConvexSingleNavigation> createState() => _ConvexSingleNavigationState();
}

class _ConvexSingleNavigationState extends ConsumerState<ConvexSingleNavigation> {
  @override
  Widget build(BuildContext context) {
    return ConvexButton.fab(
      backgroundColor: AppColors.primaryColor,
      icon: Icons.star,
      color: Colors.white,
      onTap: () {
        ref.read(pageIndexProvider.notifier).state = 1;
      },
    );
  }
}

