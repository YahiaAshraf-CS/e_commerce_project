import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/themes/app_color.dart';
import 'package:e_commerce/features/account/data/repo/account_data_source_imp.dart';
import 'package:e_commerce/features/account/data/repo/account_repo_imp.dart';
import 'package:e_commerce/features/account/domain/use_case/get_user_data_use_case.dart';
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

  @override
  void initState() {
    super.initState();
    final repo = AccountRepoImp(AccountDataSourceImp());
    accountCubit = AccountCubit(GetUserDataUseCase(repo))..getUserData();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      body: BlocBuilder<AccountCubit, AccountState>(
        bloc: accountCubit,
        builder: (context, state) {

          if (state is AccountLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if(state is AccountError){
            return Center(child: Text(state.messageError,style: const TextStyle(color: AppColors.orangeDark),));
          }
          if (state is AccountSuccess){
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
                            child: state.userDataEntity.message.image.isEmpty
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
                                    imageUrl:
                                        state.userDataEntity.message.image,
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
                          ), Positioned(
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
                      controller:TextEditingController(text: state.userDataEntity.message.name),
                      labelText: 'Name',
                      HintText: 'Name',
                    ),
                    const SizedBox(height: 16),
                    FormFieldWidget(
                      controller: TextEditingController(
                        text: state.userDataEntity.message.phone,
                      ),
                      labelText: 'Phone',
                      HintText: 'Phone',
                    ),
                    const SizedBox(height: 16),
                    FormFieldWidget(
                      controller: TextEditingController(
                        text: state.userDataEntity.message.email,
                      ),
                      labelText: 'Email',
                      HintText: 'Email',
                    ),
                    const SizedBox(height: 16),
                    FormFieldWidget(
                      controller: TextEditingController(
                        text: state.userDataEntity.message.address,
                      ),
                      labelText: 'Address',
                      HintText: 'Address',
                    ),
                  ],
                ),
              ),
            );
       
          }
          return SizedBox(height: 10,);
           },
      ),
    );
  }
}
