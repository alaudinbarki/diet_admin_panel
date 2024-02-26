import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ShowToasts {
  static Future<void> showSuccessToast({
    required String title,
    required String message,
    required BuildContext context,
  }) async {
    toastification.show(
      showProgressBar: false,
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black45,
        ),
      ),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(
        seconds: 2,
        milliseconds: 500,
      ),
      // animationBuilder: (
      //   context,
      //   animation,
      //   alignment,
      //   child,
      // ) {
      //   return ScaleTransition(
      //     scale: animation,
      //     child: child,
      //   );
      // },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
    );
  }

  static Future<void> showInfo({
    required String title,
    required String message,
    required BuildContext context,
  }) async {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black45,
        ),
      ),
      showProgressBar: false,
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  static Future<void> showError({
    required String title,
    required String message,
    required BuildContext context,
  }) async {
    toastification.show(
      context: context,
      showProgressBar: false,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
      description: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black45,
        ),
      ),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(
        seconds: 2,
        milliseconds: 500,
      ),
      animationBuilder: (
        context,
        animation,
        alignment,
        child,
      ) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      dragToClose: true,
    );
  }
}
