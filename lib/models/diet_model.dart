import 'package:flutter/material.dart';

class DietModel{
  String name;
  String iconPath;
  String level;
  Color boxColor;
  String duration;
  String calore;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.boxColor,
    required this.duration,
    required this.calore,
    required this.viewIsSelected
  });

  static List<DietModel> getDiets(){
    List<DietModel> diets = [];
    diets.add(
      DietModel(
          name: 'Honey Pancake',
          iconPath: 'assets/icons/honey-pancakes.svg',
          level: 'Easy', boxColor:  const Color(0xff92A3FD),
          duration: '30mins', calore: '180cal',
          viewIsSelected: true)
    );
    diets.add(
      DietModel(name: 'Canal Bread',
          iconPath: 'assets/icons/canai-bread.svg',
          level: 'Easy', boxColor: const Color(0xffC58BF2),
          duration: '20mins', calore: '230Cal',
          viewIsSelected: false)
    );
    return diets;
  }
}