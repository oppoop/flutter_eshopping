import 'package:flutter_eshopping/providers/change_language_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'screen/search_screen.dart';
import 'screen/recommend_screen.dart';
import 'screen/favorite_screen.dart';
import 'screen/leftList/drawer_change.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'package:flutter_eshopping/screen/cart/app_bar.dart';
import 'providers/cart_notifier.dart';
void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<CartNotifier>(
            create: (context) => CartNotifier(),
          ),
        ],
        child: App(),
      ),
  );
}
class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
        ],
        child: Consumer<LanguageProvider>(
          builder: (
              context,
              languageProvider,
              _,
              ) {
            return MaterialApp(
              locale: Locale(
                context.watch<LanguageProvider>().languageCode,
                context.watch<LanguageProvider>().countryCode,
              ),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: new ThemeData(brightness: Brightness.dark),
              home: AppPage(),
            );
          },
        )
    );

  }
}

class AppPage extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Search(),Recommend(),Favorite()];
  final List<Widget> _appBar = [
    HomeBar(),
    SearchBar(),
    RecommendBar(),
    FavoriteBar()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(child: _appBar[_currentIndex]),
        actions: [
          CartAppBarAction(),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: S.of(context).home),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: S.of(context).search),
          BottomNavigationBarItem(icon: Icon(Icons.local_fire_department), label:S.of(context).newProduct),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: S.of(context).myFavorite),
        ],
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: DrawerChange(),
            ),
          ),
        ),
      ),
    );
  }
}
