import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            children: [
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
              SizedBox(height: 20),
              SelectButton(),
            ],
          ),
        ),
      ),
    ));

class SelectButton extends StatefulWidget {
  const SelectButton({
    super.key,
  });

  @override
  State<SelectButton> createState() => _SelectButtonState();

}

class _SelectButtonState extends State<SelectButton> {

  bool isSelected = false;

  Color get buttonColor => isSelected ? Colors.blue.shade500 : Colors.blue.shade50;
  Color get textColor => isSelected ? Colors.white : Colors.black;
  String get buttonText => isSelected ? "Selected" : "Not Selected";

  void buttonSelection() {
    setState(() {
      isSelected = !isSelected; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: buttonSelection,  
        style: ElevatedButton.styleFrom( 
          backgroundColor: buttonColor,
          foregroundColor: textColor,
        ),
        child: Center(
          child: Text(buttonText),  
        ),
      ),
    );
  }
}

