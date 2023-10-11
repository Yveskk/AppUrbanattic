import 'package:flutter/material.dart';
import 'package:urbanattic/constants/global_style.dart';

void showLoadinPage(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ),
  );
}
