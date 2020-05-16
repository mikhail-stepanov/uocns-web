import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/globals.dart';
import 'package:uocns_web/global/size_config.dart';
import 'package:uocns_web/header/bottom.dart';
import 'package:uocns_web/header/header.dart';

import 'package:http/http.dart' as http;
import 'package:uocns_web/popups/info_popup.dart';

class GeneratorPage extends StatefulWidget {
  GeneratorPage({Key key, this.title}) : super(key: key);
  final String title;

  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  String topologyType = 'mesh';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _columnsController = TextEditingController();
  final TextEditingController _rowsController = TextEditingController();
  final TextEditingController _nodeController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
          SizedBox(height: SizeConfig.height(4)),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(44), right: SizeConfig.width(13)),
            child: Text(
              'XML Generator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Bebas_Neue",
                  fontSize: SizeConfig.height(5),
                  color: CustomColors.simulator_main),
            ),
          ),
          SizedBox(height: SizeConfig.height(3)),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.width(25), right: SizeConfig.width(13)),
                child: Text(
                  'Parameters:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(3),
                      color: CustomColors.generator_main),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.width(18), right: SizeConfig.width(13)),
                child: Text(
                  'Result:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: SizeConfig.height(3),
                      color: CustomColors.generator_main),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.height(1)),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.width(25),
                          right: SizeConfig.width(13)),
                      child: FlatButton(
                          color: Colors.transparent,
                          hoverColor: CustomColors.button_hover,
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            InfoPopup()));
                          },
                          child: Text(
                            'parameters guide',
                            style: TextStyle(
                                fontSize: SizeConfig.height(1.5),
                                color: CustomColors.generator_main),
                          ))),
                  Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.width(25),
                          right: SizeConfig.width(13)),
                      child: DropdownButton<String>(
                        dropdownColor: CustomColors.black,
                        value: topologyType,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 0,
                        style: TextStyle(
                          color: CustomColors.simulator_dark,
                        ),
                        underline: Container(
                          height: 2,
                          color: CustomColors.simulator_main,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            topologyType = newValue;
                          });
                        },
                        items: <String>[
                          'mesh',
                          'torus',
                          'circulant',
                          'circulant/optimal'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  SizedBox(height: SizeConfig.height(1)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.simulator_main,
                        controller: _nameController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.simulator_main, width: 2),
                          ),
                          hintText: 'name',
                          fillColor: CustomColors.background,
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.height(2),
                              color: CustomColors.simulator_dark),
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.simulator_dark),
                      )),
                  SizedBox(height: SizeConfig.height(1)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.simulator_main,
                        controller: _descriptionController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.simulator_main, width: 2),
                          ),
                          hintText: 'description',
                          fillColor: CustomColors.background,
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.height(2),
                              color: CustomColors.simulator_dark),
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.simulator_dark),
                      )),
                  SizedBox(height: SizeConfig.height(1)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.simulator_main,
                        controller: _rowsController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.simulator_main, width: 2),
                          ),
                          hintText: 'rows',
                          fillColor: CustomColors.background,
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.height(2),
                              color: CustomColors.simulator_dark),
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.simulator_dark),
                      )),
                  SizedBox(height: SizeConfig.height(1)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.simulator_main,
                        controller: _columnsController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.simulator_main, width: 2),
                          ),
                          hintText: 'columns',
                          fillColor: CustomColors.background,
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.height(2),
                              color: CustomColors.simulator_dark),
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.simulator_dark),
                      )),
                  SizedBox(height: SizeConfig.height(1)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.simulator_main,
                        controller: _nodeController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.simulator_main, width: 2),
                          ),
                          hintText: 'nodes',
                          fillColor: CustomColors.background,
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.height(2),
                              color: CustomColors.simulator_dark),
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.simulator_dark),
                      )),
                  SizedBox(height: SizeConfig.height(4)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(26),
                      padding: EdgeInsets.only(left: SizeConfig.width(13)),
                      child: FloatingActionButton(
                        backgroundColor: CustomColors.black,
                        onPressed: () {
                          fetchData();
                        },
                        child: Text(
                          'start generation',
                          style: TextStyle(
                            color: CustomColors.generator_main,
                            fontSize: SizeConfig.height(2.5),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      )),
                ],
              ),
              Container(
                  height: SizeConfig.height(50.0),
                  width: SizeConfig.width(45),
                  padding: EdgeInsets.only(
                      left: SizeConfig.width(3), right: SizeConfig.width(5)),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: CustomColors.simulator_main,
                    controller: _resultController,
                    decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: CustomColors.simulator_main, width: 2),
                      ),
                      hintText: 'result will be here',
                      hintStyle: TextStyle(
                          fontSize: SizeConfig.height(2),
                          color: CustomColors.generator_main),
                      fillColor: CustomColors.black,
                      filled: true,
                      contentPadding:
                          new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                    ),
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.generator_main),
                  )),
            ],
          ),
          SizedBox(height: SizeConfig.height(11.5)),
          Container(
              padding: EdgeInsets.only(bottom: SizeConfig.height(0)),
              child: Bottom()),
        ],
      ),
    );
  }

  fetchData() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String columns = _columnsController.text;
    String rows = _rowsController.text;
    String nodes = _nodeController.text;
    final res = await http.post(Globals.host + '/xml/' + topologyType,
        headers: {
          'Accept': 'application/json; charset=utf-8',
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode({
          'name': name,
          'description': description,
          'columns': int.parse(columns),
          'rows': int.parse(rows),
          'nodes': int.parse(nodes)
        }));
    if (res.statusCode == 200) {
      var v = json.decode(res.body);
      _resultController.text = v['content'];
    }
  }
}
