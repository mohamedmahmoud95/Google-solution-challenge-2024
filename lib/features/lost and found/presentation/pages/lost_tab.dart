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
  bool compactMode;
  LostTab({super.key, required this.compactMode});

  @override
  State<LostTab> createState() => _LostTabState();
}

class _LostTabState extends State<LostTab> {
  @override
  void initState() {
    BlocProvider.of<ScanLostOrFoundPersonCubit>(context)
        .scanForLostOrFoundPerson(image: null, isLostPerson: true);
    super.initState();
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
                  const CustomSearchBar(),
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
              return Center(
                child: Text("error"),
              );
            } else {
              //raslan please put the loading ui here :)

              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
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
