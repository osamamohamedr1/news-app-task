import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_task/core/routing/routes.dart';
import 'package:news_app_task/core/utils/extensions.dart';
import 'package:news_app_task/core/utils/help_fun.dart';
import 'package:news_app_task/core/utils/text_styles.dart';
import 'package:news_app_task/features/login/presentation/views/widgets/custom_text_field.dart';
import 'package:news_app_task/features/login/presentation/views/widgets/login_button.dart';
import 'package:news_app_task/features/login/presentation/views/widgets/login_footer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(milliseconds: 500));

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        context.pushNamedAndRemoveUntil(
          Routes.home,
          predicate: (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 75.h),
                    _buildHeader(),
                    SizedBox(height: 60.h),
                    _buildLoginForm(),
                    SizedBox(height: 32.h),
                    LoginButton(isLoading: _isLoading, onPressed: _handleLogin),
                    SizedBox(height: 24.h),
                    const LoginFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset('assets/images/login_icon.png'),
        Text(
          'Welcome back! Please sign in to continue',
          style: TextStyles.font14GreyNormal,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      spacing: 25,
      children: [
        CustomTextFormField(
          hintText: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
        ),

        CustomTextFormField(
          hintText: 'Password',
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          validator: validatePassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
