
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:taroudantpresse/Models/ads/ads.dart';
import '../ads.dart';

class Adsbanner extends StatefulWidget {

  @override
  State<Adsbanner> createState() => _AdsbannerState();
}

class _AdsbannerState extends State<Adsbanner> {

  ads adss=ads();
  late BannerAd baneraD;
  bool isad=true;
  final BanerSize= AdSize(width: 320, height: 100);
  void _creat (){
  baneraD = BannerAd(size: BanerSize, adUnitId:adss.banerADs(),
  listener: BannerAdListener(
  onAdClosed: (ad){
    print('erree');
  },
      onAdLoaded: (ad){
        setState(() {
  isad=true;
        });

  }
      ) , request: AdRequest());
  baneraD.load();
}
  @override
  Widget build(BuildContext context) {
    if(isad){
      return Container(
        width: BanerSize.width.toDouble(),
        height: BanerSize.height.toDouble(),
        child: AdWidget(
          ad:baneraD ,
        ),
      );
    }else{
      return Container(
        width: BanerSize.width.toDouble(),
        height: BanerSize.height.toDouble(),
        color: Colors.red,
      );
    }
  }

  @override
  void initState() {
    _creat();
  }

  @override
  void dispose() {
    baneraD.dispose();
  }
}
