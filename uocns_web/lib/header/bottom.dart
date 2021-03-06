import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Bottom extends StatelessWidget {
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
        height: SizeConfig.height(7),
        child: Row(
          children: <Widget>[
            SizedBox(width: SizeConfig.width(44)),
            Column(
              children: <Widget>[
                Text(
                  'Romanov Aleksandr, Stepanov Mikhail',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(1.4),
                      color: CustomColors.grey),
                ),
                InkWell(
                    hoverColor: CustomColors.link_hover,
                    child: Text(
                      'NRU HSE',
                      style: TextStyle(
                          fontFamily: "Bebas_Neue",
                          fontSize: SizeConfig.height(2),
                          color: CustomColors.generator_main),
                    ),
                    onTap: () => launch('https://www.hse.ru/')),
                Text(
                  'Moscow, 2020',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(1.4),
                      color: CustomColors.grey),
                ),
              ],
            ),
          ],
        ));
  }
}
