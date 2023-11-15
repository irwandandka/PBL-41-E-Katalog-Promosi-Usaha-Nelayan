import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap , 
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(210, 23, 127, 231),
          borderRadius: BorderRadius.circular(40)
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white)
            ),
    
            const SizedBox(width: 10),
             
            Icon(Icons.arrow_forward, color: Colors.white)
          ],
        ),
      ),
    );
  }
}