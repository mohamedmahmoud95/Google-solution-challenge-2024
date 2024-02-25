import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/domain/entity/helping_option.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/domain/entity/volunteering_option.dart';

import '../../../core/utils/app_images.dart';

VolunteeringOption therapist = VolunteeringOption(
  id: '1',
  title: "Therapist",
  imageUrl: AppImages.therapist,
);


VolunteeringOption doctor = VolunteeringOption(
  id: '2',
  title: "Doctor",
  imageUrl: AppImages.doctor,
);


VolunteeringOption doctor2 = VolunteeringOption(
  id: '3',
  title: "Doctor",
  imageUrl: AppImages.doctor2,
);

VolunteeringOption remotePatientMonitoringSpecialist = VolunteeringOption(
  id: '3',
  title: "Remote patient monitoring specialist",
  imageUrl: AppImages.remote_patient_monitoring_specialist,
);


VolunteeringOption tutor = VolunteeringOption(
  id: '4',
  title: "Tutor",
  imageUrl: AppImages.tutor,
);

VolunteeringOption fundRaisingSpecialist = VolunteeringOption(
  id: '5',
  title: "Fund raising specialist",
  imageUrl: AppImages.fund_raising_specialist,
);

VolunteeringOption lawyer = VolunteeringOption(
  id: '6',
  title: "Lawyer",
  imageUrl: AppImages.lawyer,
);


VolunteeringOption volunteer = VolunteeringOption(
  id: '7',
  title: "On ground volunteer",
  imageUrl: AppImages.volunteer,
);

VolunteeringOption consultant = VolunteeringOption(
  id: '8',
  title: "Business consultant",
  imageUrl: AppImages.consultant,
);

VolunteeringOption investor = VolunteeringOption(
  id: '9',
  title: "Investor",
  imageUrl: AppImages.investor,
);

VolunteeringOption employer = VolunteeringOption(
  id: '10',
  title: "Employer",
  imageUrl: AppImages.employer,
);

VolunteeringOption other = VolunteeringOption(
  id: '11',
  title: "Other",
  imageUrl: AppImages.no_image,
);

List<VolunteeringOption> volunteeringOptions = [
  therapist, doctor2, remotePatientMonitoringSpecialist, tutor, fundRaisingSpecialist, lawyer, volunteer, employer, consultant, investor, other
];



HelpingOption moneyDonation = HelpingOption(
  id: '1',
  title: 'Money donation',
  imageUrl: AppImages.money_dontation,
);

HelpingOption clothingDonation = HelpingOption(
  id: '2',
  title: 'Clothing donation',
  imageUrl: AppImages.clothing_dontation,
);

HelpingOption volunteering = HelpingOption(
  id: '3',
  title: 'Volunteer',
  imageUrl: AppImages.volunteering_online_doctor,
  nextPageName: 'IWantToHelpScreen',
);


HelpingOption supportThereBusiness = HelpingOption(
  id: '4',
  title: 'Empowerment Market',
  subtitle: "Support War Survivors Through Purchases",
  imageUrl: AppImages.volunteering_online_doctor,
  nextPageName: 'MarketPlaceScreen',
);
List<HelpingOption> helpingOptions = [moneyDonation, clothingDonation, volunteering];

