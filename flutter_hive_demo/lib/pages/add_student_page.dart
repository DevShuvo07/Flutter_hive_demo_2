import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/models/student_models.dart';
import 'package:hive/hive.dart';

class ADDStudentScreen extends StatefulWidget {
  const ADDStudentScreen({super.key});

  @override
  State<ADDStudentScreen> createState() => _ADDStudentScreenState();
}

class _ADDStudentScreenState extends State<ADDStudentScreen> {
  final _key = GlobalKey<FormState>();
  int id = 0;
  String? name;
  int age = 0;
  String? subject;

  late Box<Student> StudentBox;

  @override
  void initState() {
    super.initState();

    StudentBox = Hive.box('Students');
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
                    labelText: 'Age',
                    helperText: 'Input your age'
                  ),
                  onSaved: (value){
                    age = int.parse(value.toString());
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Subject',
                    helperText: 'Input your subject'
                  ),
                  onSaved: (value){
                    subject = value.toString();
                  },
                )
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
      StudentBox.add(
        Student(
          id: id, 
          name: name.toString(), 
          age: age, 
          subject: subject.toString()
          )
      );
    }
  }
}