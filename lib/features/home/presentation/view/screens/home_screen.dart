import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/data/repo/home_data_source_imp.dart';
import 'package:e_commerce/features/home/data/repo/home_repo_imp.dart';
import 'package:e_commerce/features/home/domin/repo/home_repo_interface.dart';
import 'package:e_commerce/features/home/domin/use_case/get_all_categories_user_case.dart';
import 'package:e_commerce/features/home/domin/use_case/get_all_products_user_case.dart';
import 'package:e_commerce/features/home/presentation/view_model/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit homeCubit;

  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi ,',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Let's Start Your Day",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HCLoading ||
                      current is HCSuccess ||
                      current is HCError,
                  builder: (context, state) {
                    if (state is HCLoading) {
                      return Skeletonizer(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemBuilder: (context, index) =>
                              const Bone.button(width: 80, height: 40),
                        ),
                      );
                    } else if (state is HCSuccess) {
                      final categories = state.categoriesList;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          return CategoryItem(category: categories[index]);
                        },
                      );
                    } else if (state is HCError) {
                      return Center(child: Text(state.messageError));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is HPLoading ||
                    current is HPSuccess ||
                    current is HPError,
                builder: (context, state) {
                  if (state is HPLoading) {
                    return Expanded(
                      child: Skeletonizer(
                        child: GridView.builder(
                          itemCount: 6,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Bone(
                                    height: 140,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text('Product title here'),
                                        SizedBox(height: 6),
                                        Text('EGP 000'),
                                        SizedBox(height: 6),
                                        Text('4.5'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is HPSuccess) {
                    final products = state.productList;

                    return Expanded(
                      child: GridView.builder(
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Container(
                                        height: 140,
                                        width: double.infinity,
                                        color: const Color(0xFFF5F5F5),
                                        child: Image.network(
                                          product.images.first,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.favorite_border,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'EGP ${product.discountPercentage}',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            'EGP ${product.price}',
                                            style: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.amber,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 14,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            product.rating.toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is HPError) {
                    return Center(child: Text(state.messageError));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
