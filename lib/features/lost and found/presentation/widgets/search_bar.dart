import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../services.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        child: TextFormField(
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
            prefixIcon: const Icon(FontAwesomeIcons.magnifyingGlass,),
            suffixIcon: InkWell (
                onTap:(){
                  getImage();
                //  pickImage();
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
