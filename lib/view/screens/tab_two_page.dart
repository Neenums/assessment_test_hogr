import 'package:assessment_test_hogr/utils/appstyle.dart';
import 'package:assessment_test_hogr/view/screens/page2.dart';
import 'package:assessment_test_hogr/view/screens/page5.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: Center(child: Text('PAGE 2',style: appbarStyle,textAlign: TextAlign.center,)),
      ),
      body: SafeArea(
        child: Container(alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: width*.15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black)),
            onPressed: () {
              Get.to(Page5());
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Page 5 ',style: buttonStyle,),
                const Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 14,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
