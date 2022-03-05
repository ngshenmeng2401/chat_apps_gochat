import 'package:chat_apps_gochat/pages/chats/chats_view.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_view.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/request_view.dart';
import 'package:chat_apps_gochat/pages/contacts/new_friend/new_friend_view.dart';
import 'package:chat_apps_gochat/pages/contacts/new_request/new_request_view.dart';
import 'package:chat_apps_gochat/pages/discover/discover_view.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_with_pic.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moment_without_pic.dart';
import 'package:chat_apps_gochat/pages/discover/moments/moments_view.dart';
import 'package:chat_apps_gochat/pages/login/login_binding.dart';
import 'package:chat_apps_gochat/pages/login/login_view.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/edit_profile_pic_view.dart';
import 'package:chat_apps_gochat/pages/me/edit_profile/my_profile_view.dart';
import 'package:chat_apps_gochat/pages/me/me_view.dart';
import 'package:chat_apps_gochat/pages/me/my_post/my_post_view.dart';
import 'package:chat_apps_gochat/pages/me/my_post/post_with_pic_view.dart';
import 'package:chat_apps_gochat/pages/me/my_post/post_without_pic_view.dart';
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
      page: () => const BottomNavigationBarWidget(),
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

    GetPage(
      name: AppRoutes.NewFriendsPage,
      page: () => NewFriendView(),
    ),

    GetPage(
      name: AppRoutes.NewRequestPage,
      page: () => NewRequestView(),
    ),

    //Discover
    GetPage(
      name: AppRoutes.DiscoverPage,
      page: () => DiscoverView(),
    ),

    GetPage(
      name: AppRoutes.MomentPage,
      page: () => MomentsView(),
    ),

    GetPage(
      name: AppRoutes.MomentWithPicPage,
      page: () => MomentWithPicView(),
    ),

    GetPage(
      name: AppRoutes.MomentWithoutPicPage,
      page: () => MomentWithoutPicView(),
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

    GetPage(
      name: AppRoutes.PostWithoutPicPage,
      page: () => PostWithoutPictureView(),
    ),

    GetPage(
      name: AppRoutes.PostWithPicPage,
      page: () => PostWithPictureView(),
    ),

  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => const NotfoundScreen(),
  );
}