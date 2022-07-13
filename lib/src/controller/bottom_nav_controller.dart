import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_inst/src/components/MessagePopup.dart';
import 'package:flutter_clone_inst/src/pages/upload.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
  }

  Future<bool> willPopAction() async {
    if (bottomHistory.length == 1 && bottomHistory[0] == PageName.HOME.index) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
                message: '종료 하시겠습니까?',
                okCallBack: () {
                  exit(0);
                },
                cancelCallBack: Get.back,
                title: '시스템',
              ));
      return true;
    } else {
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      bottomHistory.removeLast();
      return false;
    }
  }
}
