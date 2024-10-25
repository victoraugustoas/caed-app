import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String label;
  final void Function(String) onChanged;
  final bool isPassword;
  final String? Function(String?)? validator;

  const Input({
    super.key,
    required this.label,
    required this.onChanged,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _hidePassword = true;

  bool get hidePassword => _hidePassword;
  set hidePassword(bool value) => setState(() => _hidePassword = value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Color(0xFF757575),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          decoration: InputDecoration(
            fillColor: const Color(0xFFF0F0F0),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: widget.isPassword ? _buildPasswordIcon() : null,
          ),
          onChanged: widget.onChanged,
          obscureText: widget.isPassword ? hidePassword : false,
          validator: widget.validator,
        )
      ],
    );
  }

  Widget _buildPasswordIcon() {
    return InkWell(
      onTap: () => hidePassword = !hidePassword,
      child: hidePassword
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
    );
  }
}
