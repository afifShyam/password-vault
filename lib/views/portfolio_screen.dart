import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_vault/blocs/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    final bloc = context.read<PortfolioBloc>();
    _controller = _createController(bloc);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc
        ..add(PortfolioEvent.attachController(_controller))
        ..add(const PortfolioEvent.goHome());
    });
  }

  @override
  void dispose() {
    context.read<PortfolioBloc>().add(const PortfolioEvent.detachController());
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      extendBody: true,
      backgroundColor: colors.surface,
      bottomNavigationBar: const SizedBox.shrink(),
      body: SafeArea(
        child: BlocListener<PortfolioBloc, PortfolioState>(
          listenWhen: (p, c) =>
              p.errorMessage != c.errorMessage && c.errorMessage.isNotEmpty,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage)));
          },
          child: BlocBuilder<PortfolioBloc, PortfolioState>(
            builder: (context, state) {
              final isLoading = state.isLoading;
              final errorMessage = state.errorMessage.isEmpty
                  ? null
                  : state.errorMessage;
              final isInitialized = state.isInitialized;
              final bloc = context.read<PortfolioBloc>();

              Widget content;
              if (!isInitialized) {
                content = _buildLoadingState(
                  colors: colors,
                  textTheme: textTheme,
                );
              } else if (errorMessage != null) {
                content = _buildErrorState(
                  colors: colors,
                  message: errorMessage,
                );
              } else {
                content = WebViewWidget(
                  key: const ValueKey('portfolioWebView'),
                  controller: _controller,
                );
              }

              return Column(
                children: [
                  _buildHeader(
                    colors: colors,
                    textTheme: textTheme,
                    isLoading: isLoading,
                    hasError: errorMessage != null,
                    onHome: isLoading
                        ? null
                        : () => bloc.add(const PortfolioEvent.goHome()),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  MediaQuery.viewPaddingOf(context).bottom + 96,
                            ),
                            child: content,
                          ),
                        ),
                        if (isLoading && isInitialized)
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: LinearProgressIndicator(
                              color: colors.primary,
                              backgroundColor: colors.primary.withValues(
                                alpha: 0.12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({
    required ColorScheme colors,
    required TextTheme textTheme,
    required bool isLoading,
    required bool hasError,
    required VoidCallback? onHome,
  }) {
    final accent = hasError ? colors.error : colors.primary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.language_rounded, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Portfolio',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hasError
                      ? 'We could not reach the page. Try reloading.'
                      : 'Live, full-bleed preview of your public portfolio.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          FilledButton.tonalIcon(
            onPressed: onHome,
            icon: const Icon(Icons.home_rounded),
            label: const Text('Home'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState({
    required ColorScheme colors,
    required TextTheme textTheme,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest.withValues(alpha: 0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: colors.shadow.withValues(alpha: 0.14),
                  blurRadius: 16,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SizedBox(
              width: 42,
              height: 42,
              child: CircularProgressIndicator(
                color: colors.primary,
                strokeWidth: 3,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Preparing your portfolio',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'We are setting up a clean, full-page preview.',
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState({
    required ColorScheme colors,
    required String message,
  }) {
    final bloc = context.read<PortfolioBloc>();
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.errorContainer.withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                size: 52,
                color: colors.onErrorContainer,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Connection issue',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: () => bloc.add(const PortfolioEvent.reload()),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }

  WebViewController _createController(PortfolioBloc bloc) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF111318))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => bloc.add(const PortfolioEvent.pageStarted()),
          onPageFinished: (_) => bloc.add(const PortfolioEvent.pageFinished()),
          onWebResourceError: (_) => bloc.add(
            const PortfolioEvent.error('Could not load the portfolio.'),
          ),
          onProgress: (value) => bloc.add(PortfolioEvent.progress(value / 100)),
        ),
      );

    return controller;
  }
}
