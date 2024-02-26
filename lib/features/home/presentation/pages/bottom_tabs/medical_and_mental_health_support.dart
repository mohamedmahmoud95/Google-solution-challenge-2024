import 'package:flutter/material.dart';
import '../../../../../core/reusable widget/cards/feature_card.dart';
import '../../../../../core/utils/app_images.dart';
class MedicalAndMentalHealthSupport extends StatelessWidget {
  const MedicalAndMentalHealthSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
    child: Center(
      child: Wrap(
        children: [
          FeatureCard(
            title: 'Mental health support',
            imageUrl: AppImages.mentalHealthSupport,
            onClicked: () {
              Navigator.of(context)
                  .pushNamed('mentalHealthSupport');
            },
          ),
          FeatureCard(
            title: 'Medical support',
            imageUrl: AppImages.medical,
            onClicked: () {
              Navigator.of(context)
                  .pushNamed('OfflineResourcesScreen');
            },
          ),
        ],
      ),),
    );
  }
}
