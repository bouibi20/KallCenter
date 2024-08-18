import 'package:flutter/material.dart';
import 'package:kallcenter/Core/Constante/ColorsApp.dart';
import 'package:kallcenter/Data/model/Commande.dart';
import 'package:kallcenter/Data/model/product.dart';
import 'package:intl/intl.dart';

List<Commandes_Model> sampleData = [
  Commandes_Model(
    '1',
    'Ref1',
    'Client 1',
    'Address 1',
    'City 1',
    '1234567890',
    200.0,
    [Product_Model('1', 'Product 1', '2')],
    'State 1',
    'green',
    DateTime.now(),
  ),
  // Add more sample data here
];

class Commandes extends StatefulWidget {
  @override
  _CommandesState createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  String filterName = '';
  DateTime? selectedDate;
  List<Commandes_Model> filteredData = sampleData;
  final List<Map<String, dynamic>> orders = [
    {
      'color': Colors.green,
      'name': 'Order name',
      'date': 'Order date',
      'price': '200 dh',
      'address': 'Address',
      'id': '#2121332',
      'phone': 'Phone number'
    },
    {
      'color': Colors.red,
      'name': 'Order name',
      'date': 'Order date',
      'price': '200 dh',
      'address': 'Address',
      'id': '#2121332',
      'phone': 'Phone number'
    },
    {
      'color': Colors.red,
      'name': 'Order name',
      'date': 'Order date',
      'price': '200 dh',
      'address': 'Address',
      'id': '#2121332',
      'phone': 'Phone number'
    },
    {
      'color': Colors.yellow,
      'name': 'Order name',
      'date': 'Order date',
      'price': '200 dh',
      'address': 'Address',
      'id': '#2121332',
      'phone': 'Phone number'
    },
    {
      'color': Colors.blue,
      'name': 'hhhh name',
      'date': '12/50/2024',
      'price': '200 dh',
      'address': 'Address kjhf ljkff \ndfbh hfdklhh dfl dflh',
      'id': '#2121332',
      'phone': '+212654654654'
    },
  ];

  void filterData() {
    setState(() {
      filteredData = sampleData.where((order) {
        bool matchesName = order.products.any((product) =>
            product.name!.toLowerCase().contains(filterName.toLowerCase()));
        bool matchesDate = selectedDate == null ||
            DateFormat('yyyy-MM-dd').format(order.created_at!) ==
                DateFormat('yyyy-MM-dd').format(selectedDate!);
        return matchesName && matchesDate;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      appBar: AppBar(
        title: Text(
          "Commandes",
          style: TextStyle(color: ColorsApp.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorsApp.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: ColorsApp.PrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // start filtre by date
                DropdownButton<String>(
                  style: TextStyle(color: ColorsApp.white),
                  dropdownColor: ColorsApp.PrimaryColor,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: ColorsApp.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  value: 'Today',
                  onChanged: (value) {},
                  items: ['Today', 'Yesterday', 'Last 7 days']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                // end filtre by date
                Spacer(),
                Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: TextField(
                    cursorOpacityAnimates: true,
                    cursorHeight: 16,
                    style: TextStyle(
                      color: ColorsApp.white,
                    ),
                    cursorColor: ColorsApp.white,
                    onChanged: (value) {
                      filterName = value;
                      filterData();
                    },
                    decoration: InputDecoration(
                      prefixIconColor: ColorsApp.white,
                      hintStyle: TextStyle(color: ColorsApp.white),
                      hintText: 'Search an order',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorsApp.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 5,
                        decoration: BoxDecoration(
                            color: orders[index]['color'],
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Row(
                        children: [
                          // Container(
                          //   width: 5,
                          //   height: 20,
                          //   color: orders[index]['color'],
                          // ),
                          // SizedBox(width: 8),
                          Text(
                            orders[index]['name'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(orders[index]['date']),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(orders[index]['price'],
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          SizedBox(height: 5),
                          Text(orders[index]['address']),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(orders[index]['id'],
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(orders[index]['phone']),
                        ],
                      ),
                    ],
                  ),
                ),
              );
              ;
            },
          )),
        ],
      ),
    );
  }

  Color _getColorFromString(String colorString) {
    switch (colorString.toLowerCase()) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'yellow':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
