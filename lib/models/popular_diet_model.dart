import 'package:flutter/material.dart';

class PopularDietModel{
  String name;
  String iconPath;
  String level;
  Color boxColor;
  String duration;
  String calore;
  bool viewIsSelected;

  PopularDietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.boxColor,
    required this.duration,
    required this.calore,
    required this.viewIsSelected
  });

  static List<PopularDietModel> getPopularDiets(){
    List<PopularDietModel> getPopularDiets = [];
    getPopularDiets.add(
        PopularDietModel(
            name: 'Honey Pancake',
            iconPath: 'assets/icons/honey-pancakes.svg',
            level: 'Easy', boxColor:  const Color(0xff92A3FD),
            duration: '30mins', calore: '180cal',
            viewIsSelected: true
        )
    );
    getPopularDiets.add(
        PopularDietModel(name: 'Canal Bread',
            iconPath: 'assets/icons/canai-bread.svg',
            level: 'Easy', boxColor: const Color(0xffC58BF2),
            duration: '20mins', calore: '230Cal',
            viewIsSelected: false
        )
    );
    return getPopularDiets;
  }
}