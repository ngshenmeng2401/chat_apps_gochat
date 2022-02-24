part of 'app_pages.dart';

abstract class AppRoutes{

  static const Splash = '/splash';
  static const Login = '/login';
  static const Signup = '/signup';

  static const BottomNavigation = '/bottomnavigation';

  //Chats
  static const ChatsPage = '/chatspage';

  //Contacts
  static const ContactsPage = '/contactspage';

  //Discover
  static const DiscoverPage = '/discoverpage';

  //Me
  static const MePage = '/mepage';
  static const MyProfilePage = '/myprofilepage';
  static const EditProfilePage = '/editprofilepage';
  static const EditProfilePicPage = '/editprofilepicpage';

  //My Post
  static const MyPostPage = '/mypostpage';
  static const PostWithoutPicPage = '/postwithoutpicpage';
  static const PostWithPicPage = '/postwithpicpage';

  static const NotFound = '/notfound';
}