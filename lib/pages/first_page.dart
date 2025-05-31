import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return SecondPage(title: 'data ini dikirim dari first page');
            //     },
            //   ),
            // );
            Navigator.pushNamed(context, '/second', arguments: 'AAA-001');
          },
          child: Text('Ke page kedua'),
        ),
      ),
    );
  }
}
