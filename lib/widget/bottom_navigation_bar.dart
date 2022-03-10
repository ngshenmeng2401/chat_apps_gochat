import 'package:chat_apps_gochat/pages/chatroom/chats_view.dart';
import 'package:chat_apps_gochat/pages/contacts/contact_view.dart';
import 'package:chat_apps_gochat/pages/discover/discover_view.dart';
import 'package:chat_apps_gochat/pages/me/me_view.dart';
import 'package:chat_apps_gochat/widget/bottom_navigation_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (controller){
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                ChatsView(),
                ContactsView(),
                DiscoverView(),
                MeView(),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.chat_bubble,
                label: 'Chats',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.list_bullet,
                label: 'Contacts',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.compass,
                label: 'Discover',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Me',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}