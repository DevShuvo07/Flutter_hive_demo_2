import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/pages/add_teacher_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../models/teacher_models.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  late Box<Teacher> teacherBox;

  @override
  void initState() {
    super.initState();
    teacherBox = Hive.box('Teachers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: teacherBox.listenable(), 
        builder: (context, box, child){
          return ListView.builder(
        itemCount: teacherBox.length,
        itemBuilder: ((context, index){
          final teacher = teacherBox.getAt(index) as Teacher;

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(teacher.id.toString()),
                  Text(teacher.name.toString()),
                  Text(teacher.age.toString()),
                  Text(teacher.subject.toString()),
            
                ],
              ),
            ),
          );

        })
      );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ADDTeacherScreen()));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}