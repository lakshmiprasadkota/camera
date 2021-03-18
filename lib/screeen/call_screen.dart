import 'package:camera/camera.dart';
import 'package:cammera_package_exmaple/styles/styles_sheet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class Call extends StatefulWidget {
  Call({this.name, this.img});
  final String img ;
  final String name ;
  XFile imageFile;
  @override
  _CallState createState() => _CallState();
}
class _CallState extends State<Call> {
  List<CameraDescription> cameras;
  CameraController controller;
  void _fetchCam() async{
    cameras = await availableCameras();
    _initCam();
  }
  void _clickAndSaveImage()async {
    final String path = (await getApplicationDocumentsDirectory()).path;

    XFile file = await controller.takePicture();

    setState(() {

    });
    GallerySaver.saveImage(file.path , albumName: path );



  }

  // void _save() async{
  //
  //   GallerySaver.saveImage(imageFile.path ,).then((bool success) {
  //     setState(() {
  //       check = "working fine..............";
  //       print(imageFile);
  //     });
  //   }
  //   );
  // }

  void _initCam(){
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  void _switchFrontCam(){
    var camDirection = controller.description.lensDirection;
    CameraController cameraController;
    CameraDescription camDescription = controller.description;
    if(camDirection==CameraLensDirection.front){
      camDirection=CameraLensDirection.back;
    }
    else
      camDirection=CameraLensDirection.front;
    for(CameraDescription cameraDescription in cameras){
      if(cameraDescription.lensDirection==camDirection){
        camDescription=cameraDescription;
      }
    }
    cameraController=CameraController(camDescription,ResolutionPreset.max);
    setState(() {
      controller=cameraController;
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  void initState(){
    super.initState();
    _fetchCam();
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child:InkWell(
            onTap: _switchFrontCam,
              child: _getCamWidget()) ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 60 , horizontal: 40),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
                    child: CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage(widget.img ,)),
                  ),
                  SizedBox(height: 10,),
                  Text(widget.name, style: TextStyle(color: Colors.white ,

                      fontWeight: FontWeight.bold,fontSize: 24),   overflow: TextOverflow.ellipsis  , maxLines: 1,),
                  SizedBox(height: 6,),
                  Text("Incoming video call", style: callTextStyle),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: FloatingActionButton(
              child: Icon(Icons.camera),
            ),

            // child: Column(
            //
            //   children: [
            //     Text("Swipe up to answer call",style: callTextStyle
            //     ),
            //     SizedBox(height: 14,),
            //     InkWell(
            //       onTap: (){
            //         _clickAndSaveImage();
            //       },
            //       child: Icon(Icons.camera),
            //     ),
            //     SizedBox(height: 14,),
            //     InkWell(
            //       onTap: (){
            //         Navigator.pop(context);
            //       },
            //       child: Text("Swipe down to decline call",style: callTextStyle
            //       ),
            //     )
            //   ],
            // ),
          ),

        ],
      ),
    );
  }
  Widget _getCamWidget(){
    if(controller==null){
      return Container(
        child: Text("wait.."),
      );
    }
    if(!controller.value.isInitialized){
      return Container(
        child: Text("not initialized"),
      );
    }
    return CameraPreview(controller);
  }
}
