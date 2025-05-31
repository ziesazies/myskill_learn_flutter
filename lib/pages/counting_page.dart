import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:myskill_learn_fllutter/models/counter_model.dart';

class CountingPage extends ConsumerWidget {
  const CountingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final angkaRiverpod = ref.watch(counterProvider);
    return Scaffold(
      // body: Consumer(
      // builder: (context, CounterModel counterModel, child) {
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Counting Page',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          Text('This page is used to count numbers.'),
          Text('You can increment or decrement the count.'),
          SizedBox(height: 20),
          Text(
            // 'Current Count: ${counterModel.count}', // This should be dynamic
            'Current count: $angkaRiverpod', // This should be dynamic

            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // counterModel.increment();
              // Logic to increment the count
              ref.read(counterProvider.notifier).state += 1;
            },
            child: Text('Increment Count'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // counterModel.decrement();
              // Logic to decrement the count
              ref.read(counterProvider.notifier).state -= 1;
            },
            child: Text('Decrement Count'),
          ),
          DropdownMenu(
            initialSelection: 'Option 1',
            dropdownMenuEntries: [
              DropdownMenuEntry<String>(value: 'Option 1', label: 'Option 1'),
              DropdownMenuEntry<String>(value: 'Option 2', label: 'Option 2'),
              DropdownMenuEntry<String>(value: 'Option 3', label: 'Option 3'),
            ],
          ),
        ],
        // );
        // },
      ),
    );
  }
}
