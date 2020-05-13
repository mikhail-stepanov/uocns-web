import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uocns_web/global/custom_colors.dart';
import 'package:uocns_web/global/globals.dart';
import 'package:uocns_web/global/size_config.dart';
import 'package:uocns_web/header/bottom.dart';
import 'package:uocns_web/header/header.dart';

class GeneratorPage extends StatefulWidget {
  GeneratorPage({Key key, this.title}) : super(key: key);
  final String title;

  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  String topologyType = 'mesh';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _columnsController = TextEditingController();
  final TextEditingController _injectionRateController =
      TextEditingController();
  final TextEditingController _rowsController = TextEditingController();
  final TextEditingController _nodeController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
          SizedBox(height: SizeConfig.height(4)),
          Container(
            padding: EdgeInsets.only(
                left: SizeConfig.width(42), right: SizeConfig.width(13)),
            child: Text(
              'XML Generator',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizeConfig.height(5),
                  color: CustomColors.fisk_eyes),
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
                      color: CustomColors.text_grey),
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
                      color: CustomColors.text_grey),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.width(25),
                          right: SizeConfig.width(13)),
                      child: DropdownButton<String>(
                        value: topologyType,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 30,
                        elevation: 0,
                        style: TextStyle(
                          color: CustomColors.text_grey,
                        ),
                        underline: Container(
                          height: 2,
                          color: CustomColors.fisk_eyes,
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
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.fisk_eyes,
                        controller: _nameController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.fisk_eyes, width: 2),
                          ),
                          hintText: 'name',
                          fillColor: CustomColors.main_light,
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.main_dark),
                      )),
                  SizedBox(height: SizeConfig.height(0.5)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.fisk_eyes,
                        controller: _descriptionController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.fisk_eyes, width: 2),
                          ),
                          hintText: 'description',
                          fillColor: CustomColors.main_light,
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.main_dark),
                      )),
                  SizedBox(height: SizeConfig.height(0.5)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.fisk_eyes,
                        controller: _injectionRateController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.fisk_eyes, width: 2),
                          ),
                          hintText: 'injection rate',
                          fillColor: CustomColors.main_light,
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.main_dark),
                      )),
                  SizedBox(height: SizeConfig.height(0.5)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.fisk_eyes,
                        controller: _rowsController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.fisk_eyes, width: 2),
                          ),
                          hintText: 'rows',
                          fillColor: CustomColors.main_light,
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.main_dark),
                      )),
                  SizedBox(height: SizeConfig.height(0.5)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.fisk_eyes,
                        controller: _columnsController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.fisk_eyes, width: 2),
                          ),
                          hintText: 'columns',
                          fillColor: CustomColors.main_light,
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.main_dark),
                      )),
                  SizedBox(height: SizeConfig.height(0.5)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(22),
                      padding: EdgeInsets.only(left: SizeConfig.width(12.5)),
                      child: TextFormField(
                        cursorColor: CustomColors.fisk_eyes,
                        controller: _nodeController,
                        decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.fisk_eyes, width: 2),
                          ),
                          hintText: 'nodes',
                          fillColor: CustomColors.main_light,
                          filled: true,
                          contentPadding:
                              new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                        ),
                        style: TextStyle(
                            fontSize: SizeConfig.height(2),
                            color: CustomColors.main_dark),
                      )),
                  SizedBox(height: SizeConfig.height(4)),
                  Container(
                      height: SizeConfig.height(4.0),
                      width: SizeConfig.width(26),
                      padding: EdgeInsets.only(left: SizeConfig.width(13)),
                      child: FloatingActionButton(
                        backgroundColor: CustomColors.fisk_eyes,
                        onPressed: () {
                          fetchData();
                        },
                        child: Text(
                          'start simulation',
                          style: TextStyle(
                            color: CustomColors.main_light,
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
                  height: SizeConfig.height(40.0),
                  width: SizeConfig.width(40),
                  padding: EdgeInsets.only(
                      left: SizeConfig.width(3), right: SizeConfig.width(5)),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: CustomColors.fisk_eyes,
                    controller: _resultController,
                    decoration: new InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColors.fisk_eyes, width: 2),
                      ),
                      hintText: 'please waiting about 1-2 minute for result',
                      fillColor: CustomColors.main_light,
                      filled: true,
                      contentPadding:
                          new EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
                    ),
                    style: TextStyle(
                        fontSize: SizeConfig.height(2),
                        color: CustomColors.main_dark),
                  )),
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

  fetchData() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    String destInjectionRate = _injectionRateController.text;
    String columns = _columnsController.text;
    String rows = _rowsController.text;
    String nodes = _resultController.text;

    final res = await http.post(Globals.host + '/xml/' + topologyType,
        headers: {
          'Accept': 'application/json; charset=utf-8',
          'Content-Type': 'application/json; charset=utf-8'
        },
        body: jsonEncode({
          'name': name,
          'description': description,
          'destInjectionRate': double.parse(destInjectionRate),
          'columns': int.parse(columns),
          'rows': int.parse(rows),
          'nodes': int.parse(nodes)
        }));

    if (res.statusCode == 200) {
      var v = json.decode(res.body);
      setState(() {
        _resultController.text = v['content'];
      });
    }
  }
}
