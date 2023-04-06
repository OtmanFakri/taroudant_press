import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controlloer/APINewsControlloer.dart';
import '../Controlloer/API_Search.dart';
import '../Controlloer/ApiCategoris.dart';
import '../Models/NewsApiModel.dart';
import 'DetailPost.dart';
import 'NvDroi.dart';
import 'Post.dart';
import 'colorsCategory.dart';


class PostSearch extends StatefulWidget {
  String? Id;

  PostSearch(this.Id);

  @override
  _PostSearchState createState() => _PostSearchState(Id);


}

class _PostSearchState extends State<PostSearch> {
  String? Id;

  _PostSearchState(this.Id);

  Shearch newscatg=Get.put(Shearch(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: newscatg.News(Id),
        builder: (context,AsyncSnapshot snapshot){

          switch (snapshot.connectionState){
            case ConnectionState.done:
              if (snapshot.hasData){
                List<APiNewsAll> newss=snapshot.data;
                return  ListView.builder(itemBuilder: (context, position){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Deatil(newss[position]);
                      }));
                    },
                    child:Stack(
                      //alignment: Alignment.topRight,
                      children: [
                        _ImageBG(newss[position].Image),
                        Padding(
                          padding: const EdgeInsets.only(top: 150,right: 10),
                          child: Column(
                            children: [
                              comentanddate(Time(newss[position].Date)),
                              Text(title(newss[position].Tittle) ,maxLines: 2
                                ,style: TextStyle(
                                    fontFamily: 'Schyler',
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),


                              ),


                            ],

                          ),

                        ),
                        Category(ColorsCategory[newss[position].Ctaegory],newss[position].Ctaegory),
                      ],
                    ) ,
                  );

                },
                  itemCount: newss.length,
                );
                break;
              }else{
                return Container(
                  child: err(snapshot.error.toString()),
                  margin: EdgeInsets.all(16),
                );
              }

            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
          }
          return Container(
            color: Colors.deepPurple,
          );
        },
      ),
    );;
  }
  Widget _ImageBG(var image){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.31,
      margin: EdgeInsets.all(2),
      child: ColorFiltered(
        colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.srcOver),
        child: Image.network(
          image, fit: BoxFit.fill,),
      ),
    );
  }
}




