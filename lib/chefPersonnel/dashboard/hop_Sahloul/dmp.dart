import 'package:flutter/material.dart';
import 'package:maryem/API/api_service.dart';
import 'package:maryem/chefPersonnel/dashboard/hop_Sahloul/recomendedDoctors.dart';
import 'package:maryem/constant/constant.dart';
import 'package:maryem/model/patient.dart';

class DMPscreen extends StatefulWidget {
  const DMPscreen({super.key});

  @override
  State<DMPscreen> createState() => _DMPscreenState();
}

class _DMPscreenState extends State<DMPscreen> {
  List<dynamic> DMP = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final data = await APIService.getDMP();
      setState(() {
        DMP = data;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DMP",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        foregroundColor: AppConstant.color1,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 700,
                  decoration: BoxDecoration(
                      color: AppConstant.color1,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FutureBuilder<List<Patient>>(
                      future: APIService.getDMP(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // You can change the number of columns here
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final patient = snapshot.data![index];
                              return Card(
                                elevation: 5.0,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            patient.sexe == "Masculin"
                                                ? "assets/images/patient_m.png"
                                                : "assets/images/patient_f.png",
                                            height: 220,
                                          ),
                                          SizedBox(
                                            width: 70,
                                          ),
                                          Text(
                                            patient.idPatient,
                                            style: TextStyle(
                                                color: AppConstant.color2,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '- Date de création: ${patient.dateDeCreation}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- Groupe Sanguin: ${patient.groupeSanguin}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- Les Soins: ${patient.informationsSurLesSoins}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- Antécedents: ${patient.antecedentsEtFacteursDeRisques}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- Compte Rendu Operatoire: ${patient.compteRenduOperatoire}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- Evaluation clinique: ${patient.conclusionsDeLEvaluationClinique}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '- Consentement Ecrit Du Patient: ${patient.consentementEcritDuPatient}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Dossier d'anesthesie: ${patient.dossierDAnesthesie}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Historique De Toxicomanie: ${patient.historiqueDeToxicomanie}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Maladie actuelle: ${patient.maladieActuelle}",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Motif de hopitalisation: ${patient.motifsDHospitalisation}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Notes suivi: ${patient.notesSuivi}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Plan de traitement: ${patient.plansTraitement}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Prescription Medicale: ${patient.prescriptionMedicale}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Type de prise en charge: ${patient.typeDePriseEnCharge}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Statut: ${patient.statut}",
                                        style: TextStyle(
                                            color: AppConstant.color2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "- Catégorie: ${patient.speciality}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 90,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      AppConstant.color1,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7))),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Rec_DoctorsScreen(
                                                      patientModel: patient,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Les médecins recommnadées",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
