import 'package:assessment_test_hogr/controllers/page_controller.dart';
import 'package:assessment_test_hogr/utils/appstyle.dart';
import 'package:assessment_test_hogr/view/screens/page3.dart';
import 'package:assessment_test_hogr/view/screens/page6.dart';
import 'package:assessment_test_hogr/view/screens/tab_one_page.dart';
import 'package:assessment_test_hogr/view/screens/tab_two_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2 extends StatelessWidget {
   Page2({super.key, });


  @override
  Widget build(BuildContext context) {
    final LandPageController landPageController= Get.put(LandPageController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:   Obx(() {
        return   WillPopScope(
          onWillPop: () async {
            if (landPageController.popupOpen.value) {
              landPageController.closePopup();
              Get.back();
              return false;
            } else if (landPageController.tabIndex.value != 0) {
              landPageController.changeTabIndex(0);
              return false;
            }
            return true;
          },
          child: CupertinoTabScaffold(

              tabBar: CupertinoTabBar(
                currentIndex: landPageController.tabIndex.value,
                onTap: (index) {
                  if (landPageController.tabIndex.value == index) {
                    Get.offUntil(Tab2Page() as Route, (route) => Get.currentRoute == '/page2');
                      // Get.off('/page2');
                    // Get.until((route) => Get.currentRoute == '/page2');
                    landPageController.closePopup();
                  } else {
                    landPageController.changeTabIndex(index);
                  }
                },
                activeColor: Colors.black,
                // backgroundColor:  landPageController.tabIndex.value==landPageController.tabIndex.value?Colors.black:Colors.grey,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon:
                      const Icon(
                        Icons.tab_outlined, color: Colors.transparent, size: 0,),
                      label: 'Tab 1 ',
                      backgroundColor: landPageController.tabIndex.value == 0
                          ? Colors.black
                          : Colors.grey),
                  BottomNavigationBarItem(
                      icon: const Icon(
                          Icons.tab_outlined, color: Colors.transparent),
                      label: 'Tab 2 ',
                      backgroundColor: landPageController.tabIndex.value == 1
                          ? Colors.black
                          : Colors.grey),
                  BottomNavigationBarItem(
                      icon: const Icon(
                          Icons.tab_outlined, color: Colors.transparent),
                      label: 'Tab 3 ',
                      backgroundColor: landPageController.tabIndex.value == 2
                          ? Colors.black
                          : Colors.grey),
                ],

              ),
              tabBuilder: (context, index) {
                return CupertinoTabView(
                  builder: (context) {
                    switch (index) {
                      case 0:
                        return Tab1Page();
                      case 1:
                        return const Tab2Page();
                      case 2:
                        return const Page6();
                      default:
                        return Container();
                    }
                  },
                );

              }),
        );
      }),
    );



  }
}
