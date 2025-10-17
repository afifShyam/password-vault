import 'dart:ui';
import 'package:flutter/material.dart';

class AppSecurityWrapper extends StatefulWidget {
  final Widget child;

  const AppSecurityWrapper({super.key, required this.child});

  @override
  State<AppSecurityWrapper> createState() => _AppSecurityWrapperState();
}

class _AppSecurityWrapperState extends State<AppSecurityWrapper>
    with WidgetsBindingObserver {
  final ValueNotifier<bool> _blurNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _blurNotifier.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App in background – blur ON
      _blurNotifier.value = true;
    } else if (state == AppLifecycleState.resumed) {
      // App in foreground – blur OFF
      _blurNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _blurNotifier,
      builder: (context, isBlurred, child) {
        return Stack(
          children: [
            child!,
            if (isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    alignment: Alignment.center,
                    child: const Text(
                      '🔒 Secured',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
      child: widget.child,
    );
  }
}
