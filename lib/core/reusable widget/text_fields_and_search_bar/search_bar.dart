import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final Widget? prefix;
  final Widget? suffix;
  final Function? onPrefixIconPressed;
  final Function? onSuffixIconPressed;
  final Function? onFieldSubmitted;
  final TextEditingController textEditingController;

  final String? hintText;
  const CustomSearchBar(
      {super.key,
        required this.textEditingController,
      this.prefix,
      this.suffix,
      this.onPrefixIconPressed,
      this.onSuffixIconPressed,
      this.onFieldSubmitted,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
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
