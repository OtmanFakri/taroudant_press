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


class Culture extends StatefulWidget {
  const Culture({Key? key}) : super(key: key);

  @override
  State<Culture> createState() => _CultureState();
}

class _CultureState extends State<Culture> {
  getAll newscatg=Get.put(getAll(),permanent: true);
  @override
  Widget build(BuildContext context) {

    return PostCard('26');
  }
}


