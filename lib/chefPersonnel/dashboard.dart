import 'package:flutter/material.dart';
import 'package:maryem/API/api_service.dart';
import 'package:maryem/auth/sign_in.dart';
import 'package:maryem/chefPersonnel/dashboard/doctorScreen.dart';
import 'package:maryem/chefPersonnel/dashboard/hop_sahloul.dart';
import 'package:maryem/constant/constant.dart';

class ChefDashboard extends StatefulWidget {
  const ChefDashboard({super.key});

  @override
  State<ChefDashboard> createState() => _ChefDashboardState();
}

class _ChefDashboardState extends State<ChefDashboard> {
  List<dynamic> doctorsList = []; // declarina doctorsList fergha
  List<dynamic> personneMedical_List =
      []; // declarina personneMedicalLList fergha

  // naamlou hakka besh naamlou call lil method (fonction) awel matet7al page
  @override
  void initState() {
    super.initState();
    fetchDoctorsList();
    fetchPersonelMedical_List();
  }

  void fetchDoctorsList() async {
    try {
      final data = await APIService.getDoctors();
      setState(() {
        doctorsList = data; // houni abina doctorsList b data l jet
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void fetchPersonelMedical_List() async {
    try {
      final data = await APIService.getPersonnelMedical();
      setState(() {
        personneMedical_List =
            data; // houni abina personneMedical_List b data l jet
      });
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: Duration.zero,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      // ChefDashboard()
                      SpecialiteScreen()));
            },
            icon: Image.asset(
              "assets/images/hospital.png",
              color: AppConstant.color1,
            )),

        // ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: Duration.zero,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        LoginScreen()));
              },
              child: Text(
                "Déconnexion",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Bienvenue,",
                style: TextStyle(color: Colors.grey, fontSize: 27),
              ),
              Text(
                "Hopital SAHLOUL",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Médecins",
                    style: TextStyle(
                        color: AppConstant.color1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                      Text(
                        " Non disponible",
                        style: TextStyle(
                            // color: AppConstant.color2,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                  // Text(
                  //   "Voir tout",
                  //   style: TextStyle(
                  //       color: AppConstant.color2,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Material(
                shadowColor: AppConstant.color1,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: SizedBox(
                    height: 230,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                      itemCount: doctorsList.length,
                      itemBuilder: (context, index) {
                        final doctor = doctorsList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    doctor['sexe'] == "Homme"
                                        ? "assets/images/doctor_m.png"
                                        : "assets/images/doctor_f.png"),
                              ),
                              title: Text(
                                //
                                '${doctor['prénom']} ${doctor['nom']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        doctor['disponibilité'] == "Disponible"
                                            ? Colors.black
                                            : Colors.red),
                              ),
                              subtitle: Text(
                                doctor['spécialité'].toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                        transitionDuration: Duration.zero,
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            DoctorScreen(
                                              lastName: doctor['nom'],
                                              firstName: doctor['prénom'],
                                              number:
                                                  doctor['numéro_de_téléphone'],
                                              specialite: doctor['spécialité'],
                                              disponible:
                                                  doctor['disponibilité'],
                                              num_sec_soc: doctor[
                                                  'numéro_de_securité_sociale'],
                                              statu_garde:
                                                  doctor['statut_de_garde'],
                                              num_cabinet:
                                                  doctor['Numero_de_Cabinet'],
                                              dep: doctor['Numero_de_Cabinet'],
                                              email: doctor["email"],
                                              date_naiss:
                                                  doctor['date_de_naissance'],
                                              numDep:
                                                  doctor['numero_departement'],
                                            )));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppConstant.color1,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personnel",
                    style: TextStyle(
                        color: AppConstant.color1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      ),
                      Text(
                        " Non disponible",
                        style: TextStyle(
                            // color: AppConstant.color2,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                  // Text(
                  //   "Voir tout",
                  //   style: TextStyle(
                  //       color: AppConstant.color2,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Material(
                shadowColor: AppConstant.color1,
                elevation: 3,
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: SizedBox(
                    height: 230,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                      itemCount: personneMedical_List.length,
                      itemBuilder: (context, index) {
                        final personnelMedical = personneMedical_List[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 5,
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 10),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                    personnelMedical['sexe'] == "Masculin"
                                        ? "assets/images/nurse_m.png"
                                        : "assets/images/nurse_f.png"),
                              ),
                              title: Text(
                                '${personnelMedical['prenom_nom']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: personnelMedical['disponibilité'] ==
                                            "Disponible"
                                        ? Colors.black
                                        : Colors.red),
                              ),
                              subtitle: Text(
                                personnelMedical['specialite'].toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppConstant.color1,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
