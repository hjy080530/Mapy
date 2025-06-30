import 'package:flutter/material.dart';
import '../widgets/step_map.dart';
import '../utils/step_counter.dart';
import '../utils/diary_storage.dart';
import '../models/diary_entry.dart';
import 'diary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int steps = 0;

  @override
  void initState() {
    super.initState();
    StepCounter.startAutoSteps((newSteps) {
      setState(() {
        steps = newSteps;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final entry = DiaryStorage.getTodayEntry();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/map_icon.png', height: 30),
            const SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Expanded(child: StepMap()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.directions_walk),
                    const SizedBox(width: 4),
                    Text('👣 $steps걸음 만에 이곳에 왔어요!'),
                  ],
                ),
                const SizedBox(height: 16),
                if (entry != null) ...[
                  Text(
                    '오늘의 기분 ${entry.emoji}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '"${entry.note}"',
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DiaryPage()),
                    );
                    setState(() {}); // 돌아왔을 때 다시 그림!
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text('오늘의 일기', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}