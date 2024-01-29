import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(8),
      child:
      TextFormField(

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

        prefix: const Icon(Icons.search_sharp),
        suffix: const Icon(Icons.image_search_rounded),

      ),
      ),

    );
  }
}
