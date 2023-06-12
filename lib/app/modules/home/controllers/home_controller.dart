import 'dart:convert';

import 'package:dataontest/app/data/models/university_model.dart';
import 'package:dataontest/app/data/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class HomeController extends GetxController {
  var isLoading = false;
  var isError = false;
  var isShow = false;
  var error = '';
  var univ = <UniversityModel>[];
  var path = "http://universities.hipolabs.com/search?country=Indonesia";
  var search = TextEditingController();
  final delay = Debouncer(delay: const Duration(seconds: 1));

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getData() async {
    isLoading = true;
    univ = [];
    update();
    try {
      var response = await HttpServices().get(path);
      var data = jsonDecode(response.body);
      var list =
          (data as List).map((e) => UniversityModel.fromJson(e)).toList();

      univ.addAll(list);
      if (search.text.isNotEmpty) {
        univ.removeWhere((e) => !e.name!
            .toString()
            .toLowerCase()
            .contains(search.text.toLowerCase()));
      }
      update();
    } catch (e) {
      isError = true;
      error = "$e";
      update();
    } finally {
      isLoading = false;
      update();
    }
  }

  void show() {
    isShow = !isShow;
    if (!isShow) {
      search.text = '';
      getData();
    }
    update();
  }

  void doSearch() {
    delay.call(() {
      getData();
    });
  }
}
