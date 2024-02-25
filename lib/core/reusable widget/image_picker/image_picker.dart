import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  File? imageFile;

   ImagePickerWidget({super.key, this.imageFile});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          File? tempImage = await getImage();
          setState(() {
            widget.imageFile = tempImage;
          });
        },
        child:
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      radius: 100,
                      backgroundColor: AppColors.oliveGreen1,
                      child: widget.imageFile == null ?  CircleAvatar(
                        radius: 85,
                        backgroundImage: AssetImage(AppImages.profile),
                        backgroundColor: AppColors.oliveGreen1,
                      ):
                      CircleAvatar(
                        radius: 95,
                        backgroundImage: FileImage(widget.imageFile!),
                        backgroundColor: AppColors.oliveGreen1,
                      )
                  ),
                  const CircleAvatar(
                    radius: 23,
                    backgroundColor: Color.fromARGB(255, 110, 109, 109),
                    child: Icon(
                      color: AppColors.appleWhite,
                      Icons.camera_alt_rounded,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
}
