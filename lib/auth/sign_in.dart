import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:maryem/chefPersonnel/dashboard.dart';
import 'package:maryem/constant/constant.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.color1,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: FadeIn(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Lottie.asset('assets/lotties/animation1.json', height: 280),
                  SizedBox(
                    height: 20,
                  ),
                  //
                  Text(
                    "Login to your account",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(fontFamily: "Poppins"),
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            suffixIcon: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.person,
                                  color: AppConstant.color1,
                                ))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: isObsecure,
                        style: TextStyle(fontFamily: "Poppins"),
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            suffixIcon: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    shape: BoxShape.circle),
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObsecure = !isObsecure;
                                      });
                                    },
                                    icon: Icon(
                                      isObsecure == true
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppConstant.color1,
                                    )))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        print(email);
                        print(password);
                        if (email == null || email!.isEmpty) {
                          EasyLoading.showError("Please enter your email");
                        }
                        if (password == null || password!.isEmpty) {
                          EasyLoading.showError("Please enter your password");
                        }
                        _login(id_staff: email, passwordd: password);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: AppConstant.color2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login({required id_staff, required passwordd}) async {
    String url = '${AppConstant.base_url}/api/signin';

    Map<String, String> bodyRequest = {
      "id_staff": id_staff,
      "mot_de_passe": passwordd
    };
    print(jsonEncode(bodyRequest));
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(bodyRequest),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var message = jsonResponse['message'];
      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        EasyLoading.showSuccess(message);
        Navigator.of(context).push(PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                ChefDashboard()));
      } else {
        EasyLoading.showError(message);
        print(response.body);
        print('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
