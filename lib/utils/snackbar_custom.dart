import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context, {
  required String message,
  IconData icon = Icons.error_outline,
  Color backgroundColor = Colors.redAccent,
  Duration duration = const Duration(seconds: 3),
}) {
  final rootContext = Navigator.of(context, rootNavigator: true).context;

  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  ScaffoldMessenger.of(rootContext)
    ..clearSnackBars()
    ..showSnackBar(snackBar);
}
