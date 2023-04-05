import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/models/student_models.dart';
import 'package:flutter_hive_demo/models/teacher_models.dart';
import 'package:flutter_hive_demo/pages/bank_page.dart';
import 'package:flutter_hive_demo/pages/home_page.dart';
import 'package:flutter_hive_demo/pages/student_page.dart';
import 'package:flutter_hive_demo/pages/teacher_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive/hive.dart';

import 'models/bank_models.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  final dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.initFlutter('hive_db');

  Hive.registerAdapter<Student>(StudentAdapter());
  Hive.registerAdapter<Teacher>(TeacherAdapter());
  Hive.registerAdapter<Bank>(BankAdapter());

  await Hive.openBox('Home');
  await Hive.openBox<Student>('Students');  
  await Hive.openBox<Teacher>('Teachers');  
  await Hive.openBox<Bank>('Banks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Hive'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index = 0;
  final pages = [
    const HomeScreen(),
    const StudentScreen(),
    const TeacherScreen(),
    const BankScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.tealAccent,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Student'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Teacher'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Bank'
          ),
        ]
      ),
    );
  }
}
