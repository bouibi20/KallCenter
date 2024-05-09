import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Controllers/Home.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
        init: HomeControllerImp(),
        builder: (controller) => Scaffold(
              body: controller.screens[controller.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                elevation: 100,
                // backgroundColor: ColorsApp.PrimaryColor,
                currentIndex: controller.currentIndex,
                onTap: (index) => controller.next(index),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: ColorsApp.PrimaryColor,
                unselectedItemColor: ColorsApp.black,
                // selectedFontSize: 30,
                // unselectedFontSize: 15,
                iconSize: 30,
                items: [
                  Icons.dashboard,
                  Icons.shopping_bag_outlined,
                  Icons.settings
                ]
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        BottomNavigationBarItem(
                          icon: Container(
                            child: Icon(value),
                          ),
                          label: '',
                        )))
                    .values
                    .toList(),
              ),
            ));
  }
}
