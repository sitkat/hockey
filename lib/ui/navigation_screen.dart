import 'package:flutter/material.dart';
import 'package:hockey/ui/matches_screen.dart';
import 'package:hockey/ui/my_matches_screen.dart';
import 'package:hockey/ui/news_screen.dart';
import 'package:hockey/ui/parameters_screen.dart';
import 'package:hockey/ui/profile_screen.dart';

import '../theme/app_colors.dart';

class NavigationScreen extends StatefulWidget {
  final int initialTabIndex;

  const NavigationScreen({Key? key, this.initialTabIndex = 0}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _MyAppState(initialTabIndex);
}

class _MyAppState extends State<NavigationScreen> {
  int _currentIndex;

  _MyAppState(this._currentIndex);

  final tabs = [
    MatchesScreen(),
    NewsScreen(),
    MyMatchesScreen(),
    ProfileScreen(),
    ParametersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 10.0,
          unselectedFontSize: 10.0,
          iconSize: 25.0,
          unselectedIconTheme: Theme.of(context).iconTheme,
          unselectedItemColor: Theme.of(context).primaryColor,
          selectedItemColor: AppColors.accent,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: 'Actualités',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_hockey),
              label: 'Mes matches',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Paramètres',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
