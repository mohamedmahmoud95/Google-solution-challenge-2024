import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/articles_details/presentation/pages/articles_details.dart';
import 'package:google_solution_challenge_2024/features/auth/authentication_gate.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/manager/scan_lost_or_found_person_cubit/scan_lost_or_found_person_cubit.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/manager/upload_lost_or_found_person_cubit/upload_lost_or_found_person_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/manager/get_professionals_cubit/get_professionals_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/book_one_to_one_session.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/mental_health_support_screen.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/select_therapist_screen.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/select_therapy_group.dart';
import '../features/auth/sign_in/presentation/pages/sign_in_screen.dart';
import '../features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import '../features/landing_screen/presentation/pages/landing_screen.dart';
import '../features/lost and found/domain/entities/lost_or_found_person.dart';
import '../features/lost and found/presentation/pages/add_new_person.dart';
import '../features/lost and found/presentation/pages/lost_and_found_screen.dart';
import '../features/settings/presentation/pages/setting_screen.dart';

class Routes {
  static const String authGate = "/";
  static const String landing = "landing";
  static const String home = "home";
  static const String settings = "settings";
  static const String articlesDetails = "articlesDetails";
  static const String signIn = "signIn";
  static const String signUp = "signUp";
  static const String mentalHealthSupport = "mentalHealthSupport";
  static const String lostAndFound = "lostAndFound";
  static const String selectTherapistScreen = "selectTherapistScreen";
  static const String sessionBookingScreen = "sessionBookingScreen";
  static const String selectTherapyGroupScreen = "selectTherapyGroupScreen";
  static const String addNewLostOrFoundPerson = "addNewLostOrFoundPerson";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.authGate:
        return MaterialPageRoute(builder: (context) => const AuthenticationGate());

      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingScreen());

      case Routes.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.settings:
        return MaterialPageRoute(builder: (context) => const Settings());

      case Routes.articlesDetails:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());

      case Routes.mentalHealthSupport:
        return MaterialPageRoute(
            builder: (context) => const MentalHealthSupportScreen());

      case Routes.selectTherapistScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => GetProfessionalsCubit(),
                  ),
                ], child: const SelectTherapistScreen()));

      case Routes.selectTherapyGroupScreen:
        return MaterialPageRoute(
            builder: (context) => const SelectTherapyGroupScreen());

      case Routes.sessionBookingScreen:
        return MaterialPageRoute(
            builder: (context) => const BookoneToOneSession());

      case Routes.addNewLostOrFoundPerson:
        return MaterialPageRoute(
            builder: (context) => AddNewLostOrFoundPerson(
                  lostOrFound: args as LostOrFound,
                ));

      case Routes.lostAndFound:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => UploadLostOrFoundPersonCubit(),
                    ),
                    BlocProvider(
                      create: (context) => ScanLostOrFoundPersonCubit(),
                    ),
                  ],
                  child: const LostAndFoundScreen(),
                ));

      default:
        return MaterialPageRoute(
            builder: (context) => const Center(
                child: Text("Please close the app and re-open it")));
    }
  }
}
