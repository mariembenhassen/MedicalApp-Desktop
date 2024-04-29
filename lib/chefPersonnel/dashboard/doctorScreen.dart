import 'package:flutter/material.dart';
import 'package:maryem/constant/constant.dart';

class DoctorScreen extends StatefulWidget {
  final lastName;
  final firstName;
  final number;
  final specialite;
  final disponible;
  final num_sec_soc;
  final statu_garde;
  final num_cabinet;
  final dep;
  final email;
  final date_naiss;
  final numDep;

  const DoctorScreen(
      {super.key,
      required this.lastName,
      required this.firstName,
      required this.number,
      required this.specialite,
      required this.disponible,
      required this.num_sec_soc,
      required this.statu_garde,
      required this.num_cabinet,
      required this.dep,
      required this.email,
      required this.date_naiss,
      required this.numDep});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.color1,
        title: Text(
          "Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 800,
            width: 350,
            decoration: BoxDecoration(color: AppConstant.color1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/doctor.png"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "${widget.lastName} ${widget.firstName}",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 650,
            width: 1050,
            child: Material(
              color: AppConstant.color2.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Spécialité : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.specialite.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Numero : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.number.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Disponibilité : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.disponible.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Num sec sociale : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.num_sec_soc.toString(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Num cabinet : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.num_cabinet,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Garde : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 245,
                          child: Text(
                            widget.statu_garde,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 245,
                          child: Text(
                            widget.email,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Département : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 245,
                          child: Text(
                            widget.numDep,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Date de naissance : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 245,
                          child: Text(
                            widget.date_naiss,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    // SizedBox(
                    //   height: 50,
                    //   child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.white,
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(7))),
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Envoyer une alerte",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 24),
                    //       )),
                    // )
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   // width: MediaQuery.of(context).size.width - 300,
          //   color: Colors.white,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: AppConstant.color1),
          //           onPressed: () {},
          //           child: Text(
          //             "Envoyer une alerte",
          //             style: TextStyle(color: Colors.white),
          //           )),
          //       SizedBox(
          //         height: 30,
          //       ),
          //       ElevatedButton(
          //           style: ElevatedButton.styleFrom(
          //               backgroundColor: AppConstant.color1),
          //           onPressed: () {},
          //           child: Text(
          //             "Donne-lui un patient",
          //             style: TextStyle(color: Colors.white),
          //           ))
          //     ],
          //   ),
          // ),
          SizedBox(
            width: 0,
          )
        ],
      ),
    );
  }
}
