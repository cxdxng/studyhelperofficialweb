import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    supportedLocales: [
      const Locale('de', 'DE'),
    ],
    initialRoute: "/",
    routes: {
      "/": (context) => const Home(),
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Declare variables for runtime

  TextEditingController searchController = TextEditingController();

  // Images for Cards
  AssetImage sis = const AssetImage("assets/sis.png");
  AssetImage horde = const AssetImage("assets/horde.png");
  AssetImage lea = const AssetImage("assets/lea.png");
  AssetImage leaIntern = const AssetImage("assets/leaIntern.png");
  AssetImage miaImg = const AssetImage("assets/mia.png");
  AssetImage mensaImage = const AssetImage("assets/mensaImage.png");
  AssetImage praktoImage = const AssetImage("assets/praktoImage.png");
  AssetImage stundenplan = const AssetImage("assets/stundenplan.png");
  AssetImage zeitplanImage = const AssetImage("assets/zeitplanImage.png");
  AssetImage evaImage = const AssetImage("assets/eva.png");

  // Links to websites
  String linkSIS = "https://sis.h-brs.de";
  String linkHorde = "https://horde.inf.h-brs.de";
  String linkLea = "https://lea.h-brs.de";

  String miaLink = "https://mia.h-brs.de/";
  String linkEva = "https://eva.inf.h-brs.de";
  String linkPrakto = "https://praktomat.inf.h-brs.de/";
  String stundenplanEva = "https://eva2.inf.h-brs.de/stundenplan/";
  String zeitplan = "https://horde.inf.h-brs.de/fbz.html";

  String mensa =
      "https://www.studierendenwerk-bonn.de/essen-trinken/mensen-cafes/mensa-sankt-augustin/";

  @override
  void initState() {
    super.initState();
    // Fetch data from Mysql to use in runtime
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Study Helper"),
        ),
        body: Builder(builder: (context) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/wallpaper.jpg"))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: makeText("Welcome to StudyHelper"),
                  ),
                  Container(
                    height: 100,
                    width: 700,
                    child: TextField(
                      onSubmitted: ((value) {
                        launchUrl(Uri.parse("https://$value"));
                        searchController.clear();
                      }),
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Open URL...",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      makeCard(horde, linkHorde),
                      makeCard(sis, linkSIS),
                      makeCard(lea, linkLea),
                      makeCard(miaImg, miaLink),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      makeCard(mensaImage, mensa),
                      makeCard(evaImage, linkEva),
                      makeCard(stundenplan, stundenplanEva),
                      makeCard(zeitplanImage, zeitplan),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "made with ❤ by cxdxng",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ]),
          );
        }),
      ),
    );
  }
}

Widget makeCard(image, link) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    color: Colors.white,
    child: InkWell(
      onTap: () {
        launchUrl(Uri.parse(link));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(child: Image(image: image)),
      ),
    ),
  );
}

Widget makeText(String data) {
  return Text(
    data,
    style: const TextStyle(shadows: [
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 2.0,
        color: Colors.black,
      ),
    ], fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
  );
}

Widget makeDarkText(String data) {
  return Text(
    data,
    style: const TextStyle(
        fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
  );
}
