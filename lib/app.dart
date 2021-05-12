import 'package:flutter/material.dart';
import 'package:flutter_base_clean_architecture/features/index_screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base_clean_architecture/generated/l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        // 1
        S.delegate,
        // 2
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenHome(),
      },
    );
  }
}
