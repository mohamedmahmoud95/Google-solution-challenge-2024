import 'package:flutter/material.dart';

import '../../../../../core/reusable widget/cards/feature_card.dart';
import '../../../../../core/utils/app_images.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Center(
     child: FeatureCard(
        title: 'Find a lost person',
        imageUrl: AppImages.faceRecognition,
        onClicked: () {
          Navigator.of(context).pushNamed('lostAndFound');
        },
      ),),
    );
  }
}
