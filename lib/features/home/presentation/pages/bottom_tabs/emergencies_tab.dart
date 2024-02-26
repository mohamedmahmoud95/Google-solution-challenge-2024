import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/reusable widget/cards/card_widget.dart';
import '../../../../../core/utils/app_images.dart';

class EmergencyTab extends StatelessWidget {
  const EmergencyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
    child: Center(
      child: Wrap(
        children: [

     CardWidget(title: "Emergency contacts".tr(),
    imageUrl: AppImages.emergency_contact,
    onClicked: (){
    Navigator.of(context).pushNamed('EmergencyContactsScreen');
    },),




       CardWidget(title: "First aids".tr(),
        imageUrl: AppImages.first_aids,
        onClicked: (){
          Navigator.of(context).pushNamed('FirstAidsScreen');
        },),


        ],
      ),),
    );

  }
}
