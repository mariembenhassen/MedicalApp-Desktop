import 'package:flutter/material.dart';
import 'package:maryem/chefPersonnel/dashboard/hop_Sahloul/doc_spec.dart';

import '../../../constant/constant.dart';

class SpecialiteMedical extends StatefulWidget {
  const SpecialiteMedical({super.key});

  @override
  State<SpecialiteMedical> createState() => _SpecialiteMedicalState();
}

class _SpecialiteMedicalState extends State<SpecialiteMedical> {
  List<dynamic> medSpecList = [
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
          "Les specialités medicales",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 600,
              child: GridView.builder(
                itemCount: medSpecList.length,
                physics: AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Doc_Spec(index: index),
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                            color: AppConstant.color1,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          medSpecList[index],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
