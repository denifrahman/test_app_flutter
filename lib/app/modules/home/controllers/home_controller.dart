import 'package:get/get.dart';
import 'package:test_app_flutter/app/modules/home/models/post.dart';
import 'package:test_app_flutter/app/modules/home/providers/home_provider.dart';

class HomeController extends GetxController {
  final provider = Get.put(HomeProvider());

  final list = <Post>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchData() async {
    Response<List<Post>> response = await provider.fetchData();
    list.value = response.body!;
  }
}
