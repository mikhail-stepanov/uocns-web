import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/size_config.dart';
import 'package:uocns_web/pages/about_page.dart';
import 'package:uocns_web/pages/generator_page.dart';
import 'package:uocns_web/pages/main_page.dart';
import 'package:uocns_web/pages/simulator_page.dart';

class Header extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        height: SizeConfig.height(15),
        color: CustomColors.main_dark,
        child: Row(
          children: <Widget>[
            SizedBox(width: SizeConfig.width(3)),
            FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => MainPage(),
                    ),
                  );
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0)),
                child: Image.asset(
                  '/images/logo_hse.png',
                  width: 100,
                  height: 100,
                )),
            SizedBox(width: SizeConfig.width(6)),
            FlatButton(
                color: Color(0x00000000),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => SimulatorPage(),
                    ),
                  );                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  'Simulator',
                  style: TextStyle(
                      fontSize: SizeConfig.height(4.5),
                      color: CustomColors.main_light),
                )),
            SizedBox(width: SizeConfig.width(3)),
            FlatButton(
                color: Color(0x00000000),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => GeneratorPage(),
                    ),
                  );                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  'XML Generator',
                  style: TextStyle(
                      fontSize: SizeConfig.height(4.5),
                      color: CustomColors.main_light),
                )),
            SizedBox(width: SizeConfig.width(35)),
            FlatButton(
                color: Color(0x00000000),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => AboutPage(),
                    ),
                  );                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: SizeConfig.height(4.5),
                      color: CustomColors.main_light),
                )),
          ],
        ));
  }
}
