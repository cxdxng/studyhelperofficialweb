import 'dart:convert';

import 'package:flutter/material.dart';

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

  // Create a list for all upcomming appointments for runtime
  List appointments = [];
  // Create an instance of DateTime.now() to get current time
  DateTime now = DateTime.now();
  // Empty Strings to hold selected Date/Time for adding events
  String formattedDate = "";
  String formattedTime = "";

  // Unformatted date for uploading to mysql
  String mysqlDate = "";

  // Images for Cards
  AssetImage sis = const AssetImage("assets/sis.png");
  AssetImage horde = const AssetImage("assets/horde.png");
  AssetImage lea = const AssetImage("assets/lea.png");
  AssetImage leaIntern = const AssetImage("assets/leaIntern.png");
  AssetImage eva = const AssetImage("assets/eva.png");
  AssetImage eva2 = const AssetImage("assets/eva2.png");
  AssetImage stundenplan = const AssetImage("assets/stundenplan.png");
  AssetImage zeitplanImage = const AssetImage("assets/zeitplanImage.png");

  // Links to websites
  String linkSIS = "https://sis.h-brs.de";
  String linkHorde = "https://horde.inf.h-brs.de";
  String linkLea = "https://lea.h-brs.de";
  String linkLeaIntern =
      "https://lea.hochschule-bonn-rhein-sieg.de/goto.php?target=crs_214074";
  String linkEva = "https://eva.inf.h-brs.de";
  String linkEva2 = "https://eva2.inf.h-brs.de";
  String stundenplanEva = "https://eva2.inf.h-brs.de/stundenplan/";
  String zeitplan = "https://horde.inf.h-brs.de/fbz.html";

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      makeCard(horde, linkHorde),
                      makeCard(sis, linkSIS),
                      makeCard(lea, linkLea),
                      makeCard(leaIntern, linkLeaIntern),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      makeCard(eva, linkHorde),
                      makeCard(eva2, linkHorde),
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
