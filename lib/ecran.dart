// la class de nos detail
// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de détails'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          //Navigate back to first screen when tapped
          Navigator.pop(context);
        },
        child: const Text('Go Back'),
      )),
    );
  }
}
