import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/widget/one_offline_resource_step_card.dart';

import '../../../../core/utils/image_utilities.dart';

class OfflineResourceDetailsScreen extends StatelessWidget {
  final OfflineResource offlineResource;
  const OfflineResourceDetailsScreen(
      {super.key, required this.offlineResource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          offlineResource.title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            generalInfo(context),
            const SizedBox(
              height: 10,
            ),
            ...offlineResource.offlineResourceSteps.map((step) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: OneOfflineResourceStepCard(step))),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget generalInfo(BuildContext context) {
    ImageProvider<Object>? imageProvider =
        ImageUtils.getImage(offlineResource.imageUrl);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: [
            offlineResource.imageUrl == null
                ? const SizedBox()
                : Image(
                    image: imageProvider!,
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(offlineResource.title,
                style: TextStyle(
                  fontSize: 20,
                )),
            const SizedBox(
              height: 5,
            ),
            Text("${offlineResource.generalIntro}"),
          ],
        ),
      ),
    );
  }
}
