import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String nom;
  final IconData? icon;
  final TextInputType inputType;
  final TextEditingController controller;
  Input(
      {Key? key,
      required this.nom,
      required this.icon,
      required this.inputType,
      required this.controller})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            label: Text(
              widget.nom,
              style: TextStyle(fontSize: 16),
            ),
            suffixIcon: Icon(widget.icon)),
        keyboardType: widget.inputType,
      ),
    );
  }
}
