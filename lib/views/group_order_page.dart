import 'dart:async';

import 'package:api_demo/models/group_order_to.dart';
import 'package:api_demo/models/item_to.dart';
import 'package:api_demo/services/group_order_api.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/views/restaurant_page.dart';

import 'item_page.dart';

class GroupOrderPage extends StatefulWidget {
  const GroupOrderPage({Key? key}) : super(key: key);

  @override
  _GroupOrderPageState createState() => _GroupOrderPageState();
}

class _GroupOrderPageState extends State<GroupOrderPage> {
  List<GroupOrderTo>? groupOrders;
  String? name;
  String? creator;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //String s = ModalRoute.of(context).settings.arguments;

    //fetch data from API
    getData();
  }

  getData() async {
    groupOrders = await GroupOrderServiceAPI().listGroupOrders();
    if (groupOrders != null) {
      setState(() {
        groupOrders = groupOrders;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Orders"),
      ),
      body: groupOrders == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: groupOrders!.length,
              itemBuilder: (context, index) {
                GroupOrderTo? groupOrder = groupOrders![index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) =>
                    //    GroupOrderDetail(groupOrderId: groupOrder.id)
                    //         ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: groupOrder.status == "OPEN"
                          ? Color.fromARGB(255, 110, 167, 187)
                          : Color.fromARGB(255, 206, 193, 192),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(groupOrder.name),
                                  Text(groupOrder.creator),
                                  Text(
                                      "Total Price: \$${groupOrder.totalPrice}"),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  _updateStatus(groupOrder.id);
                                },
                                child: Icon(Icons.update),
                              ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  // Function 2
                                },
                                child: Icon(Icons.delete),
                              ),
                            ])),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
          _createNewGroupOrder();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _createNewGroupOrder() {
    // make a post request here to create a new group order
    // you can use a package like http or dio to make the request
    // update the groupOrders list with the new group order
  }
  void _updateStatus(int id) {
    GroupOrderServiceAPI().updateStatusOfGroupOrder(id);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Enter Name"),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(hintText: "Enter Creator"),
                onChanged: (value) {
                  creator = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Save"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Add restaurant"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RestaurantPage()));
              },
            )
          ],
        );
      },
    );
  }
}
