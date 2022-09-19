import 'package:allfit_flutter/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class RewardPointPage extends StatelessWidget {
  const RewardPointPage({super.key});

  static const route = "/my_page/reward_point";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: "포인트 현황"),
      body: Placeholder(),
    );
  }
}
