import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BorderDropDown extends StatefulWidget {
  final List<String> items;
  final String labelText;
  final double? width;
  final double? height;
  final Function(String) onChanged;

  const BorderDropDown({
    super.key,
    required this.items,
    required this.labelText,
    this.width = 250,
    this.height = 60,
    required this.onChanged,
  });

  @override
  State<BorderDropDown> createState() => _BorderDropDownState();
}

class _BorderDropDownState extends State<BorderDropDown> {
  String? _selectedBorder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
          ),
          const SizedBox(
            height: 8.0,
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: "Select",
              border: OutlineInputBorder(),
            ),
            value: _selectedBorder,
            items: widget.items.map((String border) {
              return DropdownMenuItem<String>(
                value: border,
                child: Text(border),
              );
            }).toList(),
            onChanged: (String? newValue) {
              widget.onChanged(newValue??"");
              setState(() {
                _selectedBorder = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
