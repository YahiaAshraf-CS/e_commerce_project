import 'package:e_commerce/core/constants/app_assets.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/themes/app_color.dart';
import 'package:e_commerce/features/account/presentation/view/screens/account_screen.dart';
import 'package:e_commerce/features/account/presentation/view_model/account_cubit.dart';
import 'package:e_commerce/features/cart/presentation/view/cart_screen.dart';
import 'package:e_commerce/features/favourite/presentation/view/favorite_screen.dart';
import 'package:e_commerce/features/home/presentation/view/screens/home_screen.dart';
import 'package:e_commerce/features/home/presentation/view_model/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getAllCategories()
        ..getAllProducts(),
      child: HomeScreen(),
    ),
    CartScreen(),
    FavoriteScreen(),
    BlocProvider(create: (context) => getIt<AccountCubit>()..getUserData(), child: AccountScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.orangeLight,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppAssets.home,
                width: 24,
                height: 24,
                color: Color(0xff5C5C5C),
              ),
              activeIcon: Image.asset(
                AppAssets.home,
                width: 24,
                height: 24,
                color: AppColors.orangeLight,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.shop, width: 24, height: 24),
              activeIcon: Image.asset(
                AppAssets.shop,
                width: 24,
                height: 24,
                color: AppColors.orangeLight,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.heart, width: 24, height: 24),
              activeIcon: Image.asset(
                AppAssets.heart,
                width: 24,
                height: 24,
                color: AppColors.orangeLight,
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppAssets.user, width: 24, height: 24),
              activeIcon: Image.asset(
                AppAssets.user,
                width: 24,
                height: 24,
                color: AppColors.orangeLight,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
