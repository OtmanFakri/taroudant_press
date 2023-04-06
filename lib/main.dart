import 'package:flutter/material.dart';

import 'Screans/Home.dart';
import 'static/AppBar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:get/get.dart';

bool darMod=false;

main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
runApp(Homepage());
}


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''), // English, no country code
        // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: Appbar.appBar,
      darkTheme: ThemeData.dark(),

      themeMode: ThemeMode.system,

      home:Home(),
    );
  }
}

