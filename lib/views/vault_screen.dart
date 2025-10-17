import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_vault/model/index.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:pass_vault/views/portfolio_tab.dart';
import 'package:pass_vault/views/vault/widgets/vault_empty_state.dart';
import 'package:pass_vault/views/vault/widgets/vault_entry_card.dart';
import 'package:pass_vault/views/vault/widgets/vault_search_bar.dart';
import 'package:provider/provider.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _tabController = TabController(length: 2, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<VaultViewModel>();
      viewModel.loadPasswords();

      _searchController.addListener(() {
        if (!mounted) return;
        context.read<VaultViewModel>().setSearchQuery(_searchController.text);
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    _titleController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final viewModel = context.read<VaultViewModel>();
    switch (state) {
      case AppLifecycleState.resumed:
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        if (!viewModel.isAllObscured()) {
          viewModel.hideAllPasswords();
        }
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> _showAddPasswordDialog() async {
    final viewModel = context.read<VaultViewModel>();
    final emails = viewModel.state.emails;
    String? selectedEmail = emails.isNotEmpty ? emails.first : null;
    bool isCustomEmail = emails.isEmpty;
    final TextEditingController customEmailController = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('Add a password'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        hintText: 'Eg. Email, Netflix, Bank',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter the password to store',
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child:
                          isCustomEmail
                              ? TextField(
                                key: const ValueKey('customEmail'),
                                controller: customEmailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email (optional)',
                                  hintText: 'name@example.com',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              )
                              : DropdownButtonFormField<String>(
                                key: const ValueKey('emailDropdown'),
                                initialValue: selectedEmail,
                                decoration: const InputDecoration(
                                  labelText: 'Email (optional)',
                                ),
                                items: [
                                  ...emails.map(
                                    (email) => DropdownMenuItem(
                                      value: email,
                                      child: Text(email),
                                    ),
                                  ),
                                  const DropdownMenuItem(
                                    value: 'add_new',
                                    child: Text('Add a new email'),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value == 'add_new') {
                                    setState(() => isCustomEmail = true);
                                  } else {
                                    selectedEmail = value;
                                  }
                                },
                              ),
                    ),
                  ],
                ),
              ),
              actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
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
                    final email =
                        isCustomEmail
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

                    viewModel.addPassword(title, password, email);
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
  }

  void _showEditDialog(PasswordEntry entry) {
    final viewModel = context.read<VaultViewModel>();
    final TextEditingController titleController = TextEditingController(
      text: entry.title,
    );
    final TextEditingController passwordController = TextEditingController(
      text: entry.password,
    );
    final TextEditingController emailController = TextEditingController(
      text: entry.email,
    );

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Edit entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
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

                viewModel.updatePassword(
                  oldTitle: entry.title,
                  newTitle: newTitle,
                  password: newPassword,
                  email: newEmail,
                );
                Navigator.of(context).pop();
              },
              label: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDelete(PasswordEntry entry) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Delete this password?'),
          content: Text('Delete "${entry.title}" from your vault?'),
          actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton.icon(
              icon: const Icon(Icons.delete_outline),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.redAccent.withValues(alpha: 0.2),
                foregroundColor: Colors.redAccent,
              ),
              onPressed: () {
                context.read<VaultViewModel>().deletePassword(entry.title);
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
        if (entries.isEmpty) {
          return VaultEmptyState(onAdd: _showAddPasswordDialog);
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;
            const double horizontalPadding = 48; // grid padding left + right
            const double spacing = 18;

            final int crossAxisCount = width < 340 ? 1 : 2;

            final double availableWidth =
                width - horizontalPadding - spacing * (crossAxisCount - 1);
            final double tileWidth =
                crossAxisCount == 0 ? width : availableWidth / crossAxisCount;

            final double heightFactor =
                tileWidth <= 150
                    ? 2.35
                    : tileWidth <= 190
                    ? 1.95
                    : tileWidth <= 230
                    ? 1.65
                    : 1.45;
            final double childAspectRatio = 1 / heightFactor;

            return GridView.builder(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 120),
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
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vaultViewModel = context.watch<VaultViewModel>();
    final VaultState state = vaultViewModel.state;
    final List<PasswordEntry> entries = state.filteredEntries;

    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    final int totalEntries = state.entries.length;
    final String entryLabel = totalEntries == 1 ? 'item' : 'items';

    return Scaffold(
      extendBody: true,
      backgroundColor: colors.surface,
      appBar: AppBar(
        titleSpacing: 24,
        toolbarHeight: 96,
        backgroundColor: colors.surface,
        elevation: 0,
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
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '$totalEntries $entryLabel securely stored',
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add password',
            onPressed: _showAddPasswordDialog,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(148),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: Column(
              children: [
                VaultSearchBar(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: colors.surfaceContainerHigh.withValues(alpha: 0.25),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: colors.onPrimaryContainer,
                    unselectedLabelColor: colors.onSurfaceVariant,
                    labelStyle: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: textTheme.titleMedium,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: colors.primaryContainer.withValues(alpha: 0.9),
                      boxShadow: [
                        BoxShadow(
                          color: colors.primary.withValues(alpha: 0.25),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.shield_moon_outlined),
                        text: 'Vault',
                      ),
                      Tab(
                        icon: Icon(Icons.travel_explore_outlined),
                        text: 'Portfolio',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: [_buildVaultTab(state, entries), const PortfolioTab()],
      ),
    );
  }
}
