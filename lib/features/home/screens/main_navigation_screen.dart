import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../sos/widgets/sos_fab.dart';
import 'dashboard_screen.dart';
import '../../autoevaluacion/screens/autoevaluacion_screen.dart';
import '../../senales/screens/senales_screen.dart';
import '../../herramientas/screens/herramientas_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardScreen(onNavigateToTab: _onSelectTab),
      const AutoevaluacionScreen(),
      const SenalesScreen(),
      const HerramientasScreen(),
    ];
  }

  void _onSelectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: const SosFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.surfaceLight, width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onSelectTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.sereneBlue,
          unselectedItemColor: AppColors.textSecondary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              activeIcon: Icon(Icons.home_rounded, color: AppColors.sereneBlue),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_outlined),
              activeIcon: Icon(Icons.assignment_turned_in_rounded, color: AppColors.sereneBlue),
              label: '¿Cómo estoy?',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page_outlined),
              activeIcon: Icon(Icons.find_in_page_rounded, color: AppColors.emeraldGreen),
              label: 'Señales',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.spa_outlined),
              activeIcon: Icon(Icons.spa_rounded, color: AppColors.levelYellow),
              label: 'Herramientas',
            ),
          ],
        ),
      ),
    );
  }
}
