import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maryem/constant/constant.dart';
import 'package:maryem/model/patient.dart';

class APIService extends ChangeNotifier {
  //
  // ======> get doctors <======
  //
  static Future<List<dynamic>> getDoctors() async {
    final response = await http
        .get(Uri.parse('${AppConstant.base_url}/api/nodes/getDoctors'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['nodes'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  //
  // ======> get personnel <======
  //
  static Future<List<dynamic>> getPersonnelMedical() async {
    final response = await http
        .get(Uri.parse('${AppConstant.base_url}/api/nodes/getPersonnel'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['nodes'];
    } else {
      throw Exception('Failed to load data');
    }
  }

  //
  // ======> get patient <======
  //
  static Future<List<Patient>> getDMP() async {
    final response =
        await http.get(Uri.parse('${AppConstant.base_url}/api/nodes/getDMP'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['nodes'];
      return responseData.map((json) => Patient.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  //
  // ======> get medecin par spec <======
  //

  static Future<List<dynamic>> getDoctorsBySpecialty(
      {required specialty}) async {
    final response = await http
        .get(Uri.parse('${AppConstant.base_url}/api/nodes/getDoctors'));

    if (response.statusCode == 200) {
      List<dynamic> doctors = json.decode(response.body)['nodes'];
      return doctors.where((doctor) => doctor['sexe'] == specialty).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
