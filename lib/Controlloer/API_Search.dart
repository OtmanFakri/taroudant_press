import 'dart:convert';

import 'package:get/get.dart';

import '../Models/NewsApiModel.dart';
import '../static/APIConfig.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
class Shearch extends GetxController{

  Future<List<APiNewsAll>>News(String? query) async{
    List<APiNewsAll> news =[];
    String Url='https://taroudantpresse.ma/wp-json/wp/v2/posts?_embed=wp:term&search='+query!;
    var rep= await http.get(Uri.parse(Url));
    if (rep.statusCode == 200){
      var data = jsonDecode(rep.body);
      for (var i in data){

        APiNewsAll art=APiNewsAll(
          Tittle: i['title']['rendered'],
          Image: i['jetpack_featured_media_url'],
          Description: i['content']['rendered'],
          Date: i['date'],
          Ctaegory: i['_embedded']['wp:term'][0][0]['name'],
          Link: i['link'],
        );
        news.add(art);
      }
      //
    }

    return news;
  }
}