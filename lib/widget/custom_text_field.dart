import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    if (!widget.isPassword) {
      _obscureText = false;
    }
  }

  void _toggleObscure() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.hintText == null ? widget.labelText : null,
        hintText: widget.hintText,
        labelStyle: TextStyle(color: AppColors.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor.withAlpha(15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textSecondary,
                ),
                onPressed: _toggleObscure,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      style: TextStyle(color: AppColors.textPrimary, fontSize: 16),
    );
  }
}
