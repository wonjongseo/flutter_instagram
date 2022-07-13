import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';
import 'package:flutter_clone_inst/src/controller/bottom_nav_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
          () => Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: BottomNavigationBar(
              // 선택된 아이콘 상승 하는 거 방지

              type: BottomNavigationBarType.fixed,

              elevation: 0,

              showSelectedLabels: false,
              showUnselectedLabels: false,

              currentIndex: controller.pageIndex.value,

              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.homeOff),
                    activeIcon: ImageData(IconsPath.homeOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.searchOff),
                    activeIcon: ImageData(IconsPath.searchOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.uploadIcon), label: 'home'),
                BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff),
                    activeIcon: ImageData(IconsPath.activeOn),
                    label: 'home'),
                BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    label: 'home'),
              ],
              iconSize: 5,
            ),
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                Container(
                  child: Center(child: Text('home')),
                ),
                Container(
                  child: Center(child: Text('search')),
                ),
                Container(
                  child: Center(child: Text('upload')),
                ),
                Container(
                  child: Center(child: Text('activty')),
                ),
                Container(
                  child: Center(child: Text('mypage')),
                ),
              ],
            ),
          ),
        ),
        onWillPop: controller.willPopAction);
  }
}
