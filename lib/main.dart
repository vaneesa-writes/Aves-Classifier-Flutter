import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studioproject1/pages/loginpage.dart';
import 'package:studioproject1/pages/upload.dart';
import 'package:studioproject1/pages/wikipedia.dart';
//import 'package:studioproject1/pages/charts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp().then((value) => Get.put(authorizationpage()));
  runApp(GetMaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          home: loginpage(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List tabs = [uploadimage(), WikipediaExplorer()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedFontSize: 15.0,
        unselectedFontSize: 13.0,
        selectedItemColor: Colors.cyan,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.image), label: "Image-Upload"),
          BottomNavigationBarItem(
              icon: Icon(Icons.dataset), label: "Wikipedia"),
          // BottomNavigationBarItem(icon: Icon(Icons.chair_alt),
          // label:"Chart-Data")
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
