import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rootron/routes/route.dart';
import 'package:rootron/utils/CommonLocalizationsDelegate.dart';

class CommunityApp extends StatefulWidget {
  @override
  _CommunityAppState createState() => _CommunityAppState();
}

class _CommunityAppState extends State<CommunityApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CommunityApp',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green,
          accentColor: Colors.green,
          buttonTheme: ButtonThemeData(
              shape: StadiumBorder(side: BorderSide.none),
              height: 50.0,
              minWidth: double.infinity,
              buttonColor: Colors.green,
              textTheme: ButtonTextTheme.primary),
        ),
        routes: _buildRoutes(),
        initialRoute: CommunityRoute.openDoor,
        locale: Locale('zh', 'CN'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,

          ///自定义代理，见下段代码
          CommonLocalizationsDelegate(),
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'CN'),
        ]);
  }

  _buildRoutes() {
    return Map<String, WidgetBuilder>.fromIterable(
      allRouteList,
      key: (route) => '${route.routeName}',
      value: (route) => route.builderRoute,
    );
  }
}
