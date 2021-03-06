import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';
import 'screen/home_screen.dart';
import 'screen/favorite_screen.dart';
import 'screen/leftList/drawer_change.dart';
import 'screen/browsingRecords_screen.dart';
import 'package:flutter_eshopping/screen/cart/app_bar.dart';
import 'providers/cart_notifier.dart';
import 'package:flutter_eshopping/providers/favorite_notifier.dart';
import 'package:flutter_eshopping/providers/member_notifier.dart';
import 'package:flutter_eshopping/providers/change_language_notifier.dart';
import 'package:flutter_eshopping/providers/login_notifier.dart';
import 'package:flutter_eshopping/providers/browsing_notifier.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await initService().then((value) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginNotifier>(
            create: (context) => LoginNotifier(),
          ),
          ChangeNotifierProvider<CartNotifier>(
            create: (context) => CartNotifier(),
          ),
          ChangeNotifierProvider<FavoriteNotify>(
            create: (context) => FavoriteNotify(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
          ChangeNotifierProvider<MemberDetailsNotifier>(
            create: (context) => MemberDetailsNotifier(),
          ),
          ChangeNotifierProvider<BrowsingRecordNotify>(
            create: (context) => BrowsingRecordNotify(),
          ),
        ],
        child: App(),
      ),
    );
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (
        context,
        languageProvider,
        _,
      ) {
        return MaterialApp(
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (BuildContext context) =>
                  Scaffold(body: Center(child: Text('Not Found'))),
            );
          },
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
          theme: new ThemeData(
            brightness: Brightness.light,
          ),
          home: AppPage(),
        );
      },
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    /*Search(), Recommend(),*/ Favorite(),
    BrowsingRecord()
  ];
  final List<Widget> _appBar = [
    HomeBar(),
    /*SearchBar(),
    RecommendBar(),*/
    FavoriteBar(),
    BrowsingRecordsBar(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      /*Provider.of<FavoriteNotify>(context, listen: false).getFavorite();*/
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LoginNotifier>(context, listen: false).getLoginStatus();
    Provider.of<FavoriteNotify>(context, listen: false).getFavorite();
    Provider.of<MemberDetailsNotifier>(context, listen: false).getDetail();
    Provider.of<BrowsingRecordNotify>(context, listen: false).getBrowsing();
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
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.purple],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft))),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: S.of(context).home),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.search), label: S.of(context).search),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department),
              label: S.of(context).newProduct),*/
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: S.of(context).myFavorite),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: S.of(context).browsingRecords),
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

Future<void> initService() async {
  await GetStorage.init();
}
