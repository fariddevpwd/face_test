import 'dart:io';

//import 'package:camera/camera.dart';
import 'package:face_test/qr.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class verification extends StatefulWidget {
  const verification({super.key});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification>  {
  Map mob = {};
  final _formKey = GlobalKey<FormState>();
  final _rollController = TextEditingController();
  @override
  Widget build(BuildContext c)  {
    dynamic img;
    var iPath="assets/uk.png";
    mob = ModalRoute.of(context)!.settings.arguments as Map;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Face verification system"),
          leading: InkWell(
            onTap: () {
              Navigator.pop(c);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
        ),
        body:

        Column(
          children: [

            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _rollController,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Roll ',
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async {
                    final result =
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QRViewExample(),
                    ));
                    _rollController.text = result;
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text(''),
                )
              ],
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    var roll = int.parse(_rollController.text);
                    _rollController.text = (--roll).toString();
                  },
                  label: const Text('Previous'),
                  icon: const Icon(Icons.skip_previous),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 2.5),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {
                      var roll = int.parse(_rollController.text);
                      _rollController.text = (++roll).toString();
                    },
                    label: const Text('Next'),
                    icon: const Icon(Icons.skip_next),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed:  ()async {
                   img = await ImagePicker().pickImage(source:ImageSource.camera,imageQuality: 20);
                  if (img != null) {
                    //GallerySaver.saveImage(img!.path);
                    setState(() {
                      iPath=img.path;
                      getImagePath(iPath);
                    });
                  }
                }, icon: Icon(Icons.camera_alt)),
                getImagePath(iPath),
              ],
            )
          ],
        ),
      ),
    );
  }

   getImagePath(String iPath)  {
    if(iPath.contains("asset"))
    return Image.asset(iPath,width: 150,height: 150,);
    else
      return Image.file(File(iPath),width: 150,height: 150,);

  }
}

