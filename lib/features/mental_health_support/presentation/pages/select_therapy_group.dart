import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/open_close_time.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/repo/groups_firestore_repo.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/manager/get_groups_cubit/get_groups_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/widget/group_card.dart';

class SelectTherapyGroupScreen extends StatefulWidget {
  const SelectTherapyGroupScreen({super.key});

  @override
  State<SelectTherapyGroupScreen> createState() => _SelectTherapyGroupScreenState();
}

class _SelectTherapyGroupScreenState extends State<SelectTherapyGroupScreen> {
  

  void addSampleGroup(){
    GroupsFirestoreRepo().addGroup(Group(
        id: "id",
        mentorID: 'id',
        title: 'Habal Group',
        photoUrl: AppImages.raslan.toString(),
        rating: 4.9,
        timeOfSlotes: [OpenCloseTime(id: '1', openTime: TimeOfDay.now(), closeTime: TimeOfDay.now())],
        allAppointeesIds: ['1','2'],
        maximumAppointees: 3
      )
    );
  }


  @override
  void initState(){
    super.initState();
    addSampleGroup();
    BlocProvider.of<GetGroupsCubit>(context).getAllGroups();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a therapy group'),
        actions: [
          IconButton(
            onPressed:(){
              context.read<GetGroupsCubit>().getAllGroups();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<GetGroupsCubit, GetGroupsState>(
        builder: (context, state) {
          if (state is GetGroupsLoading) {

            return Center(child: CircularProgressIndicator());
          } else if (state is GetGroupsLoaded) {

            return ListView.builder(
              itemCount: state.groups.length,
              itemBuilder: (context, index) {
                Group group = state.groups[index];
                return GroupCard(therapyGroup: group);
              },
            );
          } else if (state is GetGroupsError) {

            return const Center(child: Text('Failed to load groups data'));
          } else {

            return const Center(child: Text('No groups data available'));
          }
        },
      ),
    );
  }
}
