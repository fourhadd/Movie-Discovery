// core/navigation/main_wrapper.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_discovery/core/theme/app_theme.dart';

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F0F),
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.08),
              width: 0.5,
            ),
          ),
        ),

        child: SafeArea(
          top: false,
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: AppTheme.primaryRed,
              unselectedItemColor: const Color(0xFF757575),
              selectedFontSize: 11,
              unselectedFontSize: 11,
              iconSize: 22,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.2,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.home_filled),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.search_rounded),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.bookmark_outline_rounded),
                  ),
                  label: 'Watchlist',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.person_outline_rounded),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
