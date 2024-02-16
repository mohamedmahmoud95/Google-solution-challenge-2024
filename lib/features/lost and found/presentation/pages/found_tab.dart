import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';

import '../../../../config/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/scan_lost_or_found_person_cubit/scan_lost_or_found_person_cubit.dart';
import '../widgets/lost_person_id_compact_view.dart';
import '../widgets/lost_person_id_expanded_view.dart';
import '../widgets/search_bar.dart';

class FoundTab extends StatefulWidget {
  final bool compactMode;
  const FoundTab({super.key, required this.compactMode});

  @override
  State<FoundTab> createState() => _FoundTabState();
}

class _FoundTabState extends State<FoundTab> {
  @override
  void initState() {
    BlocProvider.of<ScanLostOrFoundPersonCubit>(context)
        .scanForLostOrFoundPerson(image: image, isLostPerson: false);

    super.initState();
  }

  File? image;

  void getImage(File? image){
    setState(() {
      image = image;
      BlocProvider.of<ScanLostOrFoundPersonCubit>(context)
        .scanForLostOrFoundPerson(image: image, isLostPerson: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<ScanLostOrFoundPersonCubit,
              ScanLostOrFoundPersonState>(
            builder: (context, state) {
              if (state is ScanLostOrFoundPersonLoaded) {
                return Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    const SizedBox(height: 5,),
                    CustomSearchBar(getImage: getImage,),
                    ...state.lostOrFoundPersons
                        .map(
                          (person) => widget.compactMode
                              ? LostPersonIdCompactView(
                                  person: person,
                                )
                              : LostPersonIdExpandedView(
                                  person: person,
                                ),
                        )
                        .toList(),
                  ],
                );
              } else if (state is ScanLostOrFoundPersonError) {
                //raslan please put the error ui here :)
                return const Center(
                  child: Text("error"),
                );
              } else {
                //raslan please put the loading ui here :)
                return const Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.oliveGreen3,//Theme.of(context).primaryColorDark,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.addNewLostOrFoundPerson,
            arguments: LostOrFound.found,
          );
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}