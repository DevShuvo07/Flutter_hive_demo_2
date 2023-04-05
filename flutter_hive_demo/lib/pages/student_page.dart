import 'package:flutter/material.dart';
import 'package:flutter_hive_demo/models/student_models.dart';
import 'package:flutter_hive_demo/pages/add_student_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  late Box<Student> StudentBox;

  @override
  void initState() {
    super.initState();
    StudentBox = Hive.box('Students');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: StudentBox.listenable(), 
        builder: (context, box, child){
          return ListView.builder(
        itemCount: StudentBox.length,
        itemBuilder: ((context, index){
          final student = StudentBox.getAt(index) as Student;

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(student.id.toString()),
                  Text(student.name.toString()),
                  Text(student.age.toString()),
                  Text(student.subject.toString()),
            
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
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ADDStudentScreen()));
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}