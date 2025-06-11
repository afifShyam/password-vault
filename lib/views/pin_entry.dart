import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pass_vault/viewmodels/index.dart';
import 'package:pass_vault/views/index.dart';
import 'package:provider/provider.dart';

class CustomPinEntryScreen extends StatefulWidget {
  const CustomPinEntryScreen({super.key});

  @override
  State<CustomPinEntryScreen> createState() => _CustomPinEntryScreenState();
}

class _CustomPinEntryScreenState extends State<CustomPinEntryScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<String> _pinNotifier = ValueNotifier<String>('');
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    _controller.addListener(() async {
      _pinNotifier.value = _controller.text;

      // Clear error when user starts typing
      if (_errorNotifier.value != null) {
        _errorNotifier.value = null;
      }

      if (_pinNotifier.value.length == 6) {
        _focusNode.unfocus();
        final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
        final success = await authViewModel.authenticateWithPin(_pinNotifier.value);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (success && context.mounted) {
            Navigator.pop(context, true);
          } else {
            if (context.mounted) {
              _errorNotifier.value = 'Incorrect PIN. Please try again.';
              _controller.clear();
            }
          }
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration.zero, () => _focusNode.requestFocus());
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _pinNotifier.dispose();
    _errorNotifier.dispose();
    super.dispose();
  }

  Widget _buildPinBox(int index, String pin) {
    final bool filled = index < pin.length;
    final bool isNext = index == pin.length;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 48,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isNext ? Colors.white : Colors.white.withValues(alpha: 0.5),
          width: isNext ? 2.5 : 1.5,
        ),
        color: filled ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Please enter your 6 digit PIN.', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 40),

          // PIN display container with hidden TextField inside
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
                        children: List.generate(6, (i) => Flexible(child: _buildPinBox(i, pin))),
                      );
                    },
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      maxLength: 6,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(counterText: '', border: InputBorder.none),
                      style: const TextStyle(color: Colors.transparent),
                      cursorColor: Colors.transparent,
                      showCursor: false,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Show error message below the circles
          ValueListenableBuilder<String?>(
            valueListenable: _errorNotifier,
            builder: (context, error, _) {
              if (error == null) return const SizedBox(height: 24);
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),

          const SizedBox(height: 24),

          TextButton(
            onPressed: () async {
              final viewModel = Provider.of<AuthViewModel>(context, listen: false);
              final success = await viewModel.resetPinViaBiometric();

              if (success && context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const PinSetupScreen()),
                );
              } else {
                if (context.mounted) {
                  showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: const Text('Unable to Reset PIN'),
                          content: const Text(
                            'Biometrics or device passcode must be enabled in your system settings to reset your PIN.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                  );
                }
              }
            },
            child: const Text('FORGOT YOUR PIN?', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
