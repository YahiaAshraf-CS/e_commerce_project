import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/themes/app_color.dart';
import 'package:e_commerce/core/widgets/orange_button_widget.dart';

import 'package:e_commerce/features/account/presentation/view_model/account_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late AccountCubit accountCubit;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    
    accountCubit = injectableAccountCubit()..getUserData();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    imageController.dispose();
    super.dispose();
  }

  void _initializeControllers(userData) {
    if (!_isInitialized) {
      nameController.text = userData.message.name;
      phoneController.text = userData.message.phone;
      emailController.text = userData.message.email;
      addressController.text = userData.message.address;
      imageController.text = userData.message.image;
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      body: BlocConsumer<AccountCubit, AccountState>(
        bloc: accountCubit,
        listener: (context, state) {
          if (state is UpdateUserDataSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.messageSuccess)),
            );
            accountCubit.getUserData();
          } else if (state is UpdateUserDataError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.messageError)),
            );
          }
        },
        builder: (context, state) {
          if (state is AccountLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AccountError) {
            return Center(
              child: Text(
                state.messageError,
                style: const TextStyle(color: AppColors.orangeDark),
              ),
            );
          }
          if (state is AccountSuccess) {
            _initializeControllers(state.userDataEntity);

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: imageController.text.isEmpty
                                ? Image.asset(
                                    AppAssets.picture,
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                    imageUrl: imageController.text,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                          AppAssets.picture,
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    FormFieldWidget(
                      controller: nameController,
                      labelText: 'Name',
                      HintText: 'Name',
                    ),
                    const SizedBox(height: 16),
                    FormFieldWidget(
                      controller: phoneController,
                      labelText: 'Phone',
                      HintText: 'Phone',
                    ),
                    const SizedBox(height: 16),
                    FormFieldWidget(
                      controller: emailController,
                      labelText: 'Email',
                      HintText: 'Email',
                    ),
                    const SizedBox(height: 16),
                    FormFieldWidget(
                      controller: addressController,
                      labelText: 'Address',
                      HintText: 'Address',
                    ),
                    const SizedBox(height: 32),
                    state is UpdateUserDataLoading
                        ? const CircularProgressIndicator()
                        : OrangeButtonWidget(
                            text: 'submit',
                            onPressed: () async {
                              await accountCubit.updateUserData(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text,
                                address: addressController.text,
                                image: imageController.text,
                              );
                            },
                          ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}