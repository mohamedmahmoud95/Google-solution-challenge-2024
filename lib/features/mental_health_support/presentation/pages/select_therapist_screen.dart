import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/manager/get_professionals_cubit/get_professionals_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/widget/therapist_card.dart';
import '../../../../core/utils/app_images.dart';
import '../../domain/entities/professional.dart';
import '../../domain/repo/professionals_firestore_repo.dart';

class SelectTherapistScreen extends StatefulWidget {
  const SelectTherapistScreen({super.key});

  @override
  State<SelectTherapistScreen> createState() => _SelectTherapistScreenState();
}

class _SelectTherapistScreenState extends State<SelectTherapistScreen> {

  @override
  void initState(){
    super.initState();
    ProfessionalsFirestoreRepo().addProfessional(Professional(
        id: "id",
        name: "Mohamed Raslan",
        photoUrl: "${AppImages.raslan.toString()}",
        jobTitle: "PTSD Therapist",
        rating: 4.9,
        timeOfSlotes: [],
        isAvailable: true,
        phoneNumber: "52252252")
    );
    BlocProvider.of<GetProfessionalsCubit>(context).getAllProfessionals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a therapist'),
        actions: [
          IconButton(
    onPressed:(){
    context.read<GetProfessionalsCubit>().getAllProfessionals();
    },
      icon: const Icon(Icons.refresh),),
        ],
      ),
      body: BlocBuilder<GetProfessionalsCubit, GetProfessionalsState>(
        builder: (context, state) {
          if (state is GetProfessionalsLoading) {

            return Center(child: CircularProgressIndicator());
          } else if (state is GetProfessionalsLoaded) {

            return ListView.builder(
              itemCount: state.professionals.length,
              itemBuilder: (context, index) {
                Professional professional = state.professionals[index];
                return TherapistCard(professionalTherapist: professional);
              },
            );
          } else if (state is GetProfessionalsError) {

            return const Center(child: Text('Failed to load professionals data'));
          } else {

            return const Center(child: Text('No professionals data available'));
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.oliveGreen2,
      //   onPressed: () {
      //     context.read<GetProfessionalsCubit>().getAllProfessionals();
      //   },
      //   child: const Icon(Icons.refresh, color: AppColors.white,),
      // ),
    );
  }
}
