import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:desafio_gpboticario/ui/dash/dash_controller.dart';
import 'package:desafio_gpboticario/ui/feed/feed_page.dart';
import 'package:desafio_gpboticario/ui/news/news_page.dart';
import 'package:desafio_gpboticario/ui/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashPage extends GetView<DashController> {
  final List<Widget> bodyContent = [
    NewsPage(),
    FeedPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(controller.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          child: BottomNavigationBar(
            backgroundColor: DesignColors.COLOR_BACKGROUND,
            selectedItemColor: DesignColors.COLOR_ORANGE,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Notícias",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bubble_middle_bottom),
                label: "Feed",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: "Perfil",
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.selectedIndex = index,
          ),
        ),
      ),
    );
  }
}
