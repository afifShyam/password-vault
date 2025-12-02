import 'dart:ui';
import 'package:flutter/material.dart';

class FloatingNavBar extends StatelessWidget {
  const FloatingNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.showNavBar,
    this.maxWidth = 520,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool showNavBar;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AnimatedSlide(
      offset: showNavBar ? Offset.zero : const Offset(0, 1.1),
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: showNavBar ? 1 : 0,
        duration: const Duration(milliseconds: 180),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth, minHeight: 64),
              child: SizedBox(
                height: 64,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerHigh.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: colors.outlineVariant.withValues(alpha: 0.32),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: Row(
                        children: [
                          _NavItem(
                            label: 'Vault',
                            icon: Icons.shield_moon_outlined,
                            selectedIcon: Icons.shield,
                            index: 0,
                            isSelected: currentIndex == 0,
                            onTap: () => onTap(0),
                          ),
                          _NavItem(
                            label: 'Portfolio',
                            icon: Icons.public_outlined,
                            selectedIcon: Icons.public,
                            index: 1,
                            isSelected: currentIndex == 1,
                            onTap: () => onTap(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? colors.primary.withValues(alpha: 0.14)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                child: Icon(
                  isSelected ? selectedIcon : icon,
                  key: ValueKey<bool>(isSelected),
                  size: 24,
                  color: isSelected
                      ? colors.primary
                      : colors.onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
              // const SizedBox(height: 6),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 160),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? colors.primary
                      : colors.onSurfaceVariant.withValues(alpha: 0.8),
                ),
                child: Text(label),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
