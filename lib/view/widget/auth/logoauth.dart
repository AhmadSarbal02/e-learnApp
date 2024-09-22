import 'package:flutter/material.dart';
import 'package:project/core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 0),
      height: 200,
      // width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
      ),
      child: Image.asset(
        AppImageAsset.logo,
        height: 200,
      ),
    );
  }
}
