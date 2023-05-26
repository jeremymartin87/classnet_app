
import 'package:classnet_app/course/view/all_cours.dart';
import 'package:classnet_app/course/view/my_cours.dart';
import 'package:classnet_app/main.dart';
import 'package:flutter/material.dart';
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
  };
  final List<Widget> _widgetOptions = <Widget>[
    const AllCours(),
    const Mycours(),
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark(),
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('fr'), // Spanish
        ],
        home:Scaffold(
        bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Mes Cours',
          ),
          BottomNavigationBarItem(
            icon: Switch(
              value: _isDarkMode,
              onChanged: _onDarkModeChanged,
            ),
            label: 'Mode sombre',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body:  buildNavigator(),
    ),
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

