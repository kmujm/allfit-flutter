import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_controller.dart';
import 'package:allfit_flutter/views/my_page/inquiry/inquiry_writing_page.dart';
import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "1:1 문의하기"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              "무엇을 도와드릴까요?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 16),
            Text(
              "02-1234-5678\n" +
                  "\nallfit@gmail.com\n" +
                  "\nAM 09:00 ~ PM 18:00 (점심시간 12:00-13:00)\n" +
                  "\nDAY OFF (토/일/공휴일)\n",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await launchUrl(Uri.parse("tel:02-1234-5678"));
                    },
                    child: Text(
                      "전화 상담",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => InquiryWritingPage(),
                        binding: BindingsBuilder.put(
                          () => InquiryWritingController(),
                        ),
                      );
                    },
                    child: Text(
                      "채팅 상담",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}