import 'package:allfit_flutter/domains/order/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TailorOrderDetailController extends GetxController {
  static TailorOrderDetailController get to => Get.find();

  final _surchargeExists = false.obs;
  bool get surchargeExists => _surchargeExists.value;
  set surchargeExists(bool value) => _surchargeExists.value = value;

  final surchargeEdit = TextEditingController();

  final _surcharge = 0.obs;
  int get surcharge => _surcharge.value;
  set surcharge(int value) => _surcharge.value = value;

  @override
  void onClose() {
    surchargeEdit.dispose();
  }

  Future<void> finishOrder(String id) async {
    await orderRepository.finishOrder(id);
  }
}