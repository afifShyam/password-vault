import 'package:flutter/material.dart';

class VaultSearchBar extends StatelessWidget {
  const VaultSearchBar({
    required this.controller,
    required this.focusNode,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.surfaceContainerHighest.withValues(alpha: 0.5),
            colors.surface.withValues(alpha: 0.4),
          ],
        ),
      ),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            onTapOutside: (_) => focusNode.unfocus(),
            decoration: InputDecoration(
              hintText: 'Search your vault…',
              hintStyle: textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: colors.primary),
              suffixIcon:
                  value.text.isNotEmpty
                      ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          controller.clear();
                          focusNode.unfocus();
                        },
                        tooltip: 'Clear search',
                      )
                      : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
