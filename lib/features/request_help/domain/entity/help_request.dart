

import 'package:google_solution_challenge_2024/features/request_help/domain/entity/help_request_category.dart';

class HelpRequest {
  String? id;
  HelpRequestCategory? requestCategory;
  bool? someoneReplied;
  HelpRequest({
    this.id,
    this.requestCategory,
    this.someoneReplied
});

}