import 'package:flutter/material.dart';

class SelectableChip extends StatefulWidget {
  final Function(bool) onSelect;
  final Widget child;
  const SelectableChip({super.key, required this.onSelect, required this.child});

  @override
  State<SelectableChip> createState() => _SelectableChipState();
}

class _SelectableChipState extends State<SelectableChip> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.onSelect(!isSelected);
        setState(() {
           isSelected = !isSelected;
        });
      },
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected? Colors.black:Colors.transparent,
          border: Border.all(color:Colors.white)
        ),
        child: widget.child,
      ),
    );
  }
}