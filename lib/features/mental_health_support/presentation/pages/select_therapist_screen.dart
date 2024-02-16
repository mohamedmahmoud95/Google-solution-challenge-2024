import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/manager/get_professionals_cubit/get_professionals_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/widget/therapist_card.dart';
import '../../domain/entities/professional.dart';

class SelectTherapistScreen extends StatefulWidget {
  const SelectTherapistScreen({super.key});

  @override
  State<SelectTherapistScreen> createState() => _SelectTherapistScreenState();
}

class _SelectTherapistScreenState extends State<SelectTherapistScreen> {

  @override
  void initState(){
    super.initState();
    BlocProvider.of<GetProfessionalsCubit>(context).getAllProfessionals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a therapist'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetProfessionalsCubit>().getAllProfessionals();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
