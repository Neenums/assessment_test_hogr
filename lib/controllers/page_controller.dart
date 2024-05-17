import 'package:get/get.dart';

class LandPageController extends GetxController {
  var tabIndex = 0.obs;
  var popupOpen = false.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void openPopup() {
    popupOpen.value = true;
  }

  void closePopup() {
    popupOpen.value = false;
  }

}