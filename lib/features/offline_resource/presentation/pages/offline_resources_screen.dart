import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/cards/card_widget.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';

class OfflineResourcesScreen extends StatefulWidget {
  const OfflineResourcesScreen({super.key});

  @override
  State<OfflineResourcesScreen> createState() => _OfflineResourcesScreenState();
}

class _OfflineResourcesScreenState extends State<OfflineResourcesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Emergency resources".tr()),
      ),

      body: SingleChildScrollView(

        child: Wrap(
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            emergencyNumbersCard(),
            firstAidsCard(),

          ],
        ),
      ),
    );
  }

  Widget emergencyNumbersCard(){
    return CardWidget(title: "Emergency contacts".tr(),
    imageUrl: AppImages.emergency_contact3,
    onClicked: (){
      Navigator.of(context).pushNamed('EmergencyContactsScreen');
    },);
  }


  Widget firstAidsCard(){
    return CardWidget(title: "First aids".tr(),
      imageUrl: AppImages.first_aids,
      onClicked: (){
        Navigator.of(context).pushNamed('FirstAidsScreen');
      },);
  }
}
