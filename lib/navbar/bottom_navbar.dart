
import 'package:classnet_app/course/view/all_cours.dart';
import 'package:classnet_app/course/view/my_cours.dart';
import 'package:classnet_app/main.dart';
import 'package:classnet_app/translate/bloc/translate_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  bool _isDarkMode = false;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };
  final List<Widget> _widgetOptions = <Widget>[
    const AllCours(),
    const Mycours(),
    const DropdownButtonApp(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onDarkModeChanged(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    darkMode = !darkMode;
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label:  AppLocalizations.of(context)?.home ?? '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: AppLocalizations.of(context)?.myCours ?? '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)?.settings ?? '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
            body:  buildNavigator(),
        );
  }

  Navigator buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings settings){
          return MaterialPageRoute(builder: (_) => _widgetOptions.elementAt(_selectedIndex));
      },
    );
  }
}


