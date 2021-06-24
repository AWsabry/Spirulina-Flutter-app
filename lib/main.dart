import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_course/scr/screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:food_course/scr/providers/app.dart';
import 'package:food_course/scr/providers/product.dart';
import 'package:food_course/scr/providers/user.dart';
import 'package:food_course/scr/screens/login.dart';
import 'package:food_course/scr/widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'عطارة اونلاين',
          theme: ThemeData(primaryColor: Colors.lightGreen),
          home: ScreensController())));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return SplashScreen();
      default:
        return LoginScreen();
    }
  }
}
