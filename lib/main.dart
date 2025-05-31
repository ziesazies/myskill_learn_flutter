import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import 'package:myskill_learn_fllutter/models/counter_model.dart';
import 'package:myskill_learn_fllutter/pages/counting_page.dart';
import 'package:myskill_learn_fllutter/pages/first_page.dart';
import 'package:myskill_learn_fllutter/pages/login_page.dart';
import 'package:myskill_learn_fllutter/pages/main_screen_page.dart';
// import 'package:method_channel_demo/pages/error_page.dart';
import 'package:myskill_learn_fllutter/pages/second_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return provider.ChangeNotifierProvider(
      create: (BuildContext context) {
        CounterModel counterModel = CounterModel();
        return counterModel;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routes: {
          '/': (context) => const LoginPage(),
          // '/': (context) => const CountingPage(),
          // '/second':
          //     (context) =>
          //         const SecondPage(title: 'data ini dikirim dari first page'),
        },
        // home: FirstPage(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/second') {
            final args = settings.arguments as String?;
            return MaterialPageRoute(
              builder: (context) => SecondPage(title: args ?? 'No data'),
            );
          }
        },
      ),
    );
  }
}
