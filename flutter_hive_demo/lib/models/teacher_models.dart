import 'package:hive/hive.dart';
part 'teacher_models.g.dart';

@HiveType(typeId: 1)
class Teacher extends HiveObject{
  @HiveField(0, defaultValue: 0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int age;
  @HiveField(3)
  final String subject;

  Teacher({required this.age, required this.id, required this.name, required this.subject});
}