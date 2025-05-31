import 'package:flutter/material.dart';
import 'package:myskill_learn_fllutter/pages/third_page.dart';

class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments;
    // return WillPopScope(
    //   onWillPop: () async {
    //     print('Back button pressed on SecondPage');
    //     final shouldBack = await showDialog(
    //       context: context,
    //       builder:
    //           (context) => AlertDialog(
    //             title: const Text('Konfirmasi'),
    //             content: const Text('Apakah Anda yakin ingin kembali?'),
    //             actions: [
    //               TextButton(
    //                 onPressed: () => Navigator.of(context).pop(false),
    //                 child: const Text('Tidak'),
    //               ),
    //               TextButton(
    //                 onPressed: () => Navigator.of(context).pop(true),
    //                 child: const Text('Ya'),
    //               ),
    //             ],
    //           ),
    //     );
    //     return shouldBack;
    //   },

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Konfirmasi'),
                content: const Text('Apakah Anda yakin ingin kembali?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Tidak'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Ya'),
                  ),
                ],
              ),
        );
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Second Page")),
        body: Column(
          children: [
            Text('Data yang dikirim dari first page: $title'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ThirdPage();
                    },
                  ),
                  (Route<dynamic> route) =>
                      route.isFirst, // Hapus semua route sebelumnya
                );
              },
              child: const Text('ke page ketiga (remove until first page)'),
            ),
            // Text('Arguments yang diterima: $args'),
          ],
        ),
      ),
    );
  }
}
