import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/models/teacher_models.dart';
import 'package:hive/hive.dart';

class ADDTeacherScreen extends StatefulWidget {
  const ADDTeacherScreen({super.key});

  @override
  State<ADDTeacherScreen> createState() => _ADDTeacherScreenState();
}

class _ADDTeacherScreenState extends State<ADDTeacherScreen> {
  final _key1 = GlobalKey<FormState>();
  int id = 0;
  String? name;
  int age = 0;
  String? subject;

  late Box<Teacher> teacherBox;

  @override
  void initState() {
    super.initState();
    teacherBox = Hive.box('Teachers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Teacher'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
            key: _key1,
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
          saveTeacher();
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }


  void saveTeacher(){
    final isValid = _key1.currentState?.validate();

    if(isValid != null && isValid){
      _key1.currentState?.save();
      teacherBox.add(
        Teacher(
          id: id, 
          name: name.toString(), 
          age: age, 
          subject: subject.toString()
          )
      );
    }
  }
}