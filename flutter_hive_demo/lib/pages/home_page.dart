import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Box homebox;

  @override
  void initState() {
    
    super.initState();

    homebox = Hive.box('Home');
    homebox.put('1', 'Shuvo');// key 1 index 0
    homebox.put('2', 'Hasan');// key 2 index 1
    homebox.putAll({'3':'Hello', '4':'Hi'});// key 3,4 index 2,3
    //homebox.putAt(0, 'hey');
    homebox.add('test');
    homebox.put('10', 'value');
    homebox.add('test1');
    homebox.add('test2');
  // homebox.addAll({'test2', 'test3'});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(homebox.get('1')),
        Text(homebox.get('2')),
        Text(homebox.get('3')),
        Text(homebox.get('4')),
        Text(homebox.getAt(0)),
        Text(homebox.get('10')),
        Text(homebox.getAt(1)),
        Text(homebox.getAt(2)),
        // Text(homebox.getAt(3)),

        
      ],
    );
  }
}