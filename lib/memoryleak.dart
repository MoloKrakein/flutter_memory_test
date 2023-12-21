import 'package:flutter/material.dart';

class MemoryLeakObject {
  final String text;

  MemoryLeakObject(this.text);
}

List<MemoryLeakObject> leakObjects = [];

class MemoryLeaksScreen extends StatefulWidget {
  @override
  _MemoryLeaksScreenState createState() => _MemoryLeaksScreenState();
}

class _MemoryLeaksScreenState extends State<MemoryLeaksScreen> {
  @override
  void dispose() {
    leakObjects.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Create 1,000,000 leaks',
          ),
          onPressed: () {
            while (leakObjects.length < 1000000) {
              leakObjects.add(
                MemoryLeakObject('Count: ${leakObjects.length}'),
              );
            }
          },
        ),
      ),
    );
  }
}
