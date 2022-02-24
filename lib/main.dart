import 'package:chat_apps_gochat/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final appData = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final bool isDarkMode = appData.read("isDarkMode") ?? false;

    return GetMaterialApp(
      title: 'Go Chat',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      // theme: isDarkMode ? CustomDarkTheme.darktheme : CustomLightTheme.lighttheme,
      // darkTheme: CustomDarkTheme.darktheme,
      // themeMode: ThemeMode.system,
      // locale: Locale(selectLanguage),
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}