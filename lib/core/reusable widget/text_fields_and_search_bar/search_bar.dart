import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/app_colors.dart';
import 'dart:io';

class CustomSearchBar extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final Function? onPrefixIconPressed;
  final Function? onSuffixIconPressed;
  final Function? onFieldSubmitted;
  final TextEditingController textEditingController;
  final double? width;

  final String? hintText;
  const CustomSearchBar(
      {super.key,
        required this.textEditingController,
      this.prefix,
      this.suffix,
      this.onPrefixIconPressed,
      this.onSuffixIconPressed,
      this.onFieldSubmitted,
      this.hintText, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: width?? double.infinity,
        child: TextFormField(
          controller: textEditingController,
          onFieldSubmitted: (value) {
            if (onFieldSubmitted != null) {
              onFieldSubmitted!();
            }
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
            hintText: hintText ?? "search...",
            prefixIcon: prefix != null
                ? GestureDetector(
                    onTap: () {
                      if (onSuffixIconPressed != null) {
                        onSuffixIconPressed!();
                      }
                    },
                    child: prefix,
                  )
                : const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                  ),
            suffixIcon: suffix != null
                ? GestureDetector(
                    onTap: () {
                      if (onSuffixIconPressed != null) {
                        onSuffixIconPressed!();
                      }
                    },
                    child: suffix,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
