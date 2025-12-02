import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(const PortfolioState()) {
    on<InitPortfolio>(_onInit);
    on<AttachController>(_onAttachController);
    on<LoadUrl>(_onLoadUrl);
    on<Reload>(_onReload);
    on<PageStarted>(_onPageStarted);
    on<PageFinished>(_onPageFinished);
    on<Error>(_onError);
    on<Progress>(_onProgress);
    on<UpdateNavigation>(_onUpdateNavigation);
    on<DetachController>(_onDetachController);
    on<GoBack>(_onGoBack);
    on<GoForward>(_onGoForward);
    on<GoHome>(_onGoHome);
  }

  static const String _portfolioUrl = 'https://mobile-dev-showcase-24.web.app/';
  static const String _imageOptimizeScript = r"""
    (() => {
      const imgs = Array.from(document.images || []);
      imgs.forEach((img) => {
        img.loading = img.loading || 'lazy';
        img.decoding = img.decoding || 'async';
        img.style.maxWidth = '100%';
        img.style.height = 'auto';
        const maxDeviceWidth = Math.min(window.innerWidth * window.devicePixelRatio, 1200);
        if (img.naturalWidth > maxDeviceWidth) {
          img.style.width = `${Math.round(maxDeviceWidth)}px`;
        }
      });
    })();
  """;

  Future<void> _onInit(
    InitPortfolio event,
    Emitter<PortfolioState> emit,
  ) async {
    if (state.isInitialized || state.controller != null) return;
  }

  void _onAttachController(
    AttachController event,
    Emitter<PortfolioState> emit,
  ) {
    emit(
      state.copyWith(
        controller: event.controller,
        isInitialized: true,
        status: PortfolioStatus.loading,
        errorMessage: '',
      ),
    );
  }

  Future<void> _onLoadUrl(LoadUrl event, Emitter<PortfolioState> emit) async {
    final controller = state.controller;
    if (controller == null) return;

    emit(state.copyWith(status: PortfolioStatus.loading, errorMessage: ''));
    await controller.loadRequest(Uri.parse(event.url));
    await _refreshNavigation(controller, emit);
  }

  Future<void> _onReload(Reload event, Emitter<PortfolioState> emit) async {
    final controller = state.controller;
    if (controller == null) return;

    emit(state.copyWith(status: PortfolioStatus.loading));
    await controller.reload();
    await _refreshNavigation(controller, emit);
  }

  void _onPageStarted(PageStarted event, Emitter<PortfolioState> emit) {
    emit(state.copyWith(status: PortfolioStatus.loading, errorMessage: ''));
  }

  Future<void> _onPageFinished(
    PageFinished event,
    Emitter<PortfolioState> emit,
  ) async {
    await _injectImageOptimizations();
    final controller = state.controller;
    if (controller != null) {
      await _refreshNavigation(controller, emit);
    }
    emit(state.copyWith(status: PortfolioStatus.loaded));
  }

  void _onError(Error event, Emitter<PortfolioState> emit) {
    emit(
      state.copyWith(
        status: PortfolioStatus.error,
        errorMessage: event.message,
      ),
    );
  }

  void _onProgress(Progress event, Emitter<PortfolioState> emit) {
    emit(state.copyWith(progress: event.value.clamp(0, 1)));
  }

  void _onUpdateNavigation(
    UpdateNavigation event,
    Emitter<PortfolioState> emit,
  ) {
    emit(
      state.copyWith(
        canGoBack: event.canGoBack,
        canGoForward: event.canGoForward,
      ),
    );
  }

  Future<void> _onGoBack(GoBack event, Emitter<PortfolioState> emit) async {
    final controller = state.controller;
    if (controller == null) return;
    if (await controller.canGoBack()) {
      await controller.goBack();
    }
    await _refreshNavigation(controller, emit);
  }

  Future<void> _onGoForward(
    GoForward event,
    Emitter<PortfolioState> emit,
  ) async {
    final controller = state.controller;
    if (controller == null) return;
    if (await controller.canGoForward()) {
      await controller.goForward();
    }
    await _refreshNavigation(controller, emit);
  }

  Future<void> _onGoHome(GoHome event, Emitter<PortfolioState> emit) async {
    add(const PortfolioEvent.loadUrl(_portfolioUrl));
  }

  void _onDetachController(
    DetachController event,
    Emitter<PortfolioState> emit,
  ) {
    emit(
      state.copyWith(
        controller: null,
        isInitialized: false,
        status: PortfolioStatus.initial,
        errorMessage: '',
        canGoBack: false,
        canGoForward: false,
        progress: 0,
      ),
    );
  }

  Future<void> _refreshNavigation(
    WebViewController controller,
    Emitter<PortfolioState> emit,
  ) async {
    try {
      final back = await controller.canGoBack();
      final forward = await controller.canGoForward();
      emit(state.copyWith(canGoBack: back, canGoForward: forward));
    } catch (_) {
      // ignore
    }
  }

  Future<void> _injectImageOptimizations() async {
    try {
      await state.controller?.runJavaScript(_imageOptimizeScript);
    } catch (_) {
      if (kDebugMode) {
        // ignore debug injection errors
      }
    }
  }
}
