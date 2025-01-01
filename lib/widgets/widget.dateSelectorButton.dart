import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateSelectorButton extends StatefulWidget {
  final String labelText;
  final Function(DateTime) onDateSelect;
  const DateSelectorButton({
    super.key,
    required this.labelText,
    required this.onDateSelect,
  });

  @override
  State<DateSelectorButton> createState() => _DateSelectorButtonState();
}

class _DateSelectorButtonState extends State<DateSelectorButton> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          widget.onDateSelect(pickedDate);
          selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
          setState(() {});
        }
      },
      child: Container(
        width: 200,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          selectedDate ?? widget.labelText,
          style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}