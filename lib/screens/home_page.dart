import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/controller/firebase_auth_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  File? _scannedImage;

  bool isImageScanned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Scanner Task'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () async {
                final model = context.read<AuthProvider>();
                await model.signOut();
              },
              child: Text('Sign out'),
            ),
            SizedBox(height: 16,),

            ElevatedButton(
               style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () async {
                await _imgFromCamera();
              },
              child: Text('Scan Image'),
            ),


            Container(
              color: Colors.grey,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
           
              margin: EdgeInsets.all(16),
              child: (isImageScanned == true)?Image.file(_scannedImage!):Text("No image scanned", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            )


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _imgFromCamera() async {
    try {
      final ImagePicker _picker = ImagePicker();
      PickedFile? pickedFile = await _picker.getImage(
     
        imageQuality: 50,
        source: ImageSource.camera,
      );

        if (pickedFile != null) {
       setState(() {
         _scannedImage = File(pickedFile.path);

         isImageScanned = true;
       });
      }
     
    } catch (e) {
      print(e);
    }
  }






}


