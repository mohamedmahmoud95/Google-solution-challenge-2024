import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/widget/one_offline_resource_step_card.dart';

class OfflineResourceDetailsScreen extends StatelessWidget {
  final OfflineResource offlineResource;
  const OfflineResourceDetailsScreen({super.key, required this.offlineResource});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(offlineResource.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(offlineResource.title),
            const SizedBox(height: 10,),
            ...offlineResource.offlineResourceSteps.map((step) => OneOfflineResourceStepCard(step)),
          ],
        ),
      ),
    );
  }
}