import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../widget/custom_app_button.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberPassword = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform login logic here
      Get.snackbar('Login', 'Login successful',
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
          );
          // Navigate to home screen after successful login
         Get.offAllNamed('/home');
    }
  }

  void _onGoogleLogin() {
    // Implement Google login logic
    Get.snackbar('Google Login', 'Google login pressed',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _onFacebookLogin() {
    // Implement Facebook login logic
    Get.snackbar('Facebook Login', 'Facebook login pressed',
        snackPosition: SnackPosition.BOTTOM);
  }

  void _onAppleLogin() {
    // Implement Apple login logic
    Get.snackbar('Apple Login', 'Apple login pressed',
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
          )
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
                        'Login',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          // color: lightColorScheme.primary,
                        ),
                      ),

                      SizedBox(height: 5),
                      
                        // padding: const EdgeInsets.symmetric(horizontal: 48),
                         Text('Enter your login details, and start making environmental impact',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left),
                      
                const SizedBox(height: 35),
                CustomTextField(
                  labelText: 'Email',
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
                const SizedBox(height: 16),
                CustomTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Row(
                      children: [
                        Checkbox(
                          value: rememberPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberPassword = value!;
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
                    TextButton(
                      onPressed: () {
                        // Navigate to forget password screen
                        Get.toNamed('/forget_password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ), 
                  ],
                ),
                const SizedBox(height: 35),
                CustomAppButton(
                  text: 'Login',
                  onPressed: _onLoginPressed,
                  color: AppColors.mainColor,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 35),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'or',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      
               
                SocialLoginButton(
                  assetName: 'assets/svgs/google.svg',
                  text: 'Continue with Google',
                  onPressed: _onGoogleLogin,
                  backgroundColor: Colors.white,
                  textColor: AppColors.mainColor,
                  iconSize: 28.0,
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SocialLoginButton(
                        assetName: 'assets/svgs/facebook.svg',
                        text: 'Facebook',
                        onPressed: _onFacebookLogin,
                        backgroundColor: Colors.white,
                        textColor: AppColors.mainColor,
                        iconSize: 28.0,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SocialLoginButton(
                        assetName: 'assets/svgs/apple.svg',
                        text: 'Apple',
                        onPressed: _onAppleLogin,
                        backgroundColor: Colors.white,
                        textColor: AppColors.mainColor,
                        iconSize: 28.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign up screen
                        Get.toNamed('/sign_up');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
    }
  }

