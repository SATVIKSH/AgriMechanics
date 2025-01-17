import 'dart:math';

import 'package:agri_mechanic/Screens/Services/SpecificUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class customerData extends StatefulWidget {
  const customerData({super.key});

  @override
  State<customerData> createState() => _customerDataState();
}

class _customerDataState extends State<customerData> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Customers",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[400],
        ),
        body: Stack(children: [
          Image.asset(
            'images/Nature1.jpg',
            fit: BoxFit.cover,
            height: size.height,
          ),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: Colors.black, width: 0.5)),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => customerDetails(
                                              Contact_Number:
                                                  snapshot.data!.docs[index]
                                                      ["Contact Number"],
                                            )));
                              },
                              leading: CircleAvatar(
                                child: Text("${index + 1}"),
                              ),
                              title: Text(
                                "${snapshot.data!.docs[index]["Name"]}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Contact Number: ${snapshot.data!.docs[index]["Contact Number"]}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        "Village, District: ${snapshot.data!.docs[index]["Village, District"]}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))
                                  ]),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text("${snapshot.hasError.toString()}"),
                    );
                  }
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ]));
  }
}
