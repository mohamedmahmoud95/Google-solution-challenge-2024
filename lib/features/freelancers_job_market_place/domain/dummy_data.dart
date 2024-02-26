import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/freelancers_job_market_place/domain/entity/freelancer.dart';
import 'package:google_solution_challenge_2024/features/freelancers_job_market_place/domain/entity/skill.dart';

Freelancer raslan = Freelancer(
  id: '0',
  name: 'Mohamed Raslan',
  imageUrl: AppImages.raslan,
  jobTitle: 'Flutter developer',
  rating: 4.7,
  skills: [
    Skill(
      name: 'App development',
    ),
    Skill(
      name: 'Flutter',
    ),
  ],
  location: 'Cairo, Egypt'
);

Freelancer Amr = Freelancer(
    id: '1',
    name: 'Amr Shams',
    imageUrl: AppImages.Amr,
    jobTitle: 'Software Engineer',
    rating: 4.8,
    skills: [
      Skill(
        name: 'Firebase',
      ),
      Skill(
        name: 'Flutter',
      ),
      Skill(
        name: 'Media buying',
      ),
    ],
    location: 'Cairo, Egypt'
);

Freelancer Abdulrahman = Freelancer(
    id: '2',
    name: 'Abdulrahman Ayman',
    imageUrl: AppImages.Abdulrahman,
    jobTitle: 'Software Engineer',
    rating: 5,
    skills: [
      Skill(
        name: 'ML',
      ),
      Skill(
        name: 'Full-stack dev',
      ),
      Skill(
        name: 'Firebase',
      ),
      Skill(
        name: 'Flutter',
      ),
    ],
    location: 'Cairo, Egypt'
);



Freelancer Eman = Freelancer(
    id: '2',
    name: 'Eman Pepars',
    imageUrl: AppImages.Eman,
    jobTitle: 'Flutter developer',
    rating: 4.5,
    skills: [
      Skill(
        name: 'UI/UX',
      ),

      Skill(
        name: 'Flutter',
      ),
    ],
    location: 'Cairo, Egypt'
);

List<Freelancer> freelancers = [raslan, Amr, Abdulrahman, Eman];

Skill all = Skill(
  name: 'All',
);
Skill appDev = Skill(
  name: 'App development',
);

Skill graphicDesign = Skill(
  name: 'Graphic design',
);

Skill marketing = Skill(
  name: 'Marketing',
);

Skill acconting = Skill(
  name: 'Accounting',
);

List<Skill> skills = [
  all, appDev, marketing, graphicDesign, acconting
];