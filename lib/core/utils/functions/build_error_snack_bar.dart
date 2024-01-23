import 'package:flutter/material.dart';

SnackBar buildErrorSnackBar(String errMessage) {
    return SnackBar(
      content: Center(
          child: Text(
        errMessage,
        style: const TextStyle(color: Colors.white),
      )),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.grey[800],
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}