import 'package:allfit_flutter/domains/inquiry/inquiry.dart';
import 'package:allfit_flutter/domains/inquiry/inquiry_repository.dart';
import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryWritingController extends GetxController {
  static InquiryWritingController get to => Get.find();

  late final Rx<User> _user;
  User get user => _user.value;
  set user(User value) => _user.value = value;

  final titleEdit = TextEditingController();
  final _titleText = "".obs;

  final contentsEdit = TextEditingController();
  final _contentsText = "".obs;

  final _allowReply = true.obs;
  bool get allowReply => _allowReply.value;
  set allowReply(bool value) => _allowReply.value = value;

  bool get canMoveOn =>
      _titleText.value.trim().isNotEmpty &&
      _contentsText.value.trim().isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    _user = MainController.to.currentUser!.obs;

    titleEdit.addListener(() {
      _titleText.value = titleEdit.text;
    });
    contentsEdit.addListener(() {
      _contentsText.value = contentsEdit.text;
    });
  }

  @override
  void onClose() {
    titleEdit.removeListener(() {});
    titleEdit.dispose();
    contentsEdit.removeListener(() {});
    contentsEdit.dispose();
  }

  Future<Inquiry> inquire() async {
    return inquiryRepository.createOne(
      Inquiry(
        id: "",
        title: titleEdit.text,
        nickname: user.username,
        email: user.email,
        contents: contentsEdit.text,
        isReplyAllowed: allowReply,
        createdAt: DateTime.now(),
      ),
    );
  }
}
