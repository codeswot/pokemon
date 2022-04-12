import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '404',
              style: GoogleFonts.majorMonoDisplay(fontSize: 50),
            ),
            const SizedBox(height: 100),
            ElevatedButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}
