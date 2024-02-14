import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/scan_lost_or_found_person_cubit/scan_lost_or_found_person_cubit.dart';
import '../widgets/lost_person_id_compact_view.dart';
import '../widgets/lost_person_id_expanded_view.dart';
import '../widgets/search_bar.dart';

class FoundTab extends StatefulWidget {
  bool compactMode;
  FoundTab({super.key, required this.compactMode});

  @override
  State<FoundTab> createState() => _FoundTabState();
}

class _FoundTabState extends State<FoundTab> {
  @override
  void initState() {
    BlocProvider.of<ScanLostOrFoundPersonCubit>(context)
        .scanForLostOrFoundPerson(image: null, isLostPerson: false);

    super.initState();
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
