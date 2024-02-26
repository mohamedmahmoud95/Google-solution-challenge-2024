import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/features/freelancers_job_market_place/domain/entity/skill.dart';

import '../../../../core/reusable widget/buttons/rectangular_button_widget.dart';
import '../../../../core/utils/app_colors.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;
  const SkillCard({required this.skill, super.key});

  @override
  Widget build(BuildContext context) {
    return  RectangularButton(onTap: (){}, text: skill.name, horizontalPadding: 20, backgroundColor: AppColors.oliveGreen2,
    );

  }
}

