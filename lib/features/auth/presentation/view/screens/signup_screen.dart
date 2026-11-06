import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/core/themes/app_color.dart';
import 'package:e_commerce/core/widgets/orange_button_widget.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/form_field_widget.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/password_form_field_widget.dart';
import 'package:e_commerce/features/auth/presentation/view_model/register/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late SignUpCubit signUpCubit;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    signUpCubit = SignUpCubit();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

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
          'Sign up',
          style: TextStyle(
            color: AppColors.charcoal,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<SignUpCubit, SignUpState>(
        bloc: signUpCubit,
        listener: (context, state) {
          if (state is SignUpLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,

                behavior: SnackBarBehavior.floating,
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                content: Text('Loading...'),
              ),
            );
          } else if (state is SignUpSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                content: Text('Success'),
              ),
            );
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.loginScreen);
          } else if (state is SignUpError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
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
                    labelText: 'name',
                    controller: nameController,
                    HintText: 'Enter your name',
                  ),
                  const SizedBox(height: 20),
                  FormFieldWidget(
                    labelText: 'phone',
                    controller: phoneController,
                    HintText: 'Enter your Phone',
                  ),

                  const SizedBox(height: 20),

                  FormFieldWidget(
                    labelText: 'Email',
                    controller: emailController,
                    HintText: 'Enter your email',
                  ),

                  const SizedBox(height: 20),

                  PasswordFormFieldWidget(
                    labelText: 'Password',
                    controller: passwordController,
                    HintText: '••••••••',
                  ),
                  const SizedBox(height: 20),

                  PasswordFormFieldWidget(
                    labelText: 'Confirm password',
                    controller: confirmPasswordController,
                    HintText: '••••••••',
                  ),

                  const SizedBox(height: 40),

                  OrangeButtonWidget(
                    onPressed: () async {
                      var request = SignUpRequestModel(
                        name: nameController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                      );
                      await signUpCubit.Register(request);
                    },
                    text: 'Sign up',
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.loginScreen);
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.loginScreen);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.charcoal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
