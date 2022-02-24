import 'package:chat_apps_gochat/pages/chats/chats_view.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_view.dart';
import 'package:chat_apps_gochat/pages/discover/discover_view.dart';
import 'package:chat_apps_gochat/pages/login/login_binding.dart';
import 'package:chat_apps_gochat/pages/login/login_view.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_pic_view.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/my_profile_view.dart';
import 'package:chat_apps_gochat/pages/me/me_view.dart';
import 'package:chat_apps_gochat/pages/me/my_post/my_post_view.dart';
import 'package:chat_apps_gochat/pages/not_found_screen.dart';
import 'package:chat_apps_gochat/pages/signup/signup_binding.dart';
import 'package:chat_apps_gochat/pages/signup/signup_view.dart';
import 'package:chat_apps_gochat/pages/splash/splash_binding.dart';
import 'package:chat_apps_gochat/pages/splash/splash_view.dart';
import 'package:chat_apps_gochat/widget/bottom_navigation_bar.dart';
import 'package:chat_apps_gochat/widget/bottom_navigation_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages{

  static final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.Splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.Login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.Signup,
      page: () => const SignUpView(),
      binding:SignUpBinding(),
    ),

    GetPage(
      name: AppRoutes.BottomNavigation,
      page: () => BottomNavigationBarWidget(),
      binding: BottomNavigationBarBinding(),
    ),

    //Chats
    GetPage(
      name: AppRoutes.ChatsPage,
      page: () => ChatsView(),
    ),

    //Contacts
    GetPage(
      name: AppRoutes.ContactsPage,
      page: () => ContactsView(),
    ),

    //Discover
    GetPage(
      name: AppRoutes.DiscoverPage,
      page: () => const DiscoverView(),
    ),

    //Me
    GetPage(
      name: AppRoutes.MePage,
      page: () => MeView(),
    ),

    GetPage(
      name: AppRoutes.MyProfilePage,
      page: () => MyProfileView(),
    ),

    GetPage(
      name: AppRoutes.EditProfilePicPage,
      page: () => EditProfilePicView("0"),
    ),

    GetPage(
      name: AppRoutes.MyPostPage,
      page: () => MyPostView(),
    ),

  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => const NotfoundScreen(),
  );
}