import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class IdleWatcher extends StatefulWidget {
  final Widget child;
  final VoidCallback onTimeout;

  const IdleWatcher({required this.child, required this.onTimeout, super.key});

  @override
  State<IdleWatcher> createState() => _IdleWatcherState();
}

class _IdleWatcherState extends State<IdleWatcher> with WidgetsBindingObserver {
  Timer? _inactivityTimer;
  final Duration _timeoutDuration = const Duration(minutes: 1);

  void _resetTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(_timeoutDuration, _handleTimeout);
  }

  void _handleUserInteraction([_]) => _resetTimer();

  void _handleTimeout() {
    widget.onTimeout();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _resetTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handleUserInteraction,
      onPointerMove: _handleUserInteraction,
      onPointerHover: _handleUserInteraction,
      child: widget.child,
    );
  }
}
