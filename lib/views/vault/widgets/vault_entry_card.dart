import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_vault/model/index.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final accentColor = _accentColor(colors);

    return Selector<VaultViewModel, bool>(
      selector: (_, vm) => vm.isObscured(entry.id),
      builder: (context, isObscured, _) {
        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onEdit,
            onLongPress: onDelete,
            onDoubleTap: () {
              Clipboard.setData(ClipboardData(text: entry.password));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password copied to clipboard')),
              );
            },
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    accentColor.withValues(alpha: 0.85),
                    colors.surface.withValues(alpha: 0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: accentColor.withValues(alpha: 0.35)),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        entry.title,
                        maxLines: 2,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (entry.email.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        entry.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.topLeft,
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
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton.outlined(
                          style: IconButton.styleFrom(
                            minimumSize: const Size.square(44),
                            padding: EdgeInsets.zero,
                          ),
                          tooltip:
                              isObscured ? 'Reveal password' : 'Hide password',
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed:
                              () => context
                                  .read<VaultViewModel>()
                                  .toggleVisibility(entry.id),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filled(
                          style: IconButton.styleFrom(
                            minimumSize: const Size.square(44),
                            padding: EdgeInsets.zero,
                          ),
                          tooltip: 'Copy password',
                          icon: const Icon(Icons.copy_outlined),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: entry.password),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Password copied')),
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
  }
}
