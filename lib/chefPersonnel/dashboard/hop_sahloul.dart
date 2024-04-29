import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maryem/chefPersonnel/dashboard/hop_Sahloul/dmp.dart';
import 'package:maryem/chefPersonnel/dashboard/hop_Sahloul/medical.dart';
import 'package:maryem/constant/constant.dart';

class SpecialiteScreen extends StatefulWidget {
  const SpecialiteScreen({super.key});

  @override
  State<SpecialiteScreen> createState() => _SpecialiteScreenState();
}

class _SpecialiteScreenState extends State<SpecialiteScreen> {
  List medSpecList = [
    "Généraliste",
    "Internes en médecine",
    "Chirurgien",
    "Anesthésiologiste",
    "Obstétricien-gynécologue",
    "Pédiatre",
    "Cardiologue",
    "Neurologue",
    "Psychiatre",
    "Radiologue",
    "Urologue",
    "Orthopédiste",
    "Néphrologue"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppConstant.color1,
        title: Text(
          "Hopital SAHLOUL",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset("assets/lotties/animation2.json",
                  repeat: false, height: 400),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstant.color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: Duration.zero,
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SpecialiteMedical()));
                    },
                    child: Text(
                      "Les Specialités Medicales ",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 220,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstant.color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DMPscreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Voir DMP",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ),
              // SizedBox(
              //   width: 250,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: AppConstant.color1,
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(7))),
              //       onPressed: () {},
              //       child: Text(
              //         "Para-Medicale",
              //         style: TextStyle(fontSize: 25, color: Colors.white),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
