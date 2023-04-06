import 'package:flutter/material.dart';
import 'package:taroudantpresse/Screans/Allnews.dart';
import 'package:taroudantpresse/Screans/Economie.dart';
import 'package:taroudantpresse/Screans/Policy.dart';

import '../Models/DrawerList.dart';
import '../Screans/Community.dart';
import '../Screans/Courts.dart';
import '../Screans/Home.dart';
import '../Screans/Sport.dart';
import '../Screans/Taroudant.dart';
import '../Screans/culture_and_art.dart';

import '../Screans/accidents_and_security.dart';
int _selectedIndex=0;

class NvDroire extends StatefulWidget {
  const NvDroire({Key? key}) : super(key: key);

  @override
  State<NvDroire> createState() => _NvDroireState();
}

class _NvDroireState extends State<NvDroire> {

  List<int> index=[0,1,2,3,4,5,6,7,8,9];
  List<Listdrawer> _Listtitle = [
    Listdrawer('جميع الأخبار',()=>Home(),Icon(Icons.newspaper),false),
    Listdrawer('سياسة',()=>Policy(),Icon(Icons.account_balance_sharp),false),
    Listdrawer('رياضة',()=>Sport(),Icon(Icons.sports),false),
    Listdrawer('إقليم تارودانت',()=>Taroudant(),Icon(Icons.policy),true),
    Listdrawer('اقتصاد',()=>Economie(),Icon(Icons.policy),false),
    Listdrawer('ثقافة وفن',()=>Culture(),Icon(Icons.policy),false),
    Listdrawer('حوادث وأمن',()=>Accident(),Icon(Icons.policy),false),
    Listdrawer('محاكم',()=>Courts(),Icon(Icons.policy),false),
    Listdrawer('مجتمع',()=>Community(),Icon(Icons.policy),false),

  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView.builder(itemBuilder: (context , position){
        return Transform.translate(
          offset: Offset(0,25),
          child: ListTile(
            selectedTileColor: Colors.black26,

            title: Text(
              _Listtitle[position].title,

              style: TextStyle(
                fontFamily: 'Schyler',
              ),
            ),
            leading: _Listtitle[position].icon,
            selected: _selectedIndex==position,
            onTap: () {
              setState(() {
                _selectedIndex=position;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _Listtitle[position].Destination()),
              );
            },
          ),
        );

      },
        itemCount: _Listtitle.length,
      ),
    );
  }

  @override
  void initState() {
    int _selectedIndex=1;
  }
}
