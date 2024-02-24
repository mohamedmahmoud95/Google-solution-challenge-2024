import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? userImage;
  final imagePicker = ImagePicker();

  pickImage(source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    setState(() {
      userImage = File(image.path);
    });
  }

  Future<List<XFile>?> pickImageMulti() async {
    final images = await ImagePicker().pickMultiImage();
    if (images.isEmpty) return null;
    return images;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Face Recognition Demo',
          style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontFamily: GoogleFonts.openSans().fontFamily),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          userImage != null
              ? SizedBox(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.3,
                  child: Image.file(
                    userImage!,
                    fit: BoxFit.scaleDown,
                  ))
              : const Icon(
                  Icons.image,
                  size: 200,
                ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 36, 39, 39),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () async {
                await pickImage(ImageSource.gallery);
              },
              child: Text("Pick Image",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.openSans().fontFamily))),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          userImage != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 39, 39),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              // // showLoadingDialog(context, 'Uploading Image');
                              // await uploadImage(userImage,'assets/models/mobileFaceNet.tflite', 192, 112, basename(userImage!.path).split('.')[0]);
                              // Navigator.pop(context);
                            },
                            child: Text("Upload Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 36, 39, 39),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () async {
                              // // showLoadingDialog(context, 'Scanning For Image');
                              // List<Map>? userResults = await scanForImage(userImage,'assets/models/mobileFaceNet.tflite', 192, 112);
                              // if(userResults == null){
                              //   Navigator.pop(context);
                              //   showErrorDialog(context, 'Erro During Scan For Image', 32);
                              //   return;
                              // }
                              // Navigator.pop(context);
                              // Navigator.pushNamed(context, '/results', arguments: userResults);
                            },
                            child: Text("Scan Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily))),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 36, 39, 39),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () async {
                          // List<XFile>? images = await pickImageMulti();
                          // if (images == null) return;
                          // showLoadingDialog(context, 'Uploading Images');
                          // await multiUpload(
                          //     'assets/models/mobileFaceNet.tflite',
                          //     images,
                          //     192,
                          //     112);
                          // Navigator.pop(context);
                        },
                        child: Text("Pick and Upload Multiple",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily:
                                    GoogleFonts.openSans().fontFamily))),
                  ],
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}