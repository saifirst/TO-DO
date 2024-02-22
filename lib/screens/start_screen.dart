import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistapp/screens/todolist_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse('0xFF8075FF')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 225,
          ),
          const SizedBox(
            height: 140,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color(int.parse('0xFF665ECC'))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ToDoListScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Get things done!',
                  style: GoogleFonts.outfit(color: Colors.white, fontSize: 16),
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Crafted by Saif Btoush',
            style: GoogleFonts.outfit(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
