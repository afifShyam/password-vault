import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:provider/provider.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  final _titleController = TextEditingController();
  final _passwordController = TextEditingController();
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<VaultViewModel>();
      // load emails and passwords
      viewModel.loadPasswords();

      _searchController.addListener(() {
        final viewModel = context.read<VaultViewModel>();
        viewModel.setSearchQuery(_searchController.text);
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _showAddPasswordDialog() {
    final viewModel = context.read<VaultViewModel>();
    final emails = viewModel.state.emails;
    String? selectedEmail = emails.isNotEmpty ? emails.first : null;
    bool isCustomEmail = false;
    final customEmailController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: const Text('Add Password'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    const SizedBox(height: 10),
                    if (!isCustomEmail)
                      DropdownButtonFormField<String>(
                        value: selectedEmail,
                        decoration: const InputDecoration(labelText: 'Email'),
                        items: [
                          ...emails.map(
                            (email) => DropdownMenuItem(value: email, child: Text(email)),
                          ),
                          const DropdownMenuItem(value: 'add_new', child: Text('Add new email')),
                        ],
                        onChanged: (value) {
                          if (value == 'add_new') {
                            setState(() => isCustomEmail = true);
                          } else {
                            selectedEmail = value;
                          }
                        },
                      )
                    else
                      TextField(
                        controller: customEmailController,
                        decoration: const InputDecoration(labelText: 'New Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      _titleController.clear();
                      _passwordController.clear();
                      customEmailController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final title = _titleController.text.trim();
                      final password = _passwordController.text.trim();
                      final email =
                          isCustomEmail ? customEmailController.text.trim() : selectedEmail?.trim();

                      if (title.isNotEmpty && password.isNotEmpty) {
                        viewModel.addPassword(title, password, email);
                        _titleController.clear();
                        _passwordController.clear();
                        customEmailController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          ),
    );
  }

  void _showEditDialog(dynamic entry) {
    final viewModel = context.read<VaultViewModel>();
    final titleController = TextEditingController(text: entry.title);
    final passwordController = TextEditingController(text: entry.password);
    final emailController = TextEditingController(text: entry.email);

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Edit Entry'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              ElevatedButton(
                onPressed: () {
                  final newTitle = titleController.text.trim();
                  final newPassword = passwordController.text.trim();
                  final newEmail = emailController.text.trim();

                  if (newTitle.isNotEmpty && newPassword.isNotEmpty) {
                    viewModel.updatePassword(
                      oldTitle: entry.title,
                      newTitle: newTitle,
                      password: newPassword,
                      email: newEmail,
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  void _confirmDelete(dynamic entry) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Delete This Password'),
            content: Text('Delete "${entry.title}"?'),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  context.read<VaultViewModel>().deletePassword(entry.title);
                  Navigator.of(ctx).pop();
                },
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }

  Widget _buildEntryCard(dynamic entry) {
    return Consumer<VaultViewModel>(
      builder: (context, viewModel, _) {
        final isObscured = viewModel.isObscured(entry.id);

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title & Actions Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(entry.title, style: Theme.of(context).textTheme.titleMedium),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isObscured ? Icons.visibility : Icons.visibility_off,
                            size: 20,
                          ),
                          onPressed: () => viewModel.toggleVisibility(entry.id),
                          tooltip: 'Show/Hide password',
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy, size: 20),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: entry.password));
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(const SnackBar(content: Text('Password copied')));
                          },
                          tooltip: 'Copy password',
                        ),
                        PopupMenuButton<String>(
                          tooltip: 'More',
                          icon: const Icon(Icons.more_vert, size: 20),
                          onSelected: (value) {
                            if (value == 'edit') {
                              _showEditDialog(entry);
                            } else if (value == 'delete') {
                              _confirmDelete(entry);
                            }
                          },
                          itemBuilder:
                              (context) => [
                                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                                const PopupMenuItem(value: 'delete', child: Text('Delete')),
                              ],
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  isObscured ? '••••••••' : entry.password,
                  style: const TextStyle(letterSpacing: 1.5, fontSize: 14),
                ),
                if (entry.email.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      entry.email,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select<VaultViewModel, VaultState>((vm) => vm.state);
    final entries = context.select<VaultViewModel, List>((vm) => vm.state.filteredEntries);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PassVault'),
        actions: [IconButton(icon: const Icon(Icons.add), onPressed: _showAddPasswordDialog)],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              onTapOutside: (_) => _focusNode.unfocus(),
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: switch (state.status) {
        VaultStatus.initial => const Center(child: Text('Initializing...')),
        VaultStatus.loading => const Center(child: CircularProgressIndicator()),
        VaultStatus.loaded =>
          entries.isEmpty
              ? const Center(child: Text('No matching passwords found.'))
              : ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  return _buildEntryCard(entries[index]);
                },
              ),
        VaultStatus.error => Center(
          child: Text('Error: ${state.error}', style: const TextStyle(color: Colors.red)),
        ),
      },
    );
  }
}
