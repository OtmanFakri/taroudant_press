import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:async/async.dart';
Widget BuildSocail(String link){
  return ElevatedButton(

      onPressed: () async{
        return await Share.share(link);
      },
      child: Icon(Icons.rocket_launch),
  style:ElevatedButton.styleFrom(

    minimumSize: Size.fromHeight(40),
  ),
  );

}

