import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myskill_learn_fllutter/helpers/error_helper.dart';

class ErrorPage extends StatelessWidget {
  final String errorType;

  const ErrorPage(this.errorType, {super.key});

  @override
  Widget build(BuildContext context) {
    final errorInfo = getErrorInfo(errorType);
    return Scaffold(
      // appBar: AppBar(title: Text("Latihan App")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Image(image: AssetImage('lib/assets/$errorType.png')),
                  Text(
                    errorInfo.title,
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    errorInfo.message,
                    style: GoogleFonts.dmSans(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: SizedBox(
                width: double.maxFinite,
                child: FilledButton(
                  onPressed: () => {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    errorInfo.cta,
                    style: GoogleFonts.dmSans(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
