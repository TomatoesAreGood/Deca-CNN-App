import 'package:deca_app_yolo/pages/homePage.dart';
import 'package:deca_app_yolo/widgets/detectedItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:camera/camera.dart';


class CameraStream extends StatefulWidget {
  const CameraStream({super.key});

  @override
  State<CameraStream> createState() => _CameraStreamState();
}

class _CameraStreamState extends State<CameraStream> {
  late CameraController controller;
  late FlutterVision vision;
  late List<Map<String, dynamic>> yoloResults;
  late List<CameraDescription> camerass;
  
  CameraImage? cameraImage;
  bool isLoaded = false;
  bool isDetecting = false;
  bool isDrawingBoundingBoxes = true;

  double confidenceThreshold = 0.5;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    camerass = await availableCameras();
    vision = FlutterVision();
    controller = CameraController(camerass[0], ResolutionPreset.medium, enableAudio: false);
    controller.initialize().then((value) {
      loadYoloModel().then((value) {
        setState(() {
          isLoaded = true;
          isDetecting = false;
          yoloResults = [];
          startDetection();
        });
      });
    });
  }
  
  @override
  void dispose() async {
    super.dispose();
    controller.dispose();
    await vision.closeYoloModel();
  }

  Future<void> loadYoloModel() async {
    await vision.loadYoloModel(
        labels: 'assets/labels.txt',
        modelPath: 'assets/detectOld.tflite',
        modelVersion: "yolov8",
        numThreads: 1,
        useGpu: true);
    setState(() {
      isLoaded = true;
    });
  }

// Real-time object detection function by yoloOnFrame
  Future<void> yoloOnFrame(CameraImage cameraImage) async {
    final result = await vision.yoloOnFrame(
        bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        iouThreshold: 0.4,
        confThreshold: 0.4,
        classThreshold: 0.5);
    if (result.isNotEmpty) {
      setState(() {
        yoloResults = result;
      });
    }
  }

  Future<void> startDetection() async {
    setState(() {
      isDetecting = true;
    });
    if (controller.value.isStreamingImages) {
      return;
    }
    await controller.startImageStream((image) async {
      if (isDetecting) {
        cameraImage = image;
        yoloOnFrame(image);
      }
    });
  }

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      yoloResults.clear();
    });
  }
  
  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];
    double factorX = screen.width / (cameraImage?.height ?? 1);
    double factorY = screen.height / (cameraImage?.width ?? 1);

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);

    return yoloResults.map((result) {
      double objectX = result["box"][0] * factorX;
      double objectY = result["box"][1] * factorY;
      double objectWidth = (result["box"][2] - result["box"][0]) * factorX;
      double objectHeight = (result["box"][3] - result["box"][1]) * factorY;
      
      return Positioned(
        left: objectX,
        top: objectY,
        width: objectWidth,
        height: objectHeight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} (${(result['box'][4] * 100).toStringAsFixed(2)})",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: const Color.fromARGB(255, 115, 0, 255),
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget toggleBoundingBoxesButton(Size size){
    return Positioned(
        top: 47,
        right:15,
        child: Container(
          child: isDrawingBoundingBoxes
              ? IconButton(
                  onPressed: () async {
                    setState(() {
                      isDrawingBoundingBoxes = false;
                    });
                  },
                  icon: const Icon(
                    Icons.stop,
                    color: Colors.red,
                  ),
                  iconSize: 30,
                )
              : IconButton(
                  onPressed: () async {
                    setState(() {
                      isDrawingBoundingBoxes = true;
                    });
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final Size size = MediaQuery.of(context).size;
    var scale =  size.aspectRatio * controller.value.aspectRatio;
    if (scale < 1) scale = 1 / scale;

    return Scaffold(
      body: Stack(
        children: [
          Transform.scale (
            scale: scale,
            child: Center (child: CameraPreview(controller))
          ),

          isDrawingBoundingBoxes ?
            SizedBox(
              height: size.height,
              width: size.width, 
              child: Stack(
                children: displayBoxesAroundRecognizedObjects(size),
              ),
            )
            : Container(),
          
           Positioned(
            left: 15,
            top: 50,
            child: IconButton(
              onPressed: (){
                Future.wait([stopDetection(), controller.stopImageStream()]).then((value) =>
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())
                ));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
          ),

          toggleBoundingBoxesButton(size),

          DetectedItems(data:yoloResults.map((result)=> int.parse(result['tag'])).toList())
        ],
      ),
    );
  }
}
