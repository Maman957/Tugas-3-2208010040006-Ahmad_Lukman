import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Portofolio"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 45, 64, 89),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Image.network(
                    "https://www.pngmart.com/files/22/GitHub-Transparent-Isolated-Background.png",
                    height: 50,
                  ),
                  const SizedBox(height: 15),
                  Image.asset("assets/mebel.png"),
                  const SizedBox(height: 15),
                  Image.asset("assets/datadiri.png")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
