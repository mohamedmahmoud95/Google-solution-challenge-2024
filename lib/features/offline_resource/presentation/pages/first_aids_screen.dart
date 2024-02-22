import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../dummy_data/dummy_data.dart';
import '../widget/offline_resource_card.dart';

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
