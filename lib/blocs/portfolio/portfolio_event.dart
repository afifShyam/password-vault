import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'portfolio_event.freezed.dart';

@freezed
class PortfolioEvent with _$PortfolioEvent {
  const factory PortfolioEvent.init() = InitPortfolio;
  const factory PortfolioEvent.attachController(WebViewController controller) =
      AttachController;
  const factory PortfolioEvent.loadUrl(String url) = LoadUrl;
  const factory PortfolioEvent.reload() = Reload;
  const factory PortfolioEvent.pageStarted() = PageStarted;
  const factory PortfolioEvent.pageFinished() = PageFinished;
  const factory PortfolioEvent.error(String message) = Error;
  const factory PortfolioEvent.progress(double value) = Progress;
  const factory PortfolioEvent.updateNavigation({
    required bool canGoBack,
    required bool canGoForward,
  }) = UpdateNavigation;
  const factory PortfolioEvent.detachController() = DetachController;
  const factory PortfolioEvent.goBack() = GoBack;
  const factory PortfolioEvent.goForward() = GoForward;
  const factory PortfolioEvent.goHome() = GoHome;
}
