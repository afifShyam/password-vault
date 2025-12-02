import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pass_vault/blocs/index.dart';
import 'package:pass_vault/model/index.dart';

void _showPasswordPreview(BuildContext rootContext, PasswordEntry entry) {
  bool obscure = true;
  final theme = Theme.of(rootContext);
  final colors = theme.colorScheme;
  final textTheme = theme.textTheme;

  showDialog<void>(
    context: rootContext,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.symmetric(horizontal: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colors.surface.withValues(alpha: 0.78),
                        colors.surfaceVariant.withValues(alpha: 0.86),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors.shadow.withValues(alpha: 0.45),
                        blurRadius: 26,
                        offset: const Offset(0, 18),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title row
                      Row(
                        children: [
                          Icon(Icons.visibility_rounded, color: colors.primary),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              entry.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      if (entry.email.isNotEmpty) ...[
                        Text(
                          entry.email,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],

                      Text(
                        'Password',
                        style: textTheme.labelSmall?.copyWith(
                          color: colors.onSurfaceVariant,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 6),

                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: colors.surfaceVariant.withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.18),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 12,
                          ),
                          child: SelectableText(
                            obscure
                                ? '•' * entry.password.length
                                : entry.password,
                            style: textTheme.titleMedium?.copyWith(
                              fontFamily: 'monospace',
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            icon: Icon(
                              obscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            label: Text(obscure ? 'Show' : 'Hide'),
                            onPressed: () => setState(() => obscure = !obscure),
                          ),
                          const SizedBox(width: 4),
                          TextButton.icon(
                            icon: const Icon(Icons.copy_outlined),
                            label: const Text('Copy'),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: entry.password),
                              );
                              Navigator.of(dialogContext).pop();
                              ScaffoldMessenger.of(rootContext).showSnackBar(
                                const SnackBar(
                                  content: Text('Password copied'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

class VaultEntryCard extends StatelessWidget {
  const VaultEntryCard({
    required this.entry,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  final PasswordEntry entry;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  Color _accentColor(ColorScheme colors) {
    final palette = <Color>[
      colors.primary,
      colors.secondary,
      colors.tertiary,
      colors.primaryContainer,
      colors.secondaryContainer,
    ];
    final index = (entry.id.hashCode & 0x7fffffff) % palette.length;
    return palette[index];
  }

void _copyPassword(BuildContext context) {
  Clipboard.setData(ClipboardData(text: entry.password));
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('Password copied')));
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final accent = _accentColor(colors);

    // Selective rebuild ONLY when this entry's obscure value changes
    final isObscured = context.select<VaultBloc, bool>(
      (bloc) => bloc.state.obscureMap[entry.id] ?? true,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(26),
            onTap: onEdit,
            onLongPress: onDelete,
            onDoubleTap: () => _copyPassword(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colors.surface.withValues(alpha: 0.35),
                    colors.surfaceVariant.withValues(alpha: 0.6),
                  ],
                ),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.18),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.35),
                    blurRadius: 24,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top row: title + quick eye icon
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          entry.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        tooltip: isObscured
                            ? 'Reveal password'
                            : 'Hide password',
                        iconSize: 20,
                        style: IconButton.styleFrom(
                          minimumSize: const Size.square(32),
                          padding: EdgeInsets.zero,
                          backgroundColor: colors.surface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        icon: Icon(
                          isObscured
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          context.read<VaultBloc>().add(
                            VaultEvent.toggleVisibility(entry.id),
                          );
                        },
                      ),
                    ],
                  ),

                  if (entry.email.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      entry.email,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],

                  const SizedBox(height: 14),

                  /// Password box
                  Text(
                    'Password',
                    style: textTheme.labelSmall?.copyWith(
                      color: colors.onSurfaceVariant,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: accent.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.18),
                      ),
                    ),
                    child: Text(
                      isObscured ? '●' * 12 : entry.password,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge?.copyWith(
                        fontFamily: 'monospace',
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Actions row
                  OutlinedButton.icon(
                    icon: const Icon(Icons.search_rounded, size: 18),
                    label: const Text('Preview'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.22),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: colors.surface.withValues(alpha: 0.28),
                    ),
                    onPressed: () => _showPasswordPreview(context, entry),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
