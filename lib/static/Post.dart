import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controlloer/APINewsControlloer.dart';
import '../Controlloer/ApiCategoris.dart';
import '../Models/NewsApiModel.dart';
import '../Models/ads/adsType/Banner.dart';
import '../Screans/Search.dart';
import 'DetailPost.dart';
import 'NvDroi.dart';
import 'colorsCategory.dart';


class PostCard extends StatefulWidget {
  String? Id;

  PostCard(this.Id);

  @override
  State<PostCard> createState() => _PostCardState(Id);


}

class _PostCardState extends State<PostCard> {
  final _controller = PageController();
  int pages=1;
  String? Id;

  _PostCardState(this.Id);

  getcat newscatg=Get.put(getcat(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:NvDroire(),
      appBar:AppBar(

        centerTitle: true,
        title: Image.asset('assest/images/logo.png'
          ,fit: BoxFit.cover,color: Colors.white,
          width: 118,height: 32,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  showSearch(context: context, delegate: Search());
                }, icon:Icon(Icons.search),),
            ],
          )
        ],
      ) ,
      body: FutureBuilder(
        future: newscatg.News(Id,pages.toString()),
        builder: (context,AsyncSnapshot snapshot){

          switch (snapshot.connectionState){
            case ConnectionState.done:
              if (snapshot.hasData){
                List<APiNewsAll> newss=snapshot.data;
                return  ListView.builder(itemBuilder: (context, position){
                  if(position<newss.length){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                           return Deatil(newss[position]);
                        }));
                      },
                      child: Container(

                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                        margin: EdgeInsets.only(left: 2,right: 2,bottom: 5),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.31,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.srcOver),
                                image: NetworkImage(newss[position].Image),
                                fit: BoxFit.cover)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //alignment: Alignment.topRight,
                          children: [

                            Category(ColorsCategory[newss[position].Ctaegory],newss[position].Ctaegory),
                            Column(

                              children: [
                                comentanddate(Time(newss[position].Date)),
                                Text(title(newss[position].Tittle) ,maxLines: 2
                                  ,style: TextStyle(
                                      fontFamily: 'Schyler',
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                  ),


                                ),

                              ],

                            ),
                          ],
                        ),
                      )
                    );
                  }else{
                    return  Column(
                      children: [
                    Center(
                    child: TextButton(child: Text("أظهر المزيد"),
                  onPressed: (){
                  setState(() {
                  pages++;
                  });
                  },),
                  ),
                        SizedBox(height: 10,),
                        Adsbanner(),
                      ],
                    );


                  }


                },
                  itemCount: newss.length+1,
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
          return Container();
        },
      ),
    );;
  }

}



Widget err( err ) {
  return Center(child: Container(child: Text(err),));
}

Widget Category(var oo,String name) {
  return Container(
    //padding: EdgeInsets.only(left: 12),
    width: 120,
    margin: EdgeInsets.all(12),
    child: Center(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Schyler'),)),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: oo,
    ),
  );
}

Widget comentanddate(var time) {
  TextStyle _date = TextStyle(
    fontSize: 12,
    color: Colors.white,

  );
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Row(

      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 2,),
        Text(time,style: _date,textAlign: TextAlign.end),
      ],
    ),
  );
}

String Time(var input){
  DateTime dt = DateTime.parse(input);
  Duration diff = DateTime.now().difference(dt);

  if(diff.inDays >= 1){
    if(diff.inDays == 2){
      return 'منذ يومين';}
    else{
      return ' منذ${diff.inDays}ايام ';
    }
  } else if(diff.inHours >= 11){
    return ' منذ${diff.inHours}ساعة ';
  } else if(diff.inHours >= 1){
    return ' منذ${diff.inHours}ساعات ';
  } else if(diff.inMinutes >= 1){
    return ' منذ${diff.inMinutes}دقيقة ';
  } else if (diff.inSeconds >= 1){
    return ' قبل${diff.inSeconds}ثانية ';
  } else {
    return 'just now';
  }
}
String title(String tittle) {
  var ss=tittle.replaceAll('&#8221;', '"');
  var at=ss.replaceAll('&#8220;', '"');
  return at;
}