import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/themes/app_color.dart';
import 'package:e_commerce/core/widgets/orange_button_widget.dart';
import 'package:e_commerce/features/auth/data/repo/data_source/auth_data_source_imp.dart';
import 'package:e_commerce/features/auth/data/repo/repo/auth_repo_imp.dart';

import 'package:e_commerce/features/auth/presentation/view/widgets/form_field_widget.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/password_form_field_widget.dart';
import 'package:e_commerce/features/auth/presentation/view_model/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late LoginCubit loginCubit;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginCubit = LoginCubit( repo: AuthRepoImp(authDataSource: AuthDataSourceImp()));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.charcoal),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Log in',
          style: TextStyle(
            color: AppColors.charcoal,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<LoginCubit, LoginState>(
        bloc: loginCubit,
        listener: (context, state) {
          if (state is LoginLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Text('Loading...'),
              ),
            );
          } else if (state is LoginSuccess) {
            

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Text('Login success'),

              ),
            );
            Navigator.of(context).pushReplacementNamed(AppRoutes.appSection);
          } else if (state is LoginError) {
            
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Text('Login error'),
              ),
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  FormFieldWidget(
                    controller: emailController,
                    labelText: 'Email',
                    HintText: 'Enter your email ',
                  ),
                  const SizedBox(height: 20),
                  PasswordFormFieldWidget(
                    controller: passwordController,
                    labelText: 'Password',
                    HintText: 'Enter your password ',
                  ),
                  const SizedBox(height: 30),
                  OrangeButtonWidget(
                    text: 'Log in',
                    onPressed: () async {
                      await loginCubit.login(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('signup');
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
