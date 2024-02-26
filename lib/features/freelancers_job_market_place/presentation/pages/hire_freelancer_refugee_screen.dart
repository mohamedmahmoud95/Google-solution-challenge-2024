import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/reusable%20widget/text_fields_and_search_bar/search_bar.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/freelancers_job_market_place/presentation/widget/skill_card.dart';
import 'package:hive/hive.dart';
import 'package:line_icons/line_icons.dart';

import '../../domain/dummy_data.dart';
import '../widget/freelancer_card.dart';

class HireFreelancerRefugeeScreen extends StatefulWidget {
  const HireFreelancerRefugeeScreen({super.key});

  @override
  State<HireFreelancerRefugeeScreen> createState() => _HireFreelancerRefugeeScreenState();
}

class _HireFreelancerRefugeeScreenState extends State<HireFreelancerRefugeeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hire a freelancer refugee"),
      ),
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
           CustomSearchBar(textEditingController: searchController, hintText: 'search by skill...',
              suffix:  const Icon(LineIcons.filter, size: 30, weight: 1,),
             ),

              listOfSkills(),
              ...freelancers.map((freelancer) => FreelancerCard(freelancer: freelancer,)),
            ],
          ),
        ),
      ),

    );
  }

  Widget listOfSkills() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          ...skills.map((skill) => SkillCard(skill: skill,)),

        ],
      ),
    );
  }
}
