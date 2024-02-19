import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/manager/scan_lost_or_found_person_cubit/scan_lost_or_found_person_cubit.dart';

import '../../../../config/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/lost_or_found_person.dart';
import '../widgets/lost_person_id_compact_view.dart';
import '../widgets/lost_person_id_expanded_view.dart';
import '../widgets/search_bar.dart';

class LostTab extends StatefulWidget {
  final bool compactMode;
  const LostTab({super.key, required this.compactMode});

  @override
  State<LostTab> createState() => _LostTabState();
}

class _LostTabState extends State<LostTab> {
  String? textToSearchBy;

  @override
  void initState() {
    BlocProvider.of<ScanLostOrFoundPersonCubit>(context)
        .scanForLostOrFoundPerson(
            image: image, isLostPerson: true, textToSearchBy: textToSearchBy);
    super.initState();
  }

  File? image;

  void getImage(File? image) {
    setState(() {
      image = image;
      BlocProvider.of<ScanLostOrFoundPersonCubit>(context)
          .scanForLostOrFoundPerson(
              image: image, isLostPerson: true, textToSearchBy: textToSearchBy);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
            BlocBuilder<ScanLostOrFoundPersonCubit, ScanLostOrFoundPersonState>(
          builder: (context, state) {
            if (state is ScanLostOrFoundPersonLoaded) {
              return Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  CustomSearchBar(
                    getImage: getImage,
                    searchText: (text) {
                      setState(() {
                        textToSearchBy = text;
                      });
                    },
                  ),
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
                    SizedBox(
                      height: 50,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            AppColors.oliveGreen3, //Theme.of(context).primaryColorDark,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.addNewLostOrFoundPerson,
            arguments: LostOrFound.lost,
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
