import 'package:get/get.dart';
import 'package:test_app_flutter/app/modules/home/models/post.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';
  }

  Future<Response<List<Post>>> fetchData() async {
    try {
      Response response = await get('posts');
      if (response.status.hasError) {
        return Future.error('Error fetching data');
      } else {
        List<Post> posts =
            (response.body as List).map((item) => Post.fromJson(item)).toList();
        return Response<List<Post>>(body: posts);
      }
    } catch (e) {
      return Future.error('Error fetching data: $e');
    }
  }
}
