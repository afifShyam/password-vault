import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:provider/provider.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ValueNotifier<String> _pinNotifier = ValueNotifier<String>('');
  String? _firstEntry;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _pinNotifier.value = _controller.text;
      if (_controller.text.length == 6) {
        _focusNode.unfocus();
        _handlePinEntry(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _pinNotifier.dispose();
    super.dispose();
  }

  void _handlePinEntry(String pin) async {
    if (_firstEntry == null) {
      setState(() {
        _firstEntry = pin;
        _controller.clear();
      });
    } else {
      if (_firstEntry == pin) {
        final viewModel = Provider.of<AuthViewModel>(context, listen: false);
        await viewModel.setNewPin(pin);

        if (mounted) {
          Navigator.pop(context, true);
          _showCustomSnackBar(
            context,
            message: 'PIN set successfully!',
            icon: Icons.check_circle_outline,
            backgroundColor: Colors.green,
          );
        }
      } else {
        setState(() {
          _firstEntry = null;
          _controller.clear();
        });

        _showCustomSnackBar(
          context,
          message: 'PINs do not match. Try again.',
          icon: Icons.error_outline,
          backgroundColor: Colors.redAccent,
        );
      }
    }
  }

  Widget _buildPinBox(int index, String pin) {
    bool filled = index < pin.length;
    String displayChar = '';

    if (filled) {
      displayChar = _obscureText ? '●' : pin[index];
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
      child: Container(
        key: ValueKey(displayChar),
        width: 40,
        height: 48,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.8), width: 2)),
        ),
        child: Text(displayChar, style: const TextStyle(fontSize: 28, color: Colors.black)),
      ),
    );
  }

  void _showCustomSnackBar(
    BuildContext context, {
    required String message,
    IconData icon = Icons.error_outline,
    Color backgroundColor = Colors.redAccent,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      duration: duration,
    );

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final promptText = _firstEntry == null ? 'Set a new 6-digit PIN' : 'Confirm your PIN';

    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text('Set App PIN'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                promptText,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // PIN Input + Visuals
              GestureDetector(
                onTap: () => _focusNode.requestFocus(),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ValueListenableBuilder<String>(
                        valueListenable: _pinNotifier,
                        builder: (context, pin, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (i) => _buildPinBox(i, pin)),
                          );
                        },
                      ),
                      Opacity(
                        opacity: 0.0,
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          obscureText: _obscureText,
                          maxLength: 6,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: const InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(color: Colors.transparent),
                          cursorColor: Colors.transparent,
                          showCursor: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Show/Hide toggle
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  setState(() => _obscureText = !_obscureText);
                },
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                label: Text(_obscureText ? 'Show PIN' : 'Hide PIN'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
