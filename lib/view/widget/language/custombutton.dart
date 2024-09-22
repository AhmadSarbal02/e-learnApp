import 'package:flutter/material.dart';

import 'package:project/core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String lang;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.lang, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.only(left: 60, right: 60),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          onPressed!();
        },
        textColor: Colors.white,
        child: Text(
          lang,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
