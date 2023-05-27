import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  late final double number;

  TextFieldWidget({required this.title, required this.number});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {


  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
            hintText: widget.title,
        ),
        keyboardType: TextInputType.number,
        maxLength: 2,
        onChanged: (value) {
          setState(() {
            widget.number = double.tryParse(value)!;
          });
          },
      ),
    );
  }
}
