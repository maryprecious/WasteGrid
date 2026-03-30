import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/custom_app_button.dart';
import 'verify_email.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendResetLink() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      // TODO: Implement sending reset link logic
      print('Send reset link to: \$email');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reset link sent to \$email')),
      );
      // Navigate to VerifyEmailScreen with the entered email
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VerifyEmailScreen(email: email),
        ),
      );
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@\\s]+@[^@\\s]+\\.[^@\\s]+\$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.mainColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Forget Password',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your email address below to receive a password reset link.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: _emailValidator,
              ),
              SizedBox(height: 32),
              CustomAppButton(
                text: 'Send Reset Link',
                onPressed: _sendResetLink,
                color: AppColors.mainColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
