import 'package:flutter/material.dart';
import 'package:flutter_application_eyman/secreens/data_entry_page.dart';
import 'package:flutter_application_eyman/secreens/student_profile.dart';
import 'package:flutter_application_eyman/secreens/mark_page.dart';
import 'package:flutter_application_eyman/secreens/login.dart';
import 'package:flutter_application_eyman/secreens/minister_page.dart';
import 'package:flutter_application_eyman/secreens/search_page.dart';
import 'package:flutter_application_eyman/secreens/result_page.dart';
import 'package:flutter_application_eyman/services/auth_service.dart';
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.loadToken();
  runApp(const EducationMinisterApp());
}

class EducationMinisterApp extends StatelessWidget {
  const EducationMinisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // title: 'Education System',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
     // home:
      //ResultPage(),
      //LoginPage(),
      //SearchPage(),
      //CertificateDashboard(),
      //StudentProfilePage(),
      //DataEntryPage(),
      //Mark_page(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/data-entry': (context) => const DataEntryPage(),
        '/search-page': (context) => const SearchPage(),
        '/ResultPage': (context) => const ResultPage(),
        '/CertificateDashboard': (context) => const CertificateDashboard(),
        '/StudentProfilePage': (context) => const StudentProfilePage(),
        //'/Mark_page': (context) => const Mark_page(),

      },
    );
  }
}
