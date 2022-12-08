import 'package:flutter/material.dart';

class GenericError extends StatelessWidget {
  const GenericError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Path Not Found"), centerTitle: true),
      body: const Center(
        child: Text("404"),
      ),
    );
  }
}
