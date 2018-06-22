// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:first_flutter_app/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rcg',
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.clear),
                color: Colors.black,
                onPressed: (){
              // TODO return to List if recognized
                })
          ],
          backgroundColor: new Color.fromARGB(0, 0, 0, 0), // transparent Toolbar
          elevation: 0.0,
        ),
        body: HelloRectangle(),
      ),
    ),
  );
}

class HelloRectangle extends StatelessWidget {

  File _image;

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);

    setState(){
      _image = image;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 56.0),
            child: new Text(
              'Recognize Car',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                fontFamily: 'Questrial'
              ),
            ),
          ),
          new Expanded(child:
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(bottom: 32.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new IconButton(
                          icon: new Icon(Icons.camera),
                          tooltip: 'Live camera',
                          iconSize: 36.0,
                          onPressed: (){
                            getCamera(context);
                          },
                        ),
                        new Text('Live camera')
                      ],
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: new Icon(Icons.camera_enhance),
                            tooltip: 'Take picture',
                            iconSize: 36.0,
                            onPressed: (){
                              getImage(ImageSource.camera);
                            },
                          ),
                          new Text('Take a picture')
                        ],
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                              icon: new Icon(Icons.photo),
                              iconSize: 36.0,
                              onPressed: (){
                                getImage(ImageSource.gallery);
                              }
                          ),
                          new Text('Take from Gallery')
                        ],
                      )

                    ],
                  ),
              ],)

          )
        ],
      ),
    );
  }
}

Future<Null> getCamera(BuildContext context) async {
  List<CameraDescription> cameras;
  try {
    cameras = await availableCameras();
  } on CameraException catch (e){
//    logError(e.code, e.description);
  }
  Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new CameraApp(cameras))
  );
}

var container = Container(
  color: Colors.purple,
  width: 300.0,
  height: 400.0,
  margin: EdgeInsets.all(12.0),
  child: Column(
    children: <Widget>[
      Text('Hello'),
      Text('Hello'),
      Text('Hello')
    ],
  ),
);