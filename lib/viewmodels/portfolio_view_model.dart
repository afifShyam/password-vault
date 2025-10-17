import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortfolioViewModel extends ChangeNotifier {
  static const String _portfolioUrl = 'https://mobile-dev-showcase-24.web.app/';

  WebViewController? _controller;
  bool _isLoading = true;
  String? _errorMessage;
  bool _isInitialized = false;

  WebViewController? get controller => _controller;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isInitialized => _isInitialized;

  Future<void> init() async {
    if (_isInitialized) return;

    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (_) => _setLoading(),
              onPageFinished: (_) => _setLoaded(),
              onWebResourceError:
                  (error) => _setError('Could not load the portfolio.'),
            ),
          );

    _isInitialized = true;
    notifyListeners();
    await loadPortfolio();
  }

  Future<void> loadPortfolio() async {
    final controller = _controller;
    if (controller == null) return;

    _setLoading();
    await controller.loadRequest(Uri.parse(_portfolioUrl));
  }

  Future<void> reload() async {
    final controller = _controller;
    if (controller == null) return;

    _setLoading();
    await controller.reload();
  }

  void _setLoading() {
    if (!_isLoading || _errorMessage != null) {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
    }
  }

  void _setLoaded() {
    if (_isLoading || _errorMessage != null) {
      _isLoading = false;
      _errorMessage = null;
      notifyListeners();
    }
  }

  void _setError(String message) {
    _isLoading = false;
    _errorMessage = message;
    notifyListeners();
  }
}
