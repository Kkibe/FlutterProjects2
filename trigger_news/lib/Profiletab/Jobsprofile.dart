import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news/apiService.dart';

class JobsProfile extends StatefulWidget {
  JobsProfile({Key? key}) : super(key: key);

  @override
  State<JobsProfile> createState() => _JobsProfileState();
}

class _JobsProfileState extends State<JobsProfile> {
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
    var resdata = await apiService.getCall('job/getjob/$userid');
    log("${resdata}");
    setState(() {
      data1 = resdata['data'];
      temp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (temp == false)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (data1.isEmpty)
              ? Center(
                  child: Text("No Data"),
                )
              : ListView(
                  children: [
                    for (var item in data1)
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "http://144.91.124.145/~codecha/trigger_news/" +
                                      item["image"],
                                  fit: BoxFit.cover,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    "${item["job_title"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "${item["hiring_for"]}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Salary: ",
                                    ),
                                    Text(
                                      "₹${item["minimum"]} - ₹${item["maximum"]}",
                                      style: TextStyle(
                                        color: Color.fromRGBO(92, 179, 255, 1),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.yellow,
                                  ),
                                  child: Text(
                                    "Pending approvel",
                                    style: TextStyle(
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ],
                ),
    );
  }
}
