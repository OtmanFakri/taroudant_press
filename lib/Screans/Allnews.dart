import 'package:flutter/material.dart';

import '../Controlloer/APINewsControlloer.dart';
import '../static/NvDroi.dart';
class Allnews extends StatefulWidget {

  Allnews({Key? key}) : super(key: key);

  @override
  State<Allnews> createState() => _AllnewsState();
}

class _AllnewsState extends State<Allnews> {
  getAll newsall=getAll();
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      drawer: NvDroire(),
      appBar: AppBar(),
      body: Container(
        color: Colors.lightGreen,
      ),
    );
  }
}
