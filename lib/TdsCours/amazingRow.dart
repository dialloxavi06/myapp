// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TheAmazingRow extends StatelessWidget {
  const TheAmazingRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.onDelete,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onDelete;

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail_page');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Icon(icon),
            Expanded(child: Text(label)),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
