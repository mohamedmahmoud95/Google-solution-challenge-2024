import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/cards/card_widget.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/cards/horizontal_card.dart';

import '../../domain/entities/offline_resource.dart';

class OfflineResourceCard extends StatelessWidget {
  final OfflineResource offlineResource;
  const OfflineResourceCard({super.key, required this.offlineResource});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('OfflineResourceDetailsScreen');
        },
        child: HorizontalCard(
          title: offlineResource.title,
          imageUrl: offlineResource.steps.first.imageLink, onTap: (){
            Navigator.of(context).pushNamed('OfflineResourceDetailsScreen', arguments: offlineResource);
        },
        ));
  }
}
