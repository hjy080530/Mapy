import 'package:flutter/material.dart';
import '../models/diary_entry.dart';
import '../utils/diary_storage.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  String selectedEmoji = '😊';
  final noteController = TextEditingController();

  final emojis = ['😊', '😢', '😠', '😍', '🤩', '🥱', '😎'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('오늘의 기분 기록하기')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: emojis.map((e) {
                return ChoiceChip(
                  label: Text(e, style: const TextStyle(fontSize: 24)),
                  selected: selectedEmoji == e,
                  onSelected: (_) {
                    setState(() => selectedEmoji = e);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(
                hintText: '오늘 어떤 일이 있었나요?',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final entry = DiaryEntry(
                  emoji: selectedEmoji,
                  note: noteController.text,
                  date: DateTime.now(),
                );
                DiaryStorage.saveEntry(entry);
                Navigator.pop(context);
              },
              child: const Text('저장하기 💾'),
            )
          ],
        ),
      ),
    );
  }
}