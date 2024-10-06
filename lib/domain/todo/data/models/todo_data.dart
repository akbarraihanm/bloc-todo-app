import 'package:hive/hive.dart';
part 'todo_data.g.dart';

@HiveType(typeId: 1)
class TodoData {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool? status;

  TodoData({
    this.id,
    this.description,
    this.status,
  });
}