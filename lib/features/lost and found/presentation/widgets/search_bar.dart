import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

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
            prefixIcon: const Icon(Icons.search_sharp),
            suffixIcon: const Icon(Icons.image_search_rounded),
          ),
        ),
      ),
    );
  }
}
