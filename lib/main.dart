import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rideapp/app/core/app_env.dart';
import 'package:rideapp/app/routes/app_pages.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/utils/constants.dart';

void main() async {
  await appInit(appEnv: AppEnv.RIDEAPP24);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '24Ride',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 16,
            color: "background: #414141;".toHexColor(),
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: "background: #414141;".toHexColor(),
          ),
        ),
      ),
      // home: const SplashPage(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBindings(),
    );
  }
}
