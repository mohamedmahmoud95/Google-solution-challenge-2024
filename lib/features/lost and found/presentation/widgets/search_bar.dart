import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/dialogs/alert_dialog.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/app_colors.dart';
import 'dart:io';

class LostAndFoundSearchBar extends StatelessWidget {
  final Function(File? img) getImage;
  final Function(String) searchText;
  const LostAndFoundSearchBar({super.key, required this.getImage,required this.searchText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          onFieldSubmitted: (value) {
            searchText(value);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: "search...",
            prefixIcon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            suffixIcon: InkWell(
                onTap: () async {
                  await showInformationDialog(context, 'Uploads must be in JPEG, JPG, or PNG format\n and feature only one person', 13.0);
                  File? image = await pickImage(ImageSource.gallery);
                  getImage(image);
                },
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                        height: 10,
                        child: Image.asset("assets/images/face_scan.png")))),
          ),
        ),
      ),
    );
  }
}
