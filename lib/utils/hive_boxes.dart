import 'package:hive/hive.dart';
import '../models/journal_model.dart';

class HiveBoxes {
  static Box<Journal> journals() => Hive.box<Journal>('journals');
  static Box settings() => Hive.box('settings');
}
