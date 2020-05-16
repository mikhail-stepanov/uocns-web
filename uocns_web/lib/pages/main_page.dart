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
      backgroundColor: CustomColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Header(),
          SizedBox(height: SizeConfig.height(2)),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(42), right: SizeConfig.width(13)),
            child: Text(
              'UOCNS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Bebas_Neue",
                  fontSize: SizeConfig.height(15),
                  color: CustomColors.simulator_main),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(37.5), right: SizeConfig.width(13)),
            child: Text(
              'Network on Chip simulator online',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(3.2),
                  color: CustomColors.simulator_dark),
            ),
          ),
          SizedBox(height: SizeConfig.height(4)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(34.8)),
                child: Text(
                  'Simulator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Bebas_Neue",
                      fontSize: SizeConfig.height(4),
                      color: CustomColors.simulator_main),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(16.7)),
                child: Text(
                  'Generator',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Bebas_Neue",
                      fontSize: SizeConfig.height(4),
                      color: CustomColors.simulator_main),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(31)),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              SimulatorPage(),
                        ),
                      );
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: CustomColors.background,
                    hoverColor: CustomColors.button_hover,
                    child: Image.asset(
                      '/images/logo_chip.png',
                      width: 180,
                      height: 205,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(10)),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              GeneratorPage(),
                        ),
                      );
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: CustomColors.background,
                    hoverColor: CustomColors.button_hover,
                    child: Image.asset(
                      '/images/logo_xml.png',
                      width: 180,
                      height: 205,
                    )),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.height(6)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(32)),
                child: Text(
                  'You can use our API to integrate in your own application - ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.grey),
                ),
              ),
              InkWell(
                  hoverColor: CustomColors.link_hover,
                  child: Text(
                    'UOCNS API',
                    style: TextStyle(
                        fontFamily: "Bebas_Neue",
                        fontSize: SizeConfig.height(2.8),
                        color: CustomColors.generator_main),
                  ),
                  onTap: () => launch('http://miem-uocns.ru/swagger-ui.html'))
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(39)),
                child: Text(
                  'Or you can deploy your own server - ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.grey),
                ),
              ),
              InkWell(
                  hoverColor: CustomColors.link_hover,
                  child: Text(
                    'GitHub',
                    style: TextStyle(
                        fontFamily: "Bebas_Neue",
                        fontSize: SizeConfig.height(2.8),
                        color: CustomColors.generator_main),
                  ),
                  onTap: () =>
                      launch('https://github.com/mikhail-stepanov/uocns')),
            ],
          ),
          SizedBox(height: SizeConfig.height(4)),
          Container(
              padding: EdgeInsets.only(bottom: SizeConfig.height(0)),
              child: Bottom()),
        ],
      ),
    );
  }
}
