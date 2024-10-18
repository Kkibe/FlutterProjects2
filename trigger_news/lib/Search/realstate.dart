import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news/Search/m_l_m_v_3dot.dart';
import 'package:trigger_news/Search/more_localmarket_view.dart';
import 'package:trigger_news/apiService.dart';

class realstate1 extends StatefulWidget {
  const realstate1({super.key});

  @override
  State<realstate1> createState() => _realstate1State();
}

class _realstate1State extends State<realstate1> {
  ApiService apiService = ApiService();
  late SharedPreferences pref;
  var userid;
  bool temp = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  List data1 = [];
  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
    log("userid ${userid}");
    var resdata = await apiService.getCall('realestate/getrealestate/$userid');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
      temp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            child: AppBar(
              title: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textScaleFactor: 1.0,
                        "Sahil",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        textScaleFactor: 1.0,
                        "Varachha, Surat,Gujarat",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              toolbarHeight: 120,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              backgroundColor: Color.fromRGBO(92, 179, 255, 1),
            ),
          ),
          Expanded(
            child: (temp == false)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (data1.isEmpty)
                    ? Center(
                        child: Text("No Data"),
                      )
                    : ListView(
                        padding: EdgeInsets.only(top: 10),
                        children: [
                          for (var item in data1)
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        'http://144.91.124.145/~codecha/trigger_news/' +
                                            item["image"],
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 8, right: 8, top: 8),
                                    child: Text(
                                      textScaleFactor: 1.0,
                                      "${item["description"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              child: Text(
                                                textScaleFactor: 1.0,
                                                "By Paresh",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      More_localmarket_view(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 5,
                                                  left: 9,
                                                  right: 9),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    92, 179, 255, 1),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                // border: Border.all(color: Colors.grey),
                                              ),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/eyes.png",
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    textScaleFactor: 1.0,
                                                    "View",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            padding: EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                left: 9,
                                                right: 9),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  92, 179, 255, 1),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              // border: Border.all(color: Colors.grey),
                                            ),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/call.png",
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  textScaleFactor: 1.0,
                                                  "Call",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        m_l_m_v_3dot(),
                                                  ));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Icon(
                                                Icons.more_vert,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
