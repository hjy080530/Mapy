import '../models/diary_entry.dart';

class DiaryStorage {
  static DiaryEntry? todayEntry;

  static void saveEntry(DiaryEntry entry) {
    todayEntry = entry;
  }

  static DiaryEntry? getTodayEntry() => todayEntry;
}