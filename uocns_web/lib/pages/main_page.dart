import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/size_config.dart';
import 'package:uocns_web/header/bottom.dart';
import 'package:uocns_web/header/header.dart';
import 'package:uocns_web/pages/generator_page.dart';
import 'package:uocns_web/pages/simulator_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: CustomColors.main_light,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(),
          SizedBox(height: SizeConfig.height(5)),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(25.5), right: SizeConfig.width(13)),
            child: Text(
              'UOCNS - NoC (Network on Chip) simulator online',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(4),
                  color: CustomColors.text_grey),
            ),
          ),
          SizedBox(height: SizeConfig.height(2)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(25)),
                child: Text(
                  'You can use our API to integrate in your own application -',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(3),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' UOCNS API',
                    style: TextStyle(
                        fontSize: SizeConfig.height(3),
                        color: CustomColors.fisk_eyes),
                  ),
                  onTap: () => launch('http://miem-uocns.ru/swagger-ui.html'))
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(34)),
                child: Text(
                  'Or you can deploy your own server -',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(3),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' GitHub',
                    style: TextStyle(
                        fontSize: SizeConfig.height(3),
                        color: CustomColors.fisk_eyes),
                  ),
                  onTap: () =>
                      launch('https://github.com/mikhail-stepanov/uocns')),
            ],
          ),
          SizedBox(height: SizeConfig.height(5)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(32)),
                child: Text(
                  'Simulator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(4),
                      color: CustomColors.main_dark),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(12)),
                child: Text(
                  'XML Generator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(4),
                      color: CustomColors.main_dark),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(29.5)),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => SimulatorPage(),
                        ),
                      );                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    color: CustomColors.main_light,
                    child: Image.asset(
                      '/images/logo_chip.png',
                      width: 200,
                      height: 200,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(9)),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => GeneratorPage(),
                        ),
                      );                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    color: CustomColors.main_light,
                    child: Image.asset(
                      '/images/logo_xml.png',
                      width: 170,
                      height: 170,
                    )),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.height(15)),
          Container(
              padding: EdgeInsets.only(bottom: SizeConfig.height(0)),
              child: Bottom()),
        ],
      ),
    );
  }
}
