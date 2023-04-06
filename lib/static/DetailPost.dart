import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:taroudantpresse/static/NvDroi.dart';
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Models/NewsApiModel.dart';
import '../Models/ads/adsType/Banner.dart';
import '../Screans/sss.dart';
import 'package:html/dom.dart' as dom;
import 'dart:convert' show utf8;

import 'Social.dart';


class Deatil extends StatelessWidget {

  APiNewsAll cat;


  Deatil(this.cat);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //width: MediaQuery.of(context).size.width,
              child: Image.network(cat.Image,width:double.infinity ,fit: BoxFit.fill),
              height: MediaQuery.of(context).size.height * 0.37,
            ),
            SizedBox(height: 5),
            Column(
              children: [
                //title
                Padding(padding: EdgeInsets.only(right: 10,left: 10),
                  child: Text(
                    _title(cat.Tittle),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Schyler',
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                //date
                Padding(padding: EdgeInsets.only(left: 10,right: 10),
                  child: Text(_date(cat.Date)),
                ),
                SizedBox(height: 5),
                Adsbanner(),
                _html(cat.Description),
                SizedBox(height: 3),
                BuildSocail(cat.Link),
              ],
            ),


          ],
        ),

      ),

    );

  }
}

String _title(String tittle) {
var ss=tittle.replaceAll('&#8221;', '"');
var at=ss.replaceAll('&#8220;', '"');
return at;
}



_html(var ss) {
  return Container(
    padding: EdgeInsets.only(left: 10,right: 10,),
    child: Center(
      child: SingleChildScrollView(

        child:Html(

          data: ss,
          style: {
            'html': Style(textAlign: TextAlign.justify,
            fontSize: FontSize(17),
              fontFamily: 'Schyler',
            ),
            

          },

        ),

      ),
    ),
  );
}


String _date(String date) {
  DateTime dt = DateTime.parse(date);
  print(dt.month);
  var newDt = DateFormat.yMMMEd('FR').format(dt);
  return newDt.toString();
}

