import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/buttons/rectangular_button_widget.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/text_fields_and_search_bar/search_bar.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/widgets/category_card.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/first_aids_category.dart';

import '../../dummy_data/dummy_data.dart';
import '../widget/offline_resource_card.dart';

class FirstAidsScreen extends StatefulWidget {
  const FirstAidsScreen({super.key});

  @override
  State<FirstAidsScreen> createState() => _FirstAidsScreenState();
}

class _FirstAidsScreenState extends State<FirstAidsScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First aids".tr()),
      ),

      body: SingleChildScrollView(
        child: Column(
          
          children: [

            Padding(padding: EdgeInsets.all(8), child:
            CustomSearchBar(textEditingController: searchTextEditingController,),),

            listOfCategories(),
            ...dummyOfflineResources.map((offlineResource) => OfflineResourceCard(offlineResource: offlineResource)),
          ],
        ),
      ),

    );
  }
  

  Widget listOfCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
       children: [

         ...listOfFistAidsCategories.map((category) => categoryCard(category)),

       ],
    ),
    );
  }

  Widget categoryCard(FirstAidsCategory category){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: RectangularButton(onTap: (){}, text: category.name, width: 200, backgroundColor: AppColors.oliveGreen2,),
    );
  }


}

