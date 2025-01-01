import 'package:dungeonconsole/helpers/helper.timeExt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSelectorButton extends StatefulWidget {
  final String labelText;
  final Function(TimeOfDay) onTimeSelect;
  final double? height;
  const TimeSelectorButton({
    super.key,
    required this.labelText,
    required this.onTimeSelect,
    this.height = 60,
  });

  @override
  State<TimeSelectorButton> createState() => _TimeSelectorButtonState();
}

class _TimeSelectorButtonState extends State<TimeSelectorButton> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: GoogleFonts.roboto(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(
          height: 8.0,
        ),
        InkWell(
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null) {
              widget.onTimeSelect(pickedTime);
              selectedTime = pickedTime.getDisplayTime();
              setState(() {});
            }
          },
          child: Container(
            width: 200,
            height: widget.height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              selectedTime ?? widget.labelText,
              style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
