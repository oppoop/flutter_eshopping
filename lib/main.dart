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

void main() {
  runApp(App());
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
  final List<Widget> _children = [Home(), Search(), Setting(), Reserve()];
  final List<Widget> _appBar = [
    HomeBar(),
    SearchBar(),
    SettingsBar(),
    ReserveBar()
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
          IconButton(
              icon: Icon(Icons.mail_outline),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 220,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              child: Column(
                                children: [
                                  ClipOval(
                                      child: Image.network(
                                        'https://upload.wikimedia.org/wikipedia/zh/b/b6/Honkai_Impact_3.png',
                                        fit: BoxFit.cover,
                                        height: 70,
                                        width: 70,
                                      )),
                                  Text('為美好的世界而戰'),
                                  Divider(height: 5, color: Colors.white)
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.list),
                              title: Text('列表'),
                            ),
                            Divider(height: 2, color: Colors.grey),
                            ListTile(
                              leading: Icon(Icons.list),
                              title: Text('列表2'),
                            ),
                          ],
                        ),
                      );
                    });
              })
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
          BottomNavigationBarItem(icon: Icon(Icons.settings), label:S.of(context).setting),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: S.of(context).test),
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
