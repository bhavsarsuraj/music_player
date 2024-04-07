import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/app/utils/constants/app_colors.dart';
import 'package:music_player/app/utils/constants/strings.dart';

abstract class ToastHelper {
  // Show Success Toast
  static Function()? cancelToast;

  static void showSuccess({
    String title = ToastTitles.success,
    required String message,
    VoidCallback? onTap,
  }) {
    _showToast(
      title: title,
      titleColor: AppColors.toastSuccess,
      subtitle: message,
      icon: Icons.check_circle_outline_rounded,
      onTap: onTap,
    );
  }

  // Show Info Toast
  static void showInfo({
    String title = ToastTitles.info,
    required String message,
    VoidCallback? onTap,
  }) {
    _showToast(
      title: title,
      titleColor: AppColors.toastInfo,
      subtitle: message,
      icon: Icons.info_outline,
      onTap: onTap,
    );
  }

  // Show Warning Toast
  static void showWarning({
    String title = ToastTitles.warning,
    required String message,
    VoidCallback? onTap,
  }) {
    _showToast(
      title: title,
      titleColor: AppColors.toastWarning,
      subtitle: message,
      icon: Icons.warning_amber_rounded,
      onTap: onTap,
    );
  }

  // Show Error Toast
  static void showError({
    String title = ToastTitles.error,
    required String message,
    VoidCallback? onTap,
  }) {
    _showToast(
      title: title,
      titleColor: AppColors.red,
      subtitle: message,
      icon: Icons.error_outline_rounded,
      onTap: onTap,
    );
  }

  // Show Notification Toast
  static void showNotification({
    required String title,
    required String message,
    VoidCallback? onTap,
  }) {
    _showToast(
      title: title,
      titleColor: AppColors.toastSuccess,
      subtitle: message,
      icon: Icons.notifications_active_outlined,
      onTap: onTap,
    );
  }

  // Hide Notification Toast
  static void hideNotification() {
    cancelToast?.call();
  }

  static void _showToast({
    required String title,
    required Color titleColor,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3),
      toastBuilder: (cancelFunc) {
        cancelToast = cancelFunc;
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 15,
            color: Theme.of(Get.context!).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              onTap: onTap,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: titleColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: titleColor,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          subtitle,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
