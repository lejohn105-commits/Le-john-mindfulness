import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le John Mindfulness'),
        elevation: 0,
      ),
      body: Center(
        child: _buildPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Meditate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: 'Mood',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const MeditationScreen();
      case 2:
        return const MoodTrackingScreen();
      case 3:
        return const ProgressScreen();
      default:
        return const HomePage();
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Your Wellness Journey',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Daily Streak: 0 days'),
                  const SizedBox(height: 8),
                  const Text('Meditations Completed: 0'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.self_improvement, size: 64),
          const SizedBox(height: 16),
          const Text('Meditation & Breathing Exercises'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Start Meditation'),
          ),
        ],
      ),
    );
  }
}

class MoodTrackingScreen extends StatelessWidget {
  const MoodTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.emoji_emotions, size: 64),
          const SizedBox(height: 16),
          const Text('How are you feeling today?'),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['😞', '😐', '🙂', '😊', '🤩']
                .map((emoji) => GestureDetector(
                      onTap: () {},
                      child: Text(emoji, style: const TextStyle(fontSize: 40)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Progress',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Total Meditation Time: 0 minutes'),
                  SizedBox(height: 8),
                  Text('Average Mood: Not tracked yet'),
                  SizedBox(height: 8),
                  Text('Consistency: 0%'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
