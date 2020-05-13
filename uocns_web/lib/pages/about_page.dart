import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/size_config.dart';
import 'package:uocns_web/header/bottom.dart';
import 'package:uocns_web/header/header.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);
  final String title;

  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                left: SizeConfig.width(20), right: SizeConfig.width(20)),
            child: Text(
              'NoC (Network on Chip) simulator that allows you to conduct simulations online based on the network topology and its parameters.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(2.5),
                  color: CustomColors.text_grey),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(33), right: SizeConfig.width(20)),
            child: Text(
              'Supported model topologies - mesh, torus and circulant.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(2.5),
                  color: CustomColors.text_grey),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(35), right: SizeConfig.width(20)),
            child: Text(
              'Simulator written in Java 11 with Spring Framework.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(2.5),
                  color: CustomColors.text_grey),
            ),
          ),
          SizedBox(height: SizeConfig.height(2)),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(20), right: SizeConfig.width(20)),
            child: Text(
              'This application is the final work of the bachelor Mikhail Stepanov, a student of the educational program "Informatics and Computer Engineering" MIEM NRU HSE under the supervision of Associate Professor of Computer Engineering Alexander Romanov.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(2.5),
                  color: CustomColors.text_grey),
            ),
          ),
          SizedBox(height: SizeConfig.height(5)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(34)),
                child: Text(
                  'API described in Swagger 2 - ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' UOCNS API',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.5),
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
                  'Repository with source code -',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' GitHub',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.5),
                        color: CustomColors.fisk_eyes),
                  ),
                  onTap: () =>
                      launch('https://github.com/mikhail-stepanov/uocns')),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(34)),
                child: Text(
                  'Documentation of classes and methods -',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' JavaDoc',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.5),
                        color: CustomColors.fisk_eyes),
                  ),
                  onTap: () =>
                      launch('http://miem-uocns.ru/doc/index.html')),
            ],
          ),
          SizedBox(height: SizeConfig.height(4)),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(45), right: SizeConfig.width(25)),
            child: Text(
              'Contacts',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(3),
                  color: CustomColors.main_dark),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(32)),
                child: Text(
                  'Romanov Alexander, associate professor: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' a.romanov@hse.ru',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.5),
                        color: CustomColors.fisk_eyes),
                  ),
                  onTap: () =>
                      launch('a.romanov@hse.ru')),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: SizeConfig.width(32)),
                child: Text(
                  'Stepanov Mikhail, student: ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(2.5),
                      color: CustomColors.text_grey),
                ),
              ),
              InkWell(
                  child: Text(
                    ' mastepanov@edu.hse.ru',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2.5),
                        color: CustomColors.fisk_eyes),
                  ),
                  onTap: () =>
                      launch('mastepanov@edu.hse.ru')),
            ],
          ),
          SizedBox(height: SizeConfig.height(10)),
          Container(
              padding: EdgeInsets.only(bottom: SizeConfig.height(0)),
              child: Bottom()),
        ],
      ),
    );
  }
}
