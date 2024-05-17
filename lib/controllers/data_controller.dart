import 'package:assessment_test_hogr/model/data_model.dart';
import 'package:assessment_test_hogr/services/api_service.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var postDataList = <DataModel>[].obs;

  var isLoading = true.obs;


  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var postData = await ApiServices().getAllPosts();
      if (postData != null) {
        postDataList.value = postData;
      }
    } finally {
      isLoading(false);
    }
  }
}
