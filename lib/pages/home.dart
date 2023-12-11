import 'package:breakfast/models/category_model.dart';
import 'package:breakfast/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/popular_diet_model.dart';
class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popular_diets = [];

  void _getInitialInfo (){
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
    popular_diets = PopularDietModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return  Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white ,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 20,),
          _categoriesSection(),
          const SizedBox(height: 20,),
          _dietSection(),
          const SizedBox(height: 20,),
          _popular_diets(),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

  Column _popular_diets() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ListView.separated(
                itemBuilder: (context, index){
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: popular_diets[index].viewIsSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popular_diets[index].viewIsSelected ? [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0,10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ] : []
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(popular_diets[index].iconPath,
                          width: 60,
                          height: 60,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popular_diets[index].name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 13
                              ),
                            ),
                            Text(
                               "${popular_diets[index].level} | ${popular_diets[index].duration} | ${popular_diets[index].calore}",
                                style: const TextStyle(
                                  color: Color(0xff7B6F72),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400
                                ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: SvgPicture.asset('assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),

                  );
                },
                shrinkWrap: true,
                separatorBuilder: (context, index){
                  return  const SizedBox(height: 40,);
                },
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemCount: popular_diets.length
            )
          ],
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        "Breakfast",
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (){},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)
            ),
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
          ),
        )
      ],
    );
  }
  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xff1D1617).withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0
            )
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Search Pancake',
            hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/Search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/Filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
            )
        ),
      ),
    );
  }
  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Category",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 150,
              child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (context, index){ return const SizedBox(width: 25,);},
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),
                  itemBuilder: (context, index){
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(categories[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14
                      ),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        );
  }
  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("Recommended for diet",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 190,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Text(
                        diets[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calore,
                        style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.transparent,
                                diets[index].viewIsSelected ? Color(0xff92A3FD) : Colors.transparent
                              ]
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                                color: diets[index].viewIsSelected ? Colors.white : Color(0xffC58BF2),
                                fontWeight: FontWeight.w400,
                                fontSize: 14
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index){
                return const SizedBox(width: 25,);
              },
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20
              ),
              itemCount: diets.length),
        )
      ],
    );
  }
}