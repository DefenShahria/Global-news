import 'package:flutter/material.dart';

class Newspage extends StatelessWidget {
  const Newspage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 cards per row
              childAspectRatio: 1, // Aspect ratio to maintain square shape
            ),
            itemCount: 20, // Total number of cards
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                width: 80,
                margin: const EdgeInsets.all(8.0), // Spacing between cards
                decoration: BoxDecoration(
                  color: Colors.blue, // Card background color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Card ${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
