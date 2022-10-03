import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_controller.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_key_value_list.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InquiryWritingPage extends GetView<InquiryWritingController> {
  const InquiryWritingPage({super.key});

  static const route = "/my_page/inquiry/writing";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const CustomTopPadding(),
              CustomKeyValueList(
                mainAxisAlignment: MainAxisAlignment.start,
                keyWidth: 100,
                interval: 16,
                keyStyle: const TextStyle(fontSize: 12),
                valueStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                data: {
                  "닉네임": controller.user.nickname,
                  "아이디 (이메일)": controller.user.email,
                },
              ),
              const SizedBox(height: 28),
              TextField(
                controller: controller.titleEdit,
                decoration: const InputDecoration(
                  hintText: "제목을 입력하세요.",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller.contentsEdit,
                decoration: const InputDecoration(
                  hintText: "내용을 입력하세요.",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                ),
                style: const TextStyle(fontSize: 12),
                minLines: 8,
                maxLines: null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      border: Border.all(color: greyPointColor),
                      borderRadius: BorderRadiusDirectional.circular(4),
                    ),
                    child: Obx(() {
                      return Checkbox(
                        activeColor: Colors.transparent,
                        checkColor: controller.allowReply
                            ? bluePointColor
                            : greyPointColor,
                        value: true,
                        onChanged: (value) {
                          controller.allowReply = !controller.allowReply;
                        },
                      );
                    }),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "이메일 받기",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Obx(() {
                return CustomElevatedButton(
                  text: "등록하기",
                  onPressed: !controller.canMoveOn
                      ? null
                      : () async {
                          await controller.inquire();
                          Get.back();
                        },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
