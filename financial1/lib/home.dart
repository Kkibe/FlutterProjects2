import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.lightBlue])),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          Text(
                            "Available balance",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: const Color(0XFF008686),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(.1))
                              ],
                              border:
                                  Border.all(width: 1.5, color: Colors.white),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQER5v-Cmxd3jMJNYocsllW6TPDO44FK0PuRw&s'),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Christopher Summers",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.camera_front,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                        text: "\$5320",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: ".50",
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ]),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Row(
                children: [
                  Text(
                    "Income",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_upward, color: Color(0XFF00838F)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
