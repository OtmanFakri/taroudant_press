import 'package:flutter/material.dart';
import 'package:taroudantpresse/Models/NewsCtaegoryModel.dart';
import 'package:taroudantpresse/static/NvDroi.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../Controlloer/APINewsControlloer.dart';
import '../Models/NewsApiModel.dart';
import '../Models/NewsCtaegoryModel.dart';
import '../Controlloer/ApiCategoris.dart';
import '../Models/NewsCtaegoryModel.dart';
import '../static/Post.dart';


class Accident extends StatefulWidget {
  const Accident({Key? key}) : super(key: key);

  @override
  State<Accident> createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  getAll newscatg=Get.put(getAll(),permanent: true);
  @override
  Widget build(BuildContext context) {

    return PostCard('28');
  }
}


