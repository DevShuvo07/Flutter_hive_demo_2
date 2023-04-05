import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/models/student_models.dart';
import 'package:hive/hive.dart';
import '../models/bank_models.dart';

class ADDBankScreen extends StatefulWidget {
  const ADDBankScreen({super.key});

  @override
  State<ADDBankScreen> createState() => _ADDBankScreenState();
}

class _ADDBankScreenState extends State<ADDBankScreen> {
  final _key = GlobalKey<FormState>();
  int id = 0;
  String? name;
  int amount = 0;

  // String? selectedValue;
  // List<Student> itemList = [];

  late Box<Bank> bankBox;
  late Box<Student> studentBox;

  @override
  void initState() {
    super.initState();

    bankBox = Hive.box('Banks');
    studentBox = Hive.box('Students');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    helperText: 'Input your id'
                  ),
                  onSaved: (value){
                    id = int.parse(value.toString());
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'Input your name'
                  ),
                  onSaved: (value){
                    name = value.toString();
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    helperText: 'Input your amount'
                  ),
                  onSaved: (value){
                    amount = int.parse(value.toString());
                  },
                ),
              ],
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          saveStudent();
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }


  void saveStudent(){
    final isValid = _key.currentState?.validate();

    if(isValid != null && isValid){
      _key.currentState?.save();
      bankBox.add(
        Bank(
          id: id, 
          name: name.toString(), 
          amount: amount, 
          )
      );
    }
  }
  // List<DropdownMenuItem<dynamic>> getProjects() {
  //   //final box = await Hive.openBox<Student>('project');
  //   setState(() {
  //     itemList = studentBox.values.toList();
  //   });
  //   List<DropdownMenuItem<dynamic>> menuItems = [
  //     for (var p in itemList) 
  //     {
  //       DropdownMenuItem(child: Text(p.name.toString()), value: p.name.toString(),)
  //     }
  //   ];
  //   return menuItems;
  // }
}