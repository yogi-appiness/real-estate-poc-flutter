import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_poc_app/pages/login/login_provider.dart';
import 'package:real_estate_poc_app/pages/login/login_screen.dart';
import 'package:real_estate_poc_app/pages/sign_up/sign_up_screen.dart';
import 'package:real_estate_poc_app/pages/splash/splash_screen.dart';
import 'firebase_options.dart';
import 'pages/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp.router(
        title: 'Real Estate App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: const TextTheme(),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
          primaryColorLight: Colors.green,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          textTheme: const TextTheme(),
          inputDecorationTheme: const InputDecorationTheme(),
          primaryColorDark: Colors.blue,
        ),
        routerConfig: GoRouter(
          initialLocation: '/splash',
          routes: <RouteBase>[
            GoRoute(
              path: '/splash',
              builder: (BuildContext context, GoRouterState state) {
                return const SplashScreen();
              },
            ),
            GoRoute(
              path: '/login',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginScreen();
              },
            ),
            GoRoute(
              path: '/sign-up',
              builder: (BuildContext context, GoRouterState state) {
                return const SignUpScreen();
              },
            ),
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) {
                return const HomeScreen();
              },
              // routes: <RouteBase>[
              //   GoRoute(
              //     path: '/details',
              //     builder: (BuildContext context, GoRouterState state) {
              //       return PropertyDetails();
              //     },
              //   ),
              // ],
            ),
          ],
        ),
      ),
    );
  }
}
