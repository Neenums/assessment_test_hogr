import 'package:assessment_test_hogr/controllers/page_controller.dart';
import 'package:assessment_test_hogr/utils/appstyle.dart';
import 'package:assessment_test_hogr/view/screens/page3.dart';
import 'package:assessment_test_hogr/view/screens/tab_two_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page2.dart';

class Popup1 extends StatelessWidget {
  final LandPageController controller = Get.find<LandPageController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
          return WillPopScope(
            onWillPop: () async {
              controller.closePopup();
              return true;
            },
            child: AlertDialog(
              backgroundColor: Colors.grey[700],
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 15,
                              child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.grey[600],
                                  child: const Center(
                                      child: Icon(Icons.clear)))))
                    ],
                  ),
                  Padding(

                    padding: EdgeInsets.symmetric(
                        horizontal: width * .05,
                        vertical: height * .03),
                    child: Text(
                      'Popup 1 ',
                      style: buttonStyle,
                    ),
                  )
                ],
              ),
              actions:[ Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10))),
                        onPressed: () {
                          Get.back();
                          controller.closePopup();
                          Get.toNamed('/page3');


                        },
                        child: Text(
                          'Page 3 ',
                          style:
                          buttonStyle.copyWith(color: Colors.white,fontWeight: FontWeight.normal),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10))),
                        onPressed: () {
                          controller.changeTabIndex(1);
                          controller.closePopup();

                                 Get.back();
                          Get.to(Tab2Page());
                        },
                        child: Text(
                          'Tab 2 ',
                          style:
                          buttonStyle.copyWith(color: Colors.white,fontWeight: FontWeight.normal),
                        ),
                      ),

                    ],
                  ),
                ],
              )]


            ),
          );

  }
}
