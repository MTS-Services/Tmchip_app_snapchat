import 'package:get/get.dart';

import '../modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/spotliath/bindings/spotliath_binding.dart';
import '../modules/spotliath/views/spotliath_view.dart';
import '../modules/stories/bindings/stories_binding.dart';
import '../modules/stories/views/stories_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initaial = _Paths.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () =>  OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () =>  BottomNavigationView(),
      binding: BottomNavigationBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () =>  ExploreView(),
      binding: ExploreBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.STORIES,
      page: () => const StoriesView(),
      binding: StoriesBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.SPOTLIATH,
      page: () => const SpotliathView(),
      binding: SpotliathBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
