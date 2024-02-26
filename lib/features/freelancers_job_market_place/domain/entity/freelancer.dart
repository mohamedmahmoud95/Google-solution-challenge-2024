
import 'package:google_solution_challenge_2024/features/freelancers_job_market_place/domain/entity/skill.dart';

class Freelancer{
  String? id;
  String? name;
  String? jobTitle;
  String? bio;
  String? imageUrl;
  String? location;
  double? rating;
  List<Skill?>? skills;

  Freelancer({
    this.id,
    this.name,
    this.imageUrl,
    this.jobTitle,
    this.bio,
    this.location,
    this.skills,
    this.rating,
});
}


