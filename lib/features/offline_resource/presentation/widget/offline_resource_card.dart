import 'package:flutter/cupertino.dart';
import '../../../../core/reusable widget/cards/horizontal_card_widget.dart';
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
          imageUrl: offlineResource.imageUrl,
          onTap: () {
            Navigator.of(context).pushNamed('OfflineResourceDetailsScreen',
                arguments: offlineResource);
          },
        ));
  }
}
