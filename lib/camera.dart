import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';



//Future<Null> main() async {
//  cameras = await availableCameras();
//  runApp(new CameraApp());
//}

class CameraApp extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraApp(this.cameras);

  @override
  State createState() {
    return new _CameraAppState(cameras);
  }


//  @override
//  _CameraAppState createState() =>
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  List<CameraDescription> cameras;

  _CameraAppState(this.cameras);

  @override
  void initState() {
    super.initState();
    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new AspectRatio(
        aspectRatio:
        controller.value.aspectRatio,
        child: new CameraPreview(controller));
  }
}