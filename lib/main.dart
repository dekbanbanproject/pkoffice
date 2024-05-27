import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pkoffice/pages/home.dart';
import 'package:pkoffice/screens/admin/authen/authenspsch.dart';
import 'package:pkoffice/screens/admin/cctv/maincctv.dart';
import 'package:pkoffice/screens/admin/cctv/maincctvadd.dart';
import 'package:pkoffice/screens/admin/cctv/maincctvreq.dart';
import 'package:pkoffice/screens/admin/cctv/mainfire.dart';
import 'package:pkoffice/screens/admin/fdh/mainfdh.dart';
import 'package:pkoffice/screens/admin/fire/firemain.dart';
import 'package:pkoffice/screens/admin/fire/mainfireadd.dart';
import 'package:pkoffice/screens/admin/fire/mainfireshow.dart';
import 'package:pkoffice/splash_screen.dart';
import 'package:pkoffice/states/admin.dart';
import 'package:pkoffice/states/adminnew.dart';
import 'package:pkoffice/states/cameracctv.dart';
import 'package:pkoffice/states/home.dart';
import 'package:pkoffice/states/login.dart';
import 'package:pkoffice/states/user.dart';
import 'package:pkoffice/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const Home(),
  '/admin': (BuildContext context) => const AdminPage(),
  '/adminnew': (BuildContext context) => const AdminNew(),
  '/user': (BuildContext context) => const UserPage(),
  '/cameracctv': (BuildContext context) => const CameraCCtv(),
  '/cctvhome': (BuildContext context) => const HomePage(),
  '/cctvadd': (BuildContext context) => const MainCctvAdd(),
  '/cctvmain': (BuildContext context) => const MainCctv(),
  '/maincctvReq': (BuildContext context) => const MaincctvReq(),
  '/spachscreen': (BuildContext context) => const SplashScreen(),
  '/mainfdh': (BuildContext context) => const MainFdh(),
  '/authen': (BuildContext context) => const Authenspsch(),
  '/mainfire': (BuildContext context) => const MainFire(),
  '/mainfireshow': (BuildContext context) => const MainFireshow(),
  '/firemainpage': (BuildContext context) => const FireMainPage(),
  '/routeFireaddPage': (BuildContext context) => const MainFireadd(),
};

String? initlalRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  String? username = preferences.getString('username');
  String? id = preferences.getString('id');

  if (type?.isEmpty ?? true) {
    // initlalRoute = MyConstant.routeLogin;
    initlalRoute = MyConstant.routespachScreen;

    runApp(const MyApp());
  } else {
    switch (type) {
      case 'ADMIN':
        initlalRoute = MyConstant.routeAdminnewPage;
        runApp(const MyApp());
        break;
      case 'USER':
        initlalRoute = MyConstant.routeUserPage;
        runApp(const MyApp());
        break;
      default:
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: initlalRoute,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      // home: SplashScreen(),
    );
  }
}
