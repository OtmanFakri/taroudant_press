import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:async';
import '../Controlloer/APINewsControlloer.dart';
import '../Models/NewsApiModel.dart';
import '../Models/ads/adsType/Banner.dart';
import '../main.dart';
import '../static/DetailPost.dart';
import '../static/NvDroi.dart';
import '../static/Post.dart';
import '../static/colorsCategory.dart';
import '../static/Post.dart' as widgt;
import 'Search.dart';
int pages=1;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final contoller = ScrollController();

  getAll newsall=getAll();
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
        future: newsall.News(pages.toString()),
        builder: (context,AsyncSnapshot snapshot){

          switch (snapshot.connectionState){
            case ConnectionState.done:
              if (snapshot.hasData){
                List<APiNewsAll> newss=snapshot.data;
                return  ListView.builder(
                  controller: contoller,
                  itemBuilder: (context, position){
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
                                        fontWeight: FontWeight.bold
                                    ),


                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],

                              ),
                            ],
                          ),
                        ),
                      );
                    }else{
                      return Column(
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
    );
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


  String _title(String tittle) {
    var ss=tittle.replaceAll('&#8221;', '"');
    var at=ss.replaceAll('&#8220;', '"');
    return at;
  }

  @override
  void initState() {
    Notifaction();
  contoller.addListener(() {
  if(contoller.position.maxScrollExtent == contoller.offset){
addItem();
}

});
  }
  Future addItem()async {
    pages++;
    return newsall.News(pages.toString());
  }

  Future<void> Notifaction() async {
    OneSignal.shared.setAppId("c1d53770-ae0b-4fdf-a285-81a614447e9c");
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
    String _debugLabelString = "";
    OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

  }

}






