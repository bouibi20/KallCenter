import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kallcenter/Controllers/InSideBottomBar/Commandes.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';

class Commandes extends StatefulWidget {
  const Commandes({super.key});

  @override
  State<Commandes> createState() => _CommandesState();
}

class _CommandesState extends State<Commandes>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _basicFormatter = DateFormat('dd-MM-yyyy');
  final _complexFormatter = DateFormat('E. dd MMM.y');
  final _scrollController = ScrollController();
  final _startDateTextEditingController = TextEditingController();
  final _endDateTextEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommandesImp>(
      init: CommandesImp(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Commandes",
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: controller.size.screenHeight! * 0.07,
                  child: TextField(
                    onChanged: controller.searched,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.shade400,
                        size: controller.size.fontSize! * 1.3,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 6.0,
                          borderRadius: BorderRadius.circular(
                              controller.size.screenWidth! * 0.2),
                          borderSide: BorderSide(color: Colors.grey.shade100)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(22, 0, 0, 0),
                        spreadRadius: 0,
                        blurRadius: 15)
                  ]),
                  child: ClipPath(
                      clipper: const ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                      child: Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              left:
                                  BorderSide(color: ColorsApp.red, width: 6.0)),
                        ),
                        child: Column(children: [
                          // the id
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text('54add4',
                                style: const TextStyle(
                                    color: ColorsApp.whiteLite,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                          ),

                          // the name and the amount
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("folan fartalan",
                                    style: const TextStyle(
                                        color: ColorsApp.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                                Row(
                                  children: [
                                    Text('200 MAD',
                                        style: const TextStyle(
                                            color: ColorsApp.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Icon(
                                      IconData(0xf659),
                                      size: 20,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          // the first row
                          Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: ColorsApp.grey,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: ColorsApp.grey,
                                width: 1,
                              ),
                            )),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'City: Agadir',
                                          style: const TextStyle(
                                              color: ColorsApp.grey,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]),
                                ),
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Tooltip(
                                        message:
                                            '0654789654\ndouble click to call the number',
                                        child: Text(
                                          'Phone: 0654789665 ',
                                          style: const TextStyle(
                                              color: ColorsApp.grey,
                                              fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),

                          // the second row
                          Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            decoration: const BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                color: ColorsApp.grey,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: ColorsApp.grey,
                                width: 1,
                              ),
                            )),
                            child: Text(
                              'Address: iutuef ugze ogezg 12 fffvou ufzey',
                              style: const TextStyle(
                                  color: ColorsApp.grey,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          // the third row
                          // Container(
                          //   width: double.maxFinite,
                          //   margin: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                          //   padding: const EdgeInsets.symmetric(vertical: 4),
                          //   decoration: const BoxDecoration(
                          //       border: Border(
                          //     top: BorderSide(
                          //       color: ColorsApp.grey,
                          //       width: 1,
                          //     ),
                          //     bottom: BorderSide(
                          //       color: ColorsApp.grey,
                          //       width: 1,
                          //     ),
                          //   )),
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //         flex: 1,
                          //         child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 'Pack:pack',
                          //                 style: const TextStyle(
                          //                     color: ColorsApp.grey,
                          //                     fontWeight: FontWeight.w600),
                          //                 overflow: TextOverflow.ellipsis,
                          //               ),
                          //             ]),
                          //       ),
                          //       Expanded(
                          //         flex: 1,
                          //         child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.start,
                          //             children: [
                          //               Text(
                          //                 'Quantity: 14',
                          //                 style: const TextStyle(
                          //                     color: ColorsApp.grey,
                          //                     fontWeight: FontWeight.w600),
                          //                 overflow: TextOverflow.ellipsis,
                          //               ),
                          //             ]),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // the date row
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month,
                                    color: ColorsApp.grey, size: 20),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  _basicFormatter
                                      .format(DateTime(2024, 05, 02)),
                                  style: const TextStyle(
                                      color: ColorsApp.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          // confirmation and delivery row
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.headphones_outlined,
                                          color: Color(0xFF4F4B5C),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text("confirmed",
                                            style: const TextStyle(
                                                color: ColorsApp.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16))
                                      ],
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.delivery_dining_outlined,
                                          color: Color(0xFF4F4B5C),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text("Delivery",
                                            style: const TextStyle(
                                                color: Color(0xFF4F4B5C),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16))
                                      ],
                                    ))
                              ],
                            ),
                          ),

                          // confirmed and no response row
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 146, 195, 146),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          'Confirmed',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: ColorsApp.green),
                                        ),
                                      ),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 229, 171, 171),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          'No Response',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: ColorsApp.red),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),

                          // dates row
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 7, 15, 0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      _basicFormatter
                                          .format(DateTime(2024, 05, 03)),
                                      style: const TextStyle(
                                          color: ColorsApp.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                        _basicFormatter
                                            .format(DateTime(2024, 05, 04)),
                                        style: const TextStyle(
                                            color: ColorsApp.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600))),
                              ],
                            ),
                          ),

                          // the part that expand
                          (controller.isExpanded)
                              ? Column(
                                  children: [
                                    // confirmed by and delivered by
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //       15, 20, 15, 0),
                                    //   child: Row(
                                    //     children: [
                                    //       Expanded(
                                    //           flex: 1,
                                    //           child: Text(
                                    //             "Confirmed_by",
                                    //             style: const TextStyle(
                                    //                 color: ColorsApp.grey,
                                    //                 fontSize: 14,
                                    //                 fontWeight:
                                    //                     FontWeight.w500),
                                    //           )),
                                    //       const SizedBox(
                                    //         width: 10,
                                    //       ),
                                    //       Expanded(
                                    //           flex: 1,
                                    //           child: Text("Delivered_by",
                                    //               style: const TextStyle(
                                    //                   color: ColorsApp.grey,
                                    //                   fontSize: 14,
                                    //                   fontWeight:
                                    //                       FontWeight.w500))),
                                    //     ],
                                    //   ),
                                    // ),

                                    // the confirmer and the delivery man
                                    // Padding(
                                    //   padding: const EdgeInsets.fromLTRB(
                                    //       15, 5, 15, 0),
                                    //   child: Row(
                                    //     children: [
                                    //       Expanded(
                                    //         child: Container(
                                    //           padding:
                                    //               const EdgeInsets.symmetric(
                                    //                   vertical: 10),
                                    //           decoration: BoxDecoration(
                                    //               color: ColorsApp.PrimaryColor,
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10),
                                    //               border: Border.all(
                                    //                   width: 1,
                                    //                   color: ColorsApp.grey)),
                                    //           child: Center(
                                    //               child: Text('confirmerName',
                                    //                   style: const TextStyle(
                                    //                       fontSize: 14,
                                    //                       fontWeight:
                                    //                           FontWeight.w700,
                                    //                       color: ColorsApp
                                    //                           .white))),
                                    //         ),
                                    //       ),
                                    //       const SizedBox(width: 10),
                                    //       Expanded(
                                    //         child: Container(
                                    //           padding:
                                    //               const EdgeInsets.symmetric(
                                    //                   vertical: 10),
                                    //           decoration: BoxDecoration(
                                    //               color: ColorsApp.PrimaryColor,
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10),
                                    //               border: Border.all(
                                    //                   width: 1,
                                    //                   color: ColorsApp.grey)),
                                    //           child: Center(
                                    //               child: Text('eliveryMan',
                                    //                   style: const TextStyle(
                                    //                       fontSize: 14,
                                    //                       fontWeight:
                                    //                           FontWeight.w700,
                                    //                       color: ColorsApp
                                    //                           .white))),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                )
                              : const SizedBox(),

                          // buttons row
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {
                                    // url_lancher.launchUrl(Uri.parse('tel:${order.phone!}'));

                                    // url_lancher.launchUrl(Uri.parse(
                                    // 'whatsapp://send?phone=+212-671-181146?text=hello'));
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: ColorsApp.PrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.phone_in_talk_rounded,
                                        color: Colors.white,
                                      )),
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: ColorsApp.PrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.message,
                                        color: Colors.white,
                                      )),
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: ColorsApp.PrimaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Icon(
                                        Icons.edit_rounded,
                                        color: Colors.white,
                                      )),
                                )),
                              ],
                            ),
                          ),

                          // see more
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.isExpanded =
                                      !(controller.isExpanded);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: ColorsApp.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (controller.isExpanded)
                                            ? "See more"
                                            : "See less",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        (controller.isExpanded)
                                            ? Icons.arrow_drop_up_rounded
                                            : Icons.arrow_drop_down_rounded,
                                        color: Colors.white,
                                      )
                                    ]),
                              ),
                            ),
                          ),
                        ]),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
