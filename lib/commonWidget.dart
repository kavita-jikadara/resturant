import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CommonWidget extends ChangeNotifier {
  toastSuccess(context, message) {
    toastification.show(
      context: context,
      title: Text('$message'),
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
    );
  }
}
