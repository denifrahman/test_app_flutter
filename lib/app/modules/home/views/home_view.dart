import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchData(),
        child: Obx(() {
          if (controller.list.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                final post = controller.list[index];
                return Card(
                  child: ListTile(
                    title: Text(post.title!),
                    subtitle: Text(post.body!),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
