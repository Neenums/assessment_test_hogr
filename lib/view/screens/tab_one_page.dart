import 'package:assessment_test_hogr/controllers/page_controller.dart';
import 'package:assessment_test_hogr/utils/appstyle.dart';
import 'package:assessment_test_hogr/view/screens/page2.dart';
import 'package:assessment_test_hogr/view/screens/page3.dart';
import 'package:assessment_test_hogr/view/screens/popup.dart';
import 'package:assessment_test_hogr/view/screens/tab_two_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab1Page extends StatelessWidget {
   Tab1Page({super.key});

  final LandPageController landPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    // if (Get.arguments != null) {
    //   landPageController.changeTabIndex(Get.arguments);
    // }
    // final LandPageController landPageController=Get.put(LandPageController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
      Scaffold(appBar: AppBar(
      backgroundColor:Colors.black,title: Center(child: Text('PAGE 2 ',style: appbarStyle,)),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: width * .17),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black)),
              onPressed: () {


                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page3()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Page 3 ',
                    style: buttonStyle,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 14,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * .06,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: width * .17),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black)),
              onPressed: () {
                Get.dialog(Popup1());


              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Popup 1 ',
                    style: buttonStyle,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black,
                    size: 14,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
