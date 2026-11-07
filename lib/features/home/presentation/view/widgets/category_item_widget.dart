import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  // final String title;
  final CategoryModel category;
 
  

  const CategoryItem({
    super.key,
    required this.category,
    
    
  });

  @override
  Widget build(BuildContext context) {
    return 
    
       Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:  Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:  Colors.black87,
          ),
        ),
        child: Center(
          child: Text(
            category.name ?? '',
            style: TextStyle(
              color:  Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          
        ),
      )
    ;
  }
}
