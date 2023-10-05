import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });
  
  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    
    categories.add(
      CategoryModel(
        name: 'Diagnostic',
        iconPath: 'assets/icons/diag.svg',
        boxColor: Color(0xffD5F1FF)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Monoitoring',
        iconPath: 'assets/icons/monit.svg',
        boxColor: Color(0xFF6AB4CF)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Imaging',
        iconPath: 'assets/icons/imagi.svg',
        boxColor: Color(0xffD5F1FF)
      )
    );

    categories.add(
      CategoryModel(
        name: 'Surgical',
        iconPath: 'assets/icons/surg.svg',
        boxColor: Color(0xFF6AB4CF)
      )
    );
    

    return categories;
  }
}