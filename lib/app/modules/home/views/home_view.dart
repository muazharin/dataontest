import 'package:dataontest/app/data/widgets/detail_card.dart';
import 'package:dataontest/app/data/widgets/input_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<HomeController>(builder: (context) {
          if (controller.isShow) {
            return InputText(
              hintText: "Searching...",
              controller: controller.search,
              onChanged: (v) => controller.doSearch(),
            );
          }
          return const Text('Home');
        }),
        actions: [
          GetBuilder<HomeController>(
            builder: (context) {
              if (controller.isShow) {
                return InkWell(
                  onTap: () => controller.show(),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: () => controller.show(),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (context) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (controller.isError) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(controller.error),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ListView(
              children: controller.univ.asMap().entries.map<Widget>((e) {
                return InkWell(
                  onTap: () {
                    Get.bottomSheet(DetailCard(e: e.value));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color:
                          e.key % 2 == 0 ? Colors.grey[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text("${e.value.name}"),
                      subtitle: Text("${e.value.country}"),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
