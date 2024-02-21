import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/widget/offline_resource_card.dart';

import '../../dummy_data/dummy_data.dart';

class FirstAidsScreen extends StatefulWidget {
  const FirstAidsScreen({super.key});

  @override
  State<FirstAidsScreen> createState() => _FirstAidsScreenState();
}

class _FirstAidsScreenState extends State<FirstAidsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First aids".tr()),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            ...dummyOfflineResources.map((offlineResource) => OfflineResourceCard(offlineResource: offlineResource)),
          ],
        ),
      ),
    );
  }


}
