import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/order/order_summary_page.dart';
import 'package:allfit_flutter/widgets/custom_app_bar.dart';
import 'package:allfit_flutter/widgets/custom_elevated_button.dart';
import 'package:allfit_flutter/widgets/custom_padding.dart';
import 'package:allfit_flutter/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DepositInfoPage extends StatelessWidget {
  const DepositInfoPage({super.key});

  static const route = "/order/deposit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            const Image(
              width: 108,
              image: AssetImage("assets/images/bank.png"),
            ),
            const SizedBox(height: 16),
            const Text(
              "홍길동의 KB국민은행 계좌로\n15,000원을 보내주세요",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              "KB국민 000000-00-000000",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                await Clipboard.setData(
                  const ClipboardData(text: "KB국민 000000-00-000000"),
                );
                await showCustomToast("계좌번호 복사 완료");
              },
              child: Container(
                alignment: Alignment.center,
                width: 188,
                height: 34,
                decoration: BoxDecoration(
                  color: lightGreyBackgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "계좌번호 복사",
                  style: TextStyle(
                    color: bluePointColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  width: 36,
                  image: AssetImage("assets/images/delivery_truck.png"),
                ),
                SizedBox(width: 8),
                Text("입금이 확인되면 수거가 시작됩니다"),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(OrderSummaryPage.route);
              },
              child: const Text(
                "확인",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const CustomBottomPadding(),
          ],
        ),
      ),
    );
  }
}
