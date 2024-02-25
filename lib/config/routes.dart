import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/presentation/pages/helping_options_screen.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/presentation/pages/volunteering_options_screen.dart';
import 'package:google_solution_challenge_2024/features/articles_details/presentation/pages/articles_details.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/pages/charity_details_screen.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/pages/charity_screen.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/pages/donte_screen.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/pages/categories_screen.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/pages/category_search_screen.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/pages/market_place_screen.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/pages/product_info_screen.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/pages/shopping_cart_screen.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/group.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/manager/get_groups_cubit/get_groups_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/book_group_session.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/pages/first_aids_screen.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/pages/offline_resources_screen.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/profile_videos_tab.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/pages/lost_and_found_screen.dart';
import 'package:google_solution_challenge_2024/features/auth/authentication_gate.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/manager/scan_lost_or_found_person_cubit/scan_lost_or_found_person_cubit.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/manager/upload_lost_or_found_person_cubit/upload_lost_or_found_person_cubit.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
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
import '../features/offline_resource/presentation/pages/emergency_contacts_screen.dart';
import '../features/offline_resource/presentation/pages/offline_resource_details_screen.dart';
import '../features/register_as_volunteer/presentation/pages/register_therapist_screen.dart';
import '../features/settings/presentation/pages/setting_screen.dart';
import '../features/charity/presentation/pages/payment_screen.dart';
import '../features/offline_resource/domain/entities/offline_resource.dart';

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

  ///--- charity page----///
  static const String charity = "charity";
  static const String charityDetails = "charityDetails";
  static const String donateScreen = "donateScreen";
  static const String payment = "payment";
  static const String profile = "profile";

  static const String selectTherapistScreen = "selectTherapistScreen";

  ///--- therapist register ---///
  static const String registerTherapistScreen = "registerAsVolunteerScreen";
  static const String sessionBookingScreen = "sessionBookingScreen";
  static const String selectTherapyGroupScreen = "selectTherapyGroupScreen";
  static const String addNewLostOrFoundPerson = "addNewLostOrFoundPerson";
  static const String bookOneToOneSessionScreen = "bookOneToOneSessionScreen";
  static const String bookGroupSessionScreen = "bookGroupSessionScreen";
  static const String offlineResourcesScreen = "OfflineResourcesScreen";
  static const String emergencyContactsScreen = "EmergencyContactsScreen";
  static const String firstAidsScreen = "FirstAidsScreen";
  static const String offlineResourceDetailsScreen = "OfflineResourceDetailsScreen";

  static const String marketPlaceScreen = "MarketPlaceScreen";
  static const String shoppingCartScreen = "ShoppingCartScreen";
  static const String productInfoScreen = "ProductInfoScreen";
  static const String categoriesScreen = "CategoriesScreen";
  static const String categorySearchScreen = "CategorySearchScreen";
  static const String iWantToHelpScreen = "IWantToHelpScreen";
  static const String helpingOptionsScreen = "HelpingOptionsScreen";

}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.authGate:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationGate());

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
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case Routes.articlesDetails:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());

      case Routes.bookOneToOneSessionScreen:
        return MaterialPageRoute(
            builder: (context) => BookOneToOneSessionScreen(
                  therapist: args as Professional,
                ));

      case Routes.bookGroupSessionScreen:
        return MaterialPageRoute(
            builder: (context) => BookGroupSessionScreen(
                  group: args as Group,
                ));

      case Routes.mentalHealthSupport:
        return MaterialPageRoute(
            builder: (context) => const MentalHealthSupportScreen());
      case Routes.charity:
        return MaterialPageRoute(builder: (context) => const CharityScreen());
      case Routes.charityDetails:
        CharityModel charityModel = routeSettings.arguments as CharityModel;
        return MaterialPageRoute(
          builder: (context) => CharityDetailsScreen(
            charityModel: charityModel,
          ),
        );
      case Routes.donateScreen:
        return MaterialPageRoute(builder: (context) => const DonateScreen());
      case Routes.payment:
        return MaterialPageRoute(builder: (context) => const PaymentScreen());

      case Routes.selectTherapistScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => GetProfessionalsCubit(),
                  ),
                ], child: const SelectTherapistScreen()));

      case Routes.selectTherapyGroupScreen:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => GetGroupsCubit(),
                  ),
                ], child: const SelectTherapyGroupScreen()));

      case Routes.registerTherapistScreen:
        return MaterialPageRoute(
            builder: (context) => const RegisterAsVolunteer());
      case Routes.offlineResourcesScreen:
        return MaterialPageRoute(
            builder: (context) => const OfflineResourcesScreen());

      case Routes.emergencyContactsScreen:
        return MaterialPageRoute(
            builder: (context) => const EmergencyContactsScreen());

      case Routes.firstAidsScreen:
        return MaterialPageRoute(builder: (context) => const FirstAidsScreen());
      // case Routes.sessionBookingScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const BookoneToOneSession());

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

      case Routes.offlineResourceDetailsScreen:
        return MaterialPageRoute(
            builder: (context) => OfflineResourceDetailsScreen(
              offlineResource: args as OfflineResource,
            ));

      case Routes.marketPlaceScreen:
        return MaterialPageRoute(builder: (context) =>  const MarketPlaceScreen());

      case Routes.shoppingCartScreen:
        return MaterialPageRoute(builder: (context) =>  const ShoppingCartScreen());

      case Routes.productInfoScreen:
        return MaterialPageRoute(
            builder: (context) => ProductInfoScreen(
              product: args as Product,
            ));

      case Routes.categoriesScreen:
        return MaterialPageRoute(builder: (context) =>  const CategoriesScreen());

      case Routes.categorySearchScreen:
      return MaterialPageRoute(
            builder: (context) => CategorySearchScreen(
              category: args as String,
            ));

      case Routes.iWantToHelpScreen:
        return MaterialPageRoute(
            builder: (context) => VolunteeringOptionsScreen());

      case Routes.helpingOptionsScreen:
        return MaterialPageRoute(
            builder: (context) => HelpingOptionsScreen());


      default:
        return MaterialPageRoute(
            builder: (context) => const Center(
                child: Text(
                    "Unknown route.. please close the app and re-open it")));
    }
  }
}
