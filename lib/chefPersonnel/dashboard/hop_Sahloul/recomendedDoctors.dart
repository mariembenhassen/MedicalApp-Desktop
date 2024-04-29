import 'package:flutter/material.dart';
import 'package:maryem/API/api_service.dart';
import 'package:maryem/model/patient.dart';

class Rec_DoctorsScreen extends StatefulWidget {
  final Patient patientModel;
  const Rec_DoctorsScreen({super.key, required this.patientModel});

  @override
  State<Rec_DoctorsScreen> createState() => _Rec_DoctorsScreenState();
}

class _Rec_DoctorsScreenState extends State<Rec_DoctorsScreen> {
  @override
  void initState() {
    super.initState();
    _fetchDoctorsData();
  }

  Future<void> _fetchDoctorsData() async {
    try {
      print(_doctorsList);
      List<dynamic> doctors = await APIService.getDoctorsBySpecialty(
          specialty: widget.patientModel.speciality);
      setState(() {
        _doctorsList = doctors;
      });
    } catch (e) {
      // Handle error
      print("Error fetching doctors: $e");
    }
  }

  List<dynamic> _doctorsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Doctors'),
      ),
      body: _doctorsList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _doctorsList.length,
              itemBuilder: (context, index) {
                var doctor = _doctorsList[index];
                return ListTile(
                  title: Text(doctor['nom'].toString() +
                      ' ' +
                      doctor['prénom'].toString()),
                  subtitle: Text(doctor['spécialité'].toString()),
                  // Add more details as needed
                );
              },
            ),
    );
  }
}
