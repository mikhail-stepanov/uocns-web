import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/size_config.dart';

class InfoPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
            backgroundColor: CustomColors.black,
            content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Parameter information:',
                    style: TextStyle(
                        fontSize: SizeConfig.height(3),
                        color: CustomColors.simulator_dark),
                  ),
                  SizedBox(height: SizeConfig.height(1)),
                  Text(
                    'name - string (any value)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  Text(
                    'description - string (any value)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  Text(
                    'injection rate - double (with dot!)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  Text(
                    'rows - integer (only for mesh and torus)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  SizedBox(height: SizeConfig.height(1)),
                  Text(
                    'columns - integer (only for mesh and torus)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  SizedBox(height: SizeConfig.height(1)),Text(
                    'nodes - integer (only for circulant and circulant/optimal)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  SizedBox(height: SizeConfig.height(1)),Text(
                    'first step - integer (only for circulant)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  SizedBox(height: SizeConfig.height(1)),Text(
                    'second step - integer (only for circulant)',
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.simulator_dark),
                  ),
                  SizedBox(height: SizeConfig.height(1)),
                  FlatButton(
                      color: CustomColors.black,
                      hoverColor: CustomColors.button_hover,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'close',
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.generator_main),
                      )),
                ])));
  }
}
