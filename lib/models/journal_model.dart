import 'package:hive/hive.dart';

part 'journal_model.g.dart';

@HiveType(typeId: 0)
class Journal extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  String mood;

  @HiveField(3)
  DateTime date;

  Journal({
    required this.title,
    required this.content,
    required this.mood,
    required this.date,
  });
}
