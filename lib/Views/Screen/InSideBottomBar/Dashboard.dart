import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kallcenter/Controllers/InSideBottomBar/Dashboard.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';
import 'package:kallcenter/Views/Widget/CustomShape.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardControllerImp>(
      init: DashboardControllerImp(),
      builder: (controller) => Scaffold(
        backgroundColor: ColorsApp.bgcolor,
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style:
                TextStyle(color: ColorsApp.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: ColorsApp.white,
          actions: [
            GestureDetector(
              onTap: () {
                controller.selectStores();
              },
              child: Container(
                margin: EdgeInsets.all(controller.size.defaultSize! * 0.8), //10
                height: controller.size.defaultSize! * 5, //140
                width: controller.size.defaultSize! * 5,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsApp.black, width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        "https://ui-avatars.com/api/?name=bdl-hna&color=000000&background=f1f1ff"),
                  ),
                ),
              ),
              // Icon(
              //   Icons.storefront,
              //   color: ColorsApp.black,
              //   size: controller.size.fontSize! * 1.3,
              // ),
              // Text(
              //   controller.store,
              //   style: TextStyle(
              //     color: ColorsApp.black,
              //     fontSize: controller.size.fontSize! * 0.9,
              //   ),
              // ),
            ),
          ],
          // bottom: TabBar(
          //   controller: _tabController,
          //   indicatorSize: TabBarIndicatorSize.label,
          //   indicator: UnderlineTabIndicator(
          //     borderSide: BorderSide(color: ColorsApp.whiteLite, width: 2.0),
          //     insets: EdgeInsets.fromLTRB(0, 0.0, 0, 10),
          //     borderRadius: BorderRadius.circular(3),
          //   ),
          //   isScrollable: true,
          //   tabs: [
          //     Tab(
          //       child:
          //           Text("Today", style: TextStyle(color: ColorsApp.whiteLite)),
          //     ),
          //     Tab(
          //       child: Text("Yesterday",
          //           style: TextStyle(color: ColorsApp.whiteLite)),
          //     ),
          //     Tab(
          //       child: Text("This_Week",
          //           style: TextStyle(color: ColorsApp.whiteLite)),
          //     ),
          //     Tab(
          //       child: Text("Last_3_Months",
          //           style: TextStyle(color: ColorsApp.whiteLite)),
          //     ),
          //   ],
          // ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: controller.size.screenHeight! * 0.015,
                horizontal: controller.size.screenWidth! * 0.05),
            child: Column(
              children: [
                ////////////////////////////////START section for welcom user
                Container(
                  height: controller.size.screenHeight! * 0.09,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorsApp.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(controller.size.defaultSize! * 2.5))),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(
                            controller.size.defaultSize! * 0.8), //10
                        height: controller.size.screenWidth! * 0.15, //140
                        width: controller.size.screenWidth! * 0.15,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 154, 155, 156),
                              width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                                "https://ui-avatars.com/api/?name=yahya-ouibi&color=000000&background=f1f1ff"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: controller.size.screenWidth! * 0.03,
                      ),
                      Text(
                        "Welcome  ${controller.user.name}",
                        style: TextStyle(
                            color: Color(0xff2D509F),
                            fontSize: controller.size.defaultSize! * 1.8,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ////////////////////////////////END section for welcom user
                SizedBox(
                  height: controller.size.screenHeight! * 0.015,
                ),
                ////////////////////////////////START section filter
                Container(
                  width: double.infinity,
                  height: controller.size.screenHeight! * 0.05,
                  decoration: BoxDecoration(
                      color: ColorsApp.PrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Today tomorow");
                        },
                        child: Row(
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  color: ColorsApp.white,
                                  fontSize: controller.size.defaultSize! * 1.5),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ColorsApp.white,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          controller.Commande
                              ? Opacity(
                                  opacity: 0.5,
                                  child: Text("Commande",
                                      style: TextStyle(
                                        color: ColorsApp.white,
                                        fontFamily: 'Poppins',
                                      )),
                                )
                              : Text("Commande",
                                  style: TextStyle(
                                    color: ColorsApp.white,
                                    fontFamily: 'Poppins',
                                  )),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: controller.switchCommandAndPaimment(),
                            child: Icon(
                              Icons.compare_arrows,
                              color: ColorsApp.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          !controller.Commande
                              ? Opacity(
                                  opacity: 0.5,
                                  child: Text("Paiement",
                                      style: TextStyle(
                                        color: ColorsApp.white,
                                        fontFamily: 'Poppins',
                                      )),
                                )
                              : Text("Paiement",
                                  style: TextStyle(
                                    color: ColorsApp.white,
                                    fontFamily: 'Poppins',
                                  )),
                        ],
                      )
                    ],
                  ),
                ),
                ////////////////////////////////END section filter
                SizedBox(
                  height: controller.size.screenHeight! * 0.02,
                ),
                ////////////////////////////////START section for statistics
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: SingleChildScrollView(
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceAround,
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                          Container(
                            width: controller.size.screenWidth! * 0.27,
                            height: controller.size.screenWidth! * 0.3,
                            constraints: BoxConstraints(
                              maxWidth: 140, // Maximum width of the container
                              maxHeight: 150, // Maximum height of the container
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xffe7eefc))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Totale Order"),
                                Text("1502 ${controller.Commande ? "" : "DH"}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                ////////////////////////////////END section for statistics
              ],
            ),
          ),
        ),
      ),
    );
  }
}
