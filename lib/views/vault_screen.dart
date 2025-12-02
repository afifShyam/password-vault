import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';

import 'package:pass_vault/blocs/index.dart';
import 'package:pass_vault/blocs/navbar/nav_state.dart';
import 'package:pass_vault/model/index.dart';
import 'package:pass_vault/views/portfolio_screen.dart';
import 'package:pass_vault/views/vault/widgets/vault_empty_state.dart';
import 'package:pass_vault/views/vault/widgets/vault_entry_card.dart';
import 'package:pass_vault/views/vault/widgets/vault_search_bar.dart';
import 'package:pass_vault/views/widgets/floating_nav_bar.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> with WidgetsBindingObserver {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VaultBloc>().add(const VaultEvent.load());

      _searchController.addListener(() {
        if (!mounted) return;
        context.read<VaultBloc>().add(
          VaultEvent.setSearchQuery(_searchController.text),
        );
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _titleController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final vaultBloc = context.read<VaultBloc>();
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        if (!vaultBloc.state.obscureMap.values.every((e) => e)) {
          vaultBloc.add(const VaultEvent.hideAll());
        }
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> _showAddPasswordDialog() async {
    final vaultState = context.read<VaultBloc>().state;
    final emails = vaultState.emails;
    String? selectedEmail = emails.isNotEmpty ? emails.first : null;
    final isCustomEmailNotifier = ValueNotifier<bool>(emails.isEmpty);
    final TextEditingController customEmailController = TextEditingController();
    bool obscurePassword = true;

    await showDialog<void>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final colors = theme.colorScheme;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colors.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      color: colors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add a password',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Securely store your new login.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Eg. Email, Netflix, Bank',
                        prefixIcon: Icon(Icons.title_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passwordController,
                      obscureText: obscurePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter the password to store',
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                          onPressed: () => setState(
                            () => obscurePassword = !obscurePassword,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ValueListenableBuilder<bool>(
                      valueListenable: isCustomEmailNotifier,
                      builder: (context, isCustomEmail, _) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          switchInCurve: Curves.easeOut,
                          switchOutCurve: Curves.easeIn,
                          child: isCustomEmail
                              ? TextField(
                                  key: const ValueKey('customEmail'),
                                  controller: customEmailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    labelText: 'Email (optional)',
                                    hintText: 'name@example.com',
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                )
                              : DropdownButtonFormField<String>(
                                  key: const ValueKey('emailDropdown'),
                                  value: selectedEmail,
                                  isExpanded: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Email (optional)',
                                    prefixIcon: Icon(Icons.email_outlined),
                                  ),
                                  items: [
                                    ...emails.map(
                                      (email) => DropdownMenuItem(
                                        value: email,
                                        child: Text(
                                          email,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const DropdownMenuItem(
                                      value: 'add_new',
                                      child: Text('Add a new email'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value == 'add_new') {
                                      isCustomEmailNotifier.value = true;
                                    } else {
                                      selectedEmail = value;
                                    }
                                  },
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _titleController.clear();
                    _passwordController.clear();
                    customEmailController.clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                FilledButton.icon(
                  icon: const Icon(Icons.save_outlined),
                  onPressed: () {
                    final title = _titleController.text.trim();
                    final password = _passwordController.text.trim();
                    final email = isCustomEmailNotifier.value
                        ? customEmailController.text.trim()
                        : selectedEmail?.trim();

                    if (title.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Title and password are both required'),
                        ),
                      );
                      return;
                    }

                    context.read<VaultBloc>().add(
                      VaultEvent.addEntry(
                        title: title,
                        password: password,
                        email: email,
                      ),
                    );
                    _titleController.clear();
                    _passwordController.clear();
                    customEmailController.clear();
                    Navigator.of(context).pop();
                  },
                  label: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );

    isCustomEmailNotifier.dispose();
  }

  void _showEditDialog(PasswordEntry entry) {
    final TextEditingController titleController = TextEditingController(
      text: entry.title,
    );
    final TextEditingController passwordController = TextEditingController(
      text: entry.password,
    );
    final TextEditingController emailController = TextEditingController(
      text: entry.email,
    );
    bool obscurePassword = true;

    showDialog<void>(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        final colors = theme.colorScheme;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colors.secondary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.edit_outlined, color: colors.secondary),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Edit entry',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        prefixIcon: Icon(Icons.title_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                          onPressed: () => setState(
                            () => obscurePassword = !obscurePassword,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email (optional)',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                FilledButton.icon(
                  icon: const Icon(Icons.save_outlined),
                  onPressed: () {
                    final String newTitle = titleController.text.trim();
                    final String newPassword = passwordController.text.trim();
                    final String newEmail = emailController.text.trim();

                    if (newTitle.isEmpty || newPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Title and password are both required'),
                        ),
                      );
                      return;
                    }

                    context.read<VaultBloc>().add(
                      VaultEvent.updateEntry(
                        oldTitle: entry.title,
                        newTitle: newTitle,
                        password: newPassword,
                        email: newEmail,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  label: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmDelete(PasswordEntry entry) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final colors = theme.colorScheme;

        return AlertDialog(
          backgroundColor: colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors.error.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.warning_amber_outlined, color: colors.error),
              ),
              const SizedBox(width: 12),
              Text(
                'Delete this password?',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          content: Text(
            'Delete "${entry.title}" from your vault?',
            style: theme.textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton.icon(
              icon: const Icon(Icons.delete_outline),
              style: FilledButton.styleFrom(
                backgroundColor: colors.error.withOpacity(0.08),
                foregroundColor: colors.error,
              ),
              onPressed: () {
                context.read<VaultBloc>().add(
                  VaultEvent.deleteEntry(entry.title),
                );
                Navigator.of(ctx).pop();
              },
              label: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVaultTab(VaultState state, List<PasswordEntry> entries) {
    switch (state.status) {
      case VaultStatus.initial:
      case VaultStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case VaultStatus.error:
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'We ran into an issue loading your vault.\n${state.error}',
              textAlign: TextAlign.center,
            ),
          ),
        );
      case VaultStatus.loaded:
        // Smooth transition between empty + list states
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeOutQuad,
          switchOutCurve: Curves.easeInQuad,
          child: entries.isEmpty
              ? VaultEmptyState(
                  key: const ValueKey('empty-state'),
                  onAdd: _showAddPasswordDialog,
                )
              : LayoutBuilder(
                  key: const ValueKey('grid-state'),
                  builder: (context, constraints) {
                    final double width = constraints.maxWidth;
                    const double horizontalPadding = 32;
                    const double spacing = 14;

                    final int crossAxisCount = width < 360
                        ? 1
                        : width < 640
                        ? 2
                        : width < 900
                        ? 3
                        : 4;

                    final double availableWidth =
                        width -
                        horizontalPadding -
                        spacing * (crossAxisCount - 1);
                    final double tileWidth = crossAxisCount == 0
                        ? width
                        : availableWidth / crossAxisCount;

                    final double heightFactor = tileWidth <= 150
                        ? 2.45
                        : tileWidth <= 190
                        ? 2.05
                        : tileWidth <= 230
                        ? 1.75
                        : 1.55;
                    final double childAspectRatio = 1 / heightFactor;

                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
                      physics: const BouncingScrollPhysics(),
                      itemCount: entries.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: spacing,
                        mainAxisSpacing: spacing,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        return VaultEntryCard(
                          entry: entry,
                          onEdit: () => _showEditDialog(entry),
                          onDelete: () => _confirmDelete(entry),
                        );
                      },
                    );
                  },
                ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vaultState = context.watch<VaultBloc>().state;
    final List<PasswordEntry> entries = vaultState.filteredEntries;

    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final int totalEntries = vaultState.entries.length;
    final String entryLabel = totalEntries == 1 ? 'item' : 'items';

    return BlocBuilder<NavCubit, NavState>(
      builder: (context, navState) {
        final currentIndex = navState.index;
        final showNavBar = navState.showNavBar;

        return Scaffold(
          extendBody: true,
          backgroundColor: colors.surface,
          appBar: currentIndex == 0
              ? AppBar(
                  titleSpacing: 24,
                  toolbarHeight: 72,
                  elevation: 0,
                  backgroundColor: colors.surface,
                  scrolledUnderElevation: 0,
                  surfaceTintColor: Colors.transparent,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Colors.transparent,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PassVault',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$totalEntries $entryLabel securely stored',
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.add_rounded),
                      tooltip: 'Add password',
                      onPressed: _showAddPasswordDialog,
                    ),
                  ],
                )
              : null,
          body: LazyIndexedStack(
            index: currentIndex,
            children: [
              // VAULT TAB – Pinterest-like layout
              Stack(
                children: [
                  // Scrollable content, offset below the floating search bar
                  Positioned.fill(
                    top: 72, // height for search bar + padding
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        if (notification.direction == ScrollDirection.reverse &&
                            showNavBar) {
                          context.read<NavCubit>().setShowNavBar(false);
                        } else if (notification.direction ==
                                ScrollDirection.forward &&
                            !showNavBar) {
                          context.read<NavCubit>().setShowNavBar(true);
                        }
                        return false;
                      },
                      child: Padding(
                        // extra padding at top so content doesn't hide under the bar
                        padding: const EdgeInsets.only(top: 8),
                        child: _buildVaultTab(vaultState, entries),
                      ),
                    ),
                  ),

                  // Floating Pinterest-style search bar
                  Positioned(
                    left: 16,
                    right: 16,
                    top: 8,
                    child: Material(
                      elevation: 4,
                      shadowColor: colors.shadow.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(24),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: VaultSearchBar(
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // PORTFOLIO TAB
              currentIndex == 1
                  ? const PortfolioScreen(key: ValueKey('portfolioActive'))
                  : const SizedBox(key: ValueKey('portfolioPlaceholder')),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: showNavBar
                  ? FloatingNavBar(
                      currentIndex: currentIndex,
                      showNavBar: showNavBar,
                      onTap: (index) {
                        context.read<NavCubit>().setIndex(index);
                        context.read<NavCubit>().setShowNavBar(true);
                      },
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
