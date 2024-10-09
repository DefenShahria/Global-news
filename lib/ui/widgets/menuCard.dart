import 'package:flutter/material.dart';

class CenteredCardRow extends StatefulWidget {
  @override
  _CenteredCardRowState createState() => _CenteredCardRowState();
}

class _CenteredCardRowState extends State<CenteredCardRow> {
  int _selectedIndex = -1; // Initially no card is selected

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Fixed height for the card row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Number of cards
        itemBuilder: (context, index) {
          // Check if this card is selected
          bool isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = isSelected ? -1 : index; // Toggle selection
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isSelected ? 80 : 80, // Maintain width
              height: 80, // Fixed height
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueAccent : Colors.white, // Highlight color
                borderRadius: BorderRadius.circular(15),
                boxShadow: isSelected
                    ? [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))]
                    : [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
              ),
              alignment: Alignment.center,
              child: Text(
                'Item $index',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black, // Change text color when selected
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
