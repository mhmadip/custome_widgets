import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileList(),
    );
  }
}

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  // Sample list of profiles with Kurdish names
  static const List<Map<String, String>> profiles = [
    {'name': 'Emma', 'job': 'Software Engineer'},
    {'name': 'Aya', 'job': 'Product Manager'},
    {'name': 'Adam', 'job': 'UX Designer'},
    {'name': 'Kamran', 'job': 'Mobile Developer'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIU IT Profile Cards'),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ProfileCard(
            name: profile['name']!,
            job: profile['job']!,
          );
        },
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String job;

  const ProfileCard({
    super.key,
    required this.name,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Tapped on $name');
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      job,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}