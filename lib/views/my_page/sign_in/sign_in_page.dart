import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_in_controller.dart';
import 'package:allfit_flutter/views/my_page/sign_in/sign_up/agreement_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_toast.dart';
import 'package:allfit_flutter/widgets/unprepared_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  static const route = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: "로그인"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              TextField(
                controller: controller.emailEdit,
                decoration: const InputDecoration(
                  hintText: "아이디 (이메일)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 12),
              ),
              Obx(() {
                if (!controller.isEmailValueFailed) {
                  return const SizedBox.shrink();
                }
                return Text(
                  controller.emailErrorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 11,
                  ),
                );
              }),
              const SizedBox(height: 8),
              TextField(
                controller: controller.pwEdit,
                decoration: const InputDecoration(
                  hintText: "비밀번호",
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12),
                obscureText: true,
              ),
              Obx(() {
                if (!controller.isPwValueFailed) {
                  return const SizedBox.shrink();
                }
                return Text(
                  controller.pwErrorMessage,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 11,
                  ),
                );
              }),
              const SizedBox(height: 20),
              CustomElevatedButton(
                onPressed: () async {
                  if (await controller.signIn()) {
                    Get.back();
                    showCustomToast("로그인 성공!");
                  }
                },
                child: const Text(
                  "로그인하기",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => showUnpreparedDialog(context),
                    child: const Text(
                      "아이디 찾기",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const VerticalDivider(width: 16),
                  TextButton(
                    onPressed: () => showUnpreparedDialog(context),
                    child: const Text(
                      "비밀번호 찾기",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed(AgreementPage.route);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: lightGreyBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 44,
                        child: const Text(
                          "계정이 없으신가요? 간편가입하기",
                          style: TextStyle(
                            color: lightBlackTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
