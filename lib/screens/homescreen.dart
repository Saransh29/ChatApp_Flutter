import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/pages/Contacts_page.dart';
import '/pages/Notifications_page.dart';
import '/pages/Messages_page.dart';
import '/pages/Calls_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemTapped: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  _BottomNavigationBar({
    Key? key,
    required this.onItemTapped,
  }) : super(key: key);

  ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                index: 0,
                lable: 'messaging',
                icon: CupertinoIcons.bubble_left_bubble_right_fill,
                onTap: onItemTapped,
              ),
              _NavigationBarItem(
                index: 1,
                lable: 'notifications',
                icon: CupertinoIcons.bell_solid,
                onTap: onItemTapped,
              ),
              _NavigationBarItem(
                index: 2,
                lable: 'calls',
                icon: CupertinoIcons.phone_fill,
                onTap: onItemTapped,
              ),
              _NavigationBarItem(
                index: 3,
                lable: 'contacts',
                icon: CupertinoIcons.person_2_fill,
                onTap: onItemTapped,
              ),
            ],
          ),
        ));
  }
}

class _NavigationBarItem extends StatelessWidget {
  _NavigationBarItem({
    Key? key,
    required this.lable,
    required this.icon,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  ValueChanged<int> onTap;

  final String lable;
  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 69,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 21,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              lable,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
