import 'package:IT/models/category_model.dart';
import 'package:IT/models/equipement_model.dart';
import 'package:IT/pages/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  bool stat; // Define a key parameter
   HomePage({this.stat=true}); 

  List<CategoryModel> categories = [];
  // ignore: non_constant_identifier_names
  List<Equip > EquipList = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    EquipList = Equip.getEquipList(stat);
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Equipement list',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              ListView.separated(
                itemCount: EquipList.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color:  Colors.white ,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ] 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          EquipList[index].iconPath,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector( 
                              onTap: () {
                             // Handle the click event here
                                Navigator.push(
                                context,
                                  MaterialPageRoute(builder: (BuildContext context) {
                                  return FormPage();
                                 }),
                                  );
                                },
                              child:Text(
                              EquipList[index].reference,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            ),
                            Text(
                              '${EquipList[index].category}\n${EquipList[index].type}\n${EquipList[index].manufac}\n${EquipList[index].model}',
                              style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          child: SvgPicture.asset(
                           EquipList[index].StatusPath,
                            width: 20,
                            height: 20,
                            color: EquipList[index].status ? Colors.green : Colors.red,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }


// category 
  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '📍 Hopital Rabta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // start
                        Container(
                          width: 65,
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        // finish
                        Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }


// search field
  Container _searchField() {
    return Container(
          margin: const EdgeInsets.only(top: 40,left: 20,right: 20),
          decoration: BoxDecoration(
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
              hintText: 'Search Equipement',
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
              )
            ),
          ),
        );
  }


// App bar
  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Home',
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
        onTap: () {
          
        },
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
      ),
    );
  }
}