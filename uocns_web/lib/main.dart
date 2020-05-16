import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/pages/about_page.dart';
import 'package:uocns_web/pages/generator_page.dart';
import 'package:uocns_web/pages/simulator_page.dart';

import 'pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto', accentColor: CustomColors.simulator_main),
        title: "UOCNS",
        debugShowCheckedModeBanner: false,
        initialRoute: '/main',
        routes: {
          '/main': (BuildContext context) => MainPage(),
          '/simulator': (BuildContext context) => SimulatorPage(),
          '/generator': (BuildContext context) => GeneratorPage(),
          '/about': (BuildContext context) => AboutPage(),
        });
  }
}
