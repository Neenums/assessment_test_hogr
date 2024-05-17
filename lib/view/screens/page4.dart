import 'package:assessment_test_hogr/controllers/data_controller.dart';
import 'package:assessment_test_hogr/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          'PAGE 4',
          style: appbarStyle,
          textAlign: TextAlign.center,
        )),
      ),
      body: SafeArea(child: Obx(() {
        if (dataController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.sticky_note_2_outlined,
                        color: Colors.black,
                      ),
                    ),
                    title: Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 2, top: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            dataController.postDataList[index].title!,
                            style: buttonStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        )),
                  );
                },
                itemCount: dataController.postDataList.length,
              ))
            ],
          );
        }
      })),
    );
  }
}
