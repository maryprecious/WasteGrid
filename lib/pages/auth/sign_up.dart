import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../widget/custom_app_button.dart';
import '../../widget/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;
  bool iagreewithwastegridtermsandpolicy = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _onSignUpPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform sign up logic here
      Get.snackbar('Sign Up', 'Sign up successful',
          snackPosition: SnackPosition.BOTTOM);
         // Navigate to home screen after successful login
          Get.offAllNamed('/home');
    }
  }

  void _onGoogleSignUp() {
    // Implement Google sign up logic
    Get.snackbar('Google Sign Up', 'Google sign up pressed',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _onFacebookSignUp() {
    // Implement Facebook sign up logic
    Get.snackbar('Facebook Sign Up', 'Facebook sign up pressed',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _onAppleSignUp() {
    // Implement Apple sign up logic
    Get.snackbar('Apple Sign Up', 'Apple sign up pressed',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.mainColor,
        ),
        ),
        // backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    // color: lightColorScheme.primary,
                  ),
                ),
                SizedBox(height: 5),
                // padding: const EdgeInsets.symmetric(horizontal: 48),
                Text('Enter your details to get started',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left),
                const SizedBox(height: 35),
                Text('Fullname'),
                CustomTextField(
                  hintText: 'Fullname',
                  controller: _fullnameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your fullname';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                Text('Nationality'),
                CustomTextField(
                  hintText: 'Nationality',
                  controller: _nationalityController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your nationality';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                Text('Email'),
                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
                Text('Phone No.'),
                CustomTextField(
                  hintText: '+234| 08078***39',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!GetUtils.isPhoneNumber(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Text('Password'),
                CustomTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must contain 8 or more characters';
                    }
                    return null;
                  },
                ),
                Text(
                  'Must contain 8 or more characters',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    height: 22 / 12,
                    letterSpacing: 0.67 * 4.79 / 3.05,
                  ),
                ),
                const SizedBox(height: 35),
                Text('Confirm Password'),
                CustomTextField(
                  hintText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],

                    
                    ),
                    Row(
                      children: [
                        Checkbox(
                          
                          value: iagreewithwastegridtermsandpolicy,
                          onChanged: (bool? value) {
                            setState(() {
                              iagreewithwastegridtermsandpolicy = value!;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        const Text(
                          'I agree With WasteGridterms and Policy...',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),

                      ],

                    
                    ),
                        
                    
                    
                  ],
                ),
                const SizedBox(height: 35),
               
                
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        // Navigate to login screen
                        Get.toNamed('/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 35),
                CustomAppButton(
                  text: 'Create account',
                  onPressed: _onSignUpPressed,
                  color: AppColors.mainColor,
                  textColor: Colors.white,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}