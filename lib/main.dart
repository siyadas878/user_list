import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_list/application/provider/pagination_provider.dart';
import 'package:users_list/core/constants/const.dart';
import 'package:users_list/presentation/screens/splash_screen/splash_screen.dart';
import 'application/provider/get_all_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => GetAllUsers(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserListProvider(),
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: tealcolor,
          primarySwatch: tealcolor,
          appBarTheme:const AppBarTheme(color: tealcolor)
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

