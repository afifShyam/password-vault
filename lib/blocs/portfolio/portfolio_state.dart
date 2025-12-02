import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'portfolio_state.freezed.dart';

enum PortfolioStatus { initial, loading, loaded, error }

@freezed
abstract class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    @Default(PortfolioStatus.initial) PortfolioStatus status,
    WebViewController? controller,
    @Default(false) bool isInitialized,
    @Default(false) bool canGoBack,
    @Default(false) bool canGoForward,
    @Default(0.0) double progress,
    @Default('') String errorMessage,
  }) = _PortfolioState;
  const PortfolioState._();

  bool get isLoading => status == PortfolioStatus.loading;
}
