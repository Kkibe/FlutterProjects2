import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trigger_news/apiService.dart';
import 'package:trigger_news/statechoose.dart';

// ignore: must_be_immutable
class OTP extends StatefulWidget {
  String v_code;
  String mobile;

  OTP(this.v_code, this.mobile);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String smsotp = "";
  String v_cod = "";
  bool t = false;
  int r1 = 0;
  int r2 = 0;
  int r3 = 0;
  var userid;

  late SharedPreferences pref;
  ApiService apiService = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    r1 = Random().nextInt(1000);
    r1 = Random().nextInt(1000);
    r1 = Random().nextInt(1000);
    print("$r1$r2$r3");
  }

  init() async {
    pref = await SharedPreferences.getInstance();
    userid = pref.getString("id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            "assets/otp.jpg",
            height: 300,
          ),
          Text(
            "Verify OTP",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Please enter 6 digit code sent to \nyour mobile number",
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.black,
              focusedBorderColor: Colors.blue,
              showFieldAsBox: true,
              borderWidth: 2,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                smsotp = verificationCode;
                smsotp = verificationCode;
                print(smsotp);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "If you don't receive the code ?",
              ),
              TextButton(
                onPressed: () async {
                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '+91 ${widget.mobile}',
                  //   verificationCompleted:
                  //       (PhoneAuthCredential credential) async {
                  //     await auth.signInWithCredential(credential);
                  //   },
                  //   verificationFailed: (FirebaseAuthException e) {
                  //     if (e.code == 'invalid-phone-number') {
                  //       print('The provided phone number is not valid.');
                  //     }
                  //   },
                  //   codeSent: (String verificationId, int? resendToken) {
                  //     v_cod = verificationId;
                  //   },
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );
                },
                child: Text(
                  "Resend",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // text color
                elevation: 5,
              ),
              onPressed: () async {
                try {
                  String smsCode = smsotp;

                  print(smsCode);
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.v_code, smsCode: smsCode);

                  await auth
                      .signInWithCredential(credential)
                      .then((value) async {
                    t = true;
                    setState(() {});
                  });
                } catch (e) {
                  Fluttertoast.showToast(
                    msg: "Wrong OTP",
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
                if (t == true) {
                  if (userid == null) {
                    var data = new Map<String, dynamic>();
                    data["username"] = "Sahil";
                    data["email"] = "sahilbhayani$r1$r2$r3@gmail.com";
                    data["mobilenum"] = widget.mobile;
                    data["password"] = "123456";
                    data["confirm_password"] = "123456";

                    var login = await apiService.postCall("user/adduser", data);
                    print('$login');
                    print('${login['messges']}');

                    if (login['success'] == 1) {
                      var resData = await apiService
                          .getCall("user/getuserbymobile/${widget.mobile}");
                      print("${resData}");
                      if (resData["success"] == 1) {
                        await pref.setString(
                            'id', resData['data'][0]['id'].toString());
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => statechoose(),
                            ),
                            (route) => false);
                      }
                    }
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => statechoose(),
                        ),
                        (route) => false);
                  }
                }
              },
              child: Text(
                "Verify",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
