import 'package:flutter/material.dart';
import 'package:maryem/constant/constant.dart';

class Doc_Spec extends StatefulWidget {
  final index;
  const Doc_Spec({super.key, required this.index});

  @override
  State<Doc_Spec> createState() => _Doc_SpecState();
}

class _Doc_SpecState extends State<Doc_Spec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppConstant.color1,
        title: Text(
          widget.index == 0 ? " Généraliste " : "Internes en médecine",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
