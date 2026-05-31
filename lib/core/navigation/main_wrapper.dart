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
      backgroundColor: Colors.black, // Şəkildəki tam qara arxa plan
      body: navigationShell, // Aktiv səhifə (Home, Search və s.)
      // Strong Junior yanaşması: NavBar-ı fərdi Container daxilində idarə etmək
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F0F0F), // Şəkildəki premium tünd boz/qara ton
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(
                0.08,
              ), // Çox incə, göz yormayan üst xətt
              width: 0.5,
            ),
          ),
        ),
        // iOS cihazlarında alt tərəfdəki boşluğu (Home Indicator) avtomatik tənzimləyir
        child: SafeArea(
          top: false, // Üst tərəfə qarışmırıq
          child: Theme(
            // Material 3-ün klik zamanı çıxardığı lazımsız vizual effektləri sıfırlayırıq
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
              backgroundColor: Colors
                  .transparent, // Arxa planı yuxarıdakı Container idarə edir
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: AppTheme.primaryRed, // Aktiv rəng: Qırmızı
              unselectedItemColor: const Color(
                0xFF757575,
              ), // Passiv rəng: Şəkildəki tünd boz
              selectedFontSize: 11,
              unselectedFontSize: 11,
              iconSize: 22, // Şəkildəki kimi zərif və kiçik ikonlar
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
