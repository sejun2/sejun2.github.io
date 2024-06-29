import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sejun2_portfolio/providers/theme_provider.dart';
import 'package:sejun2_portfolio/ui/my_theme.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(ProviderScope(
    child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ko')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ko'),
        startLocale: const Locale('ko'),
        saveLocale: true,
        child: const MyApp()),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'sejun2.dev',
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      themeMode: ref.watch(themeProvider).themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.notoSans().fontFamily,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(color: lightGrey3),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        fontFamily: GoogleFonts.notoSans().fontFamily,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black87,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          labelSmall: TextStyle(color: lightGrey),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
