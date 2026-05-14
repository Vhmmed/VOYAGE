import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final VoidCallback? onSubmitted;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppTheme.greyText,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 8),

        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,

          onFieldSubmitted: (_) {
            if (widget.onSubmitted != null) {
              widget.onSubmitted!();
            } else {
              FocusScope.of(context).nextFocus();
            }
          },

          obscureText: widget.isPassword ? _obscure : false,

          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppTheme.greyText.withOpacity(0.7),
            ),

            prefixIcon: Icon(
              widget.icon,
              color: AppTheme.lightBlue,
              size: 22,
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscure
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppTheme.primaryBlue,
              ),
              onPressed: () {
                setState(() {
                  _obscure = !_obscure;
                });
              },
            )
                : null,

            filled: true,
            fillColor: AppTheme.greyBg,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none,
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}