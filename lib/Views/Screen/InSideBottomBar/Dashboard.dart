import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kallcenter/Controllers/Dashboard.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardControllerImp>(
      init: DashboardControllerImp(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Dashboard",
            style: TextStyle(color: ColorsApp.whiteLite),
          ),
          backgroundColor: ColorsApp.PrimaryColor,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5, horizontal: controller.size.screenWidth! * 0.05),
              child: Row(
                children: [
                  Icon(
                    Icons.storefront,
                    color: ColorsApp.whiteLite,
                    size: controller.size.fontSize! * 1.3,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object");
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            controller.store,
                            style: TextStyle(
                              color: ColorsApp.whiteLite,
                              fontSize: controller.size.fontSize! * 0.9,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_circle_rounded,
                            size: controller.size.fontSize! * 1.2,
                            color: ColorsApp.whiteLite,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: ColorsApp.whiteLite, width: 2.0),
              insets: EdgeInsets.fromLTRB(0, 0.0, 0, 10),
              borderRadius: BorderRadius.circular(3),
            ),
            isScrollable: true,
            tabs: [
              Tab(
                child:
                    Text("Today", style: TextStyle(color: ColorsApp.whiteLite)),
              ),
              Tab(
                child: Text("Yesterday",
                    style: TextStyle(color: ColorsApp.whiteLite)),
              ),
              Tab(
                child: Text("This_Week",
                    style: TextStyle(color: ColorsApp.whiteLite)),
              ),
              Tab(
                child: Text("Last_3_Months",
                    style: TextStyle(color: ColorsApp.whiteLite)),
              ),
            ],
          ),
        ),
        body: Container(
          child: TabBarView(
            controller: _tabController,
            dragStartBehavior: DragStartBehavior.start,
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  // MyLogger.instance.d('refresh');
                  // context.read<DashboardTodayViewModel>().fetchData();
                },
                child: SingleChildScrollView(
                  // child: Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 30,
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Tooltip(
                  //           message: '10 DH',
                  //           child: Stack(
                  //             children: [
                  //               Container(
                  //                 width:
                  //                     MediaQuery.of(context).size.width * 0.43,
                  //                 height: 105,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(10),
                  //                   color: ColorsApp.green,
                  //                   boxShadow: const [
                  //                     BoxShadow(
                  //                         color: ColorsApp.SecondColor,
                  //                         spreadRadius: 0,
                  //                         blurRadius: 5),
                  //                   ],
                  //                 ),
                  //               ),
                  //               Container(
                  //                   width: MediaQuery.of(context).size.width *
                  //                       0.43,
                  //                   height: 100,
                  //                   decoration: const BoxDecoration(
                  //                     borderRadius: BorderRadius.only(
                  //                         topLeft: Radius.circular(10),
                  //                         topRight: Radius.circular(10),
                  //                         bottomLeft: Radius.circular(7),
                  //                         bottomRight: Radius.circular(7)),
                  //                     color: Colors.white,
                  //                   ),
                  //                   child: Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Row(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.end,
                  //                         children: [
                  //                           const SizedBox(
                  //                             width: 10,
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 const EdgeInsets.fromLTRB(
                  //                                     0, 15, 0, 0),
                  //                             child: Text(
                  //                               "test 1",
                  //                               style: TextStyle(
                  //                                   fontSize: 30,
                  //                                   fontWeight: FontWeight.bold,
                  //                                   color: ColorsApp.black),
                  //                             ),
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 const EdgeInsets.fromLTRB(
                  //                                     0, 0, 0, 2),
                  //                             child: Text(
                  //                               'test 2',
                  //                               style: const TextStyle(
                  //                                   fontSize: 20,
                  //                                   fontWeight:
                  //                                       FontWeight.normal,
                  //                                   color: ColorsApp.whiteLite),
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           const SizedBox(
                  //                             width: 10,
                  //                           ),
                  //                           Text(
                  //                             "Test 3",
                  //                             style: TextStyle(
                  //                                 fontSize: 16,
                  //                                 fontWeight: FontWeight.normal,
                  //                                 color: ColorsApp.red),
                  //                           )
                  //                         ],
                  //                       )
                  //                     ],
                  //                   ))
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //         ),
                  //         // ComponentOne(
                  //         //     chosenColor: MyColors.blue,
                  //         //     text1: '${dashboardData.onGoing}',
                  //         //     text2: '(${dashboardData.onGoingPercentage}%)',
                  //         //     text3: S.of(context).Ongoing),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 20,
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Stack(
                  //           children: [
                  //             Container(
                  //               width: MediaQuery.of(context).size.width * 0.43,
                  //               height: 105,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 color: ColorsApp.green,
                  //                 boxShadow: const [
                  //                   BoxShadow(
                  //                       color: ColorsApp.whiteLite,
                  //                       spreadRadius: 0,
                  //                       blurRadius: 5),
                  //                 ],
                  //               ),
                  //             ),
                  //             //   Container(
                  //             //       width: MediaQuery.of(context).size.width * 0.43,
                  //             //       height: 100,
                  //             //       decoration: const BoxDecoration(
                  //             //         borderRadius: BorderRadius.only(
                  //             //             topLeft: Radius.circular(10),
                  //             //             topRight: Radius.circular(10),
                  //             //             bottomLeft: Radius.circular(7),
                  //             //             bottomRight: Radius.circular(7)),
                  //             //         color: Colors.white,
                  //             //       ),
                  //             //       child: Column(
                  //             //         crossAxisAlignment: CrossAxisAlignment.start,
                  //             //         children: [
                  //             //           Row(
                  //             //             crossAxisAlignment: CrossAxisAlignment.end,
                  //             //             children: [
                  //             //               const SizedBox(
                  //             //                 width: 10,
                  //             //               ),
                  //             //               Padding(
                  //             //                 padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  //             //                 child: Text(
                  //             //                   text1,
                  //             //                   style: TextStyle(
                  //             //                       fontSize: 30,
                  //             //                       fontWeight: FontWeight.bold,
                  //             //                       color: chosenColor),
                  //             //                 ),
                  //             //               ),
                  //             //               Padding(
                  //             //                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  //             //                 child: Text(
                  //             //                   text2,
                  //             //                   style: const TextStyle(
                  //             //                       fontSize: 20,
                  //             //                       fontWeight: MyFontWeight.normal,
                  //             //                       color: MyColors.greyLight2),
                  //             //                 ),
                  //             //               )
                  //             //             ],
                  //             //           ),
                  //             //           Row(
                  //             //             children: [
                  //             //               const SizedBox(
                  //             //                 width: 10,
                  //             //               ),
                  //             //               Text(
                  //             //                 text3,
                  //             //                 style: TextStyle(
                  //             //                     fontSize: 16,
                  //             //                     fontWeight: FontWeight.normal,
                  //             //                     color: chosenColor),
                  //             //               )
                  //             //             ],
                  //             //           )
                  //             //         ],
                  //             //       ))
                  //           ],
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         // ComponentOne(
                  //         //     chosenColor: MyColors.redOne,
                  //         //     text1: '${dashboardData.failed}',
                  //         //     text2: '(${dashboardData.failedPercentage}%)',
                  //         //     text3: S.of(context).Failed),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: 20,
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 10),
                  //       child: Stack(
                  //         children: [
                  //           //   Container(
                  //           //     width: MediaQuery.of(context).size.width * 0.90,
                  //           //     height: 285,
                  //           //     decoration: BoxDecoration(
                  //           //       borderRadius: BorderRadius.circular(10),
                  //           //       color: MyColors.violet,
                  //           //       boxShadow: const [
                  //           //         BoxShadow(color: MyColors.shadow, spreadRadius: 0, blurRadius: 5)
                  //           //       ],
                  //           //     ),
                  //           //   ),
                  //           //   Container(
                  //           //       height: 280,
                  //           //       width: MediaQuery.of(context).size.width * 0.90,
                  //           //       decoration: const BoxDecoration(
                  //           //         borderRadius: BorderRadius.only(
                  //           //             topLeft: Radius.circular(10),
                  //           //             topRight: Radius.circular(10),
                  //           //             bottomLeft: Radius.circular(7),
                  //           //             bottomRight: Radius.circular(7)),
                  //           //         color: MyColors.white,
                  //           //       ),
                  //           //       child: Column(
                  //           //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           //         children: [
                  //           //           Container(
                  //           //             margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  //           //             height: 220,
                  //           //             child: Stack(
                  //           //               children: [
                  //           //                 Center(
                  //           //                   child: PieChart(
                  //           //                     PieChartData(
                  //           //                       centerSpaceRadius: 85,
                  //           //                       sectionsSpace: 0,
                  //           //                       sections: getChart(
                  //           //                           (100 - rate).toDouble(), rate.toDouble()),
                  //           //                     ),
                  //           //                   ),
                  //           //                 ),
                  //           //                 Center(
                  //           //                   child: Text('$rate%',
                  //           //                       style: const TextStyle(
                  //           //                         fontSize: 50,
                  //           //                         fontWeight: FontWeight.bold,
                  //           //                         color: MyColors.violet,
                  //           //                       )),
                  //           //                 )
                  //           //               ],
                  //           //             ),
                  //           //           ),
                  //           //           Container(
                  //           //             width: double.maxFinite,
                  //           //             padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  //           //             child: Text(S.of(context).Delivery_Rate,
                  //           //                 style: const TextStyle(
                  //           //                   fontSize: 16,
                  //           //                   fontWeight: FontWeight.normal,
                  //           //                   color: MyColors.violet,
                  //           //                 )),
                  //           //           ),
                  //           //         ],
                  //           //       ))
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       height: 20,
                  //     ),
                  //   ],
                  // ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: controller.size.screenHeight! * 0.008),
                          child: Text(
                            "Bonjour, Yahya Bouibi",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: controller.size.fontSize! * 1.3,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Commande",
                                style: TextStyle(
                                    fontSize: controller.size.fontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              // Text("Commande"),
                              Switch(
                                value: controller.swit,
                                activeTrackColor: ColorsApp.PrimaryColor,
                                inactiveTrackColor: ColorsApp.SecondColor,
                                inactiveThumbColor: ColorsApp.white,
                                onChanged: (value) =>
                                    controller.commandePaimment(value),
                              ),
                              Text(
                                "Paiement",
                                style: TextStyle(
                                    fontSize: controller.size.fontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: controller.size.screenHeight! * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: controller.size.screenHeight! * 0.03,
                          ),
                          child: Center(
                            child: Wrap(
                              spacing: 50,
                              runSpacing: 50,
                              children: [
                                Container(
                                  width: controller.size.screenWidth! * 0.35,
                                  height: controller.size.screenWidth! * 0.3,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Livré",
                                          style: TextStyle(
                                              color: ColorsApp.white,
                                              fontSize:
                                                  controller.size.fontSize,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "1500440 MAD",
                                          style: TextStyle(
                                            color: ColorsApp.whiteLite,
                                            fontSize: controller.size.fontSize,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: controller.size.screenWidth! * 0.35,
                                  height: controller.size.screenWidth! * 0.3,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Expédition",
                                          style: TextStyle(
                                              color: ColorsApp.white,
                                              fontSize:
                                                  controller.size.fontSize,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "5000 MAD",
                                          style: TextStyle(
                                            color: ColorsApp.whiteLite,
                                            fontSize: controller.size.fontSize,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: controller.size.screenWidth! * 0.35,
                                  height: controller.size.screenWidth! * 0.3,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.orange,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Annulé",
                                          style: TextStyle(
                                              color: ColorsApp.white,
                                              fontSize:
                                                  controller.size.fontSize,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "7506 MAD",
                                          style: TextStyle(
                                            color: ColorsApp.whiteLite,
                                            fontSize: controller.size.fontSize,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: controller.size.screenWidth! * 0.35,
                                  height: controller.size.screenWidth! * 0.3,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.gold,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Pas de réponse",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColorsApp.white,
                                              fontSize:
                                                  controller.size.fontSize,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "780 MAD",
                                          style: TextStyle(
                                            color: ColorsApp.whiteLite,
                                            fontSize: controller.size.fontSize,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: controller.size.screenWidth! * 0.35,
                                  height: controller.size.screenWidth! * 0.3,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Refuse",
                                          style: TextStyle(
                                              color: ColorsApp.white,
                                              fontSize:
                                                  controller.size.fontSize,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "120 MAD",
                                          style: TextStyle(
                                            color: ColorsApp.whiteLite,
                                            fontSize: controller.size.fontSize,
                                          ),
                                        ),
                                      ]),
                                ),
                                Container(
                                  width: controller.size.screenWidth! * 0.35,
                                  height: controller.size.screenWidth! * 0.3,
                                  decoration: BoxDecoration(
                                      color: ColorsApp.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Inj & BV",
                                          style: TextStyle(
                                              color: ColorsApp.white,
                                              fontSize:
                                                  controller.size.fontSize,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "50 MAD",
                                          style: TextStyle(
                                            color: ColorsApp.whiteLite,
                                            fontSize: controller.size.fontSize,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(child: Text("test 2 dashboard")),
              Center(child: Text("test 3 dashboard")),
              Center(child: Text("test 4 dashboard"))
            ],
          ),
        ),
      ),
    );
  }
}
