import 'package:flutter/material.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortfolioTab extends StatefulWidget {
  const PortfolioTab({super.key});

  @override
  State<PortfolioTab> createState() => _PortfolioTabState();
}

class _PortfolioTabState extends State<PortfolioTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<PortfolioViewModel>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isLoading = context.select<PortfolioViewModel, bool>(
      (vm) => vm.isLoading,
    );
    final errorMessage = context.select<PortfolioViewModel, String?>(
      (vm) => vm.errorMessage,
    );
    final controller = context.select<PortfolioViewModel, WebViewController?>(
      (vm) => vm.controller,
    );
    final isInitialized = context.select<PortfolioViewModel, bool>(
      (vm) => vm.isInitialized,
    );

    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors.surfaceContainerHigh.withValues(alpha: 0.4),
                    colors.surface,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child:
                  !isInitialized || controller == null
                      ? const Center(child: CircularProgressIndicator())
                      : errorMessage != null
                      ? _buildErrorState(colors, errorMessage)
                      : ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        child: WebViewWidget(controller: controller),
                      ),
            ),
          ),
          if (isLoading && isInitialized)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                color: colors.primary,
                backgroundColor: colors.primary.withValues(alpha: 0.1),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorState(ColorScheme colors, String message) {
    final viewModel = context.read<PortfolioViewModel>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off_rounded, size: 56, color: colors.error),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: viewModel.loadPortfolio,
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
