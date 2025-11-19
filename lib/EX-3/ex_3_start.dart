import 'package:flutter/material.dart';

List<String> images = [
  "lib/EX-3/w4-s2/bird.jpg",
  "lib/EX-3/w4-s2/bird2.jpg",
  "lib/EX-3/w4-s2/insect.jpg",
  "lib/EX-3/w4-s2/girl.jpg",
  "lib/EX-3/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: ChangePicButton(),
  ),
);

class ChangePicButton extends StatefulWidget {
  const ChangePicButton({super.key});

  @override
  State<ChangePicButton> createState() => _ChangePicButtonState();
}

class _ChangePicButtonState extends State<ChangePicButton> {
  int currentIndex = 0;

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(
        images[currentIndex],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
