import 'package:dungeonconsole/models/modelConsole/model.console.dart';
import 'package:flutter/material.dart';

class CategotyTabWidget extends StatefulWidget {
  final ConsoleCategory? preSelected;
  final List<ConsoleCategory> availableCategories;
  final Function(int) onChanged;
  const CategotyTabWidget(
      {super.key,
      required this.onChanged,
      this.preSelected,
      this.availableCategories = const [...ConsoleCategory.values]});

  @override
  State<CategotyTabWidget> createState() => _CategotyTabWidgetState();
}

class _CategotyTabWidgetState extends State<CategotyTabWidget> {
  int selectedIndex = 0;

  @override
  initState() {
    if (widget.preSelected != null) {
      switch(widget.preSelected){
        case null:
          break;
        case ConsoleCategory.pc:
          selectedIndex = 0;
          break;
        case ConsoleCategory.ps:
          selectedIndex = 1;
          break;        
        case ConsoleCategory.xbox:
          selectedIndex = 2;
          break;
          case ConsoleCategory.vr:
          selectedIndex = 3;
          break;
        case ConsoleCategory.streaming:
          selectedIndex = 4;
          break;
        case ConsoleCategory.simRacing:
          selectedIndex = 5;
          break;          
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.availableCategories.contains(ConsoleCategory.pc)) ...[
          InkWell(
            onTap: () {
              widget.onChanged(0);
              setState(() => selectedIndex = 0);
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: selectedIndex == 0 ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/monitor.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("PC")
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
        if (widget.availableCategories.contains(ConsoleCategory.ps)) ...[
          InkWell(
            onTap: () {
              widget.onChanged(1);
              setState(() => selectedIndex = 1);
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: selectedIndex == 1 ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/playstation-logotype.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("PS")
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
        if (widget.availableCategories.contains(ConsoleCategory.xbox)) ...[
          InkWell(
            onTap: () {
              widget.onChanged(2);
              setState(() => selectedIndex = 2);
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: selectedIndex == 2 ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/xbox-logo.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("XBox")
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
        if (widget.availableCategories.contains(ConsoleCategory.vr)) ...[
          InkWell(
            onTap: () {
              widget.onChanged(3);
              setState(() => selectedIndex = 3);
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: selectedIndex == 3 ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/virtual-reality-glasses.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("VR")
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
        if (widget.availableCategories.contains(ConsoleCategory.streaming)) ...[
          InkWell(
            onTap: () {
              widget.onChanged(4);
              setState(() => selectedIndex = 4);
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: selectedIndex == 4 ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Streaming")
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
        if (widget.availableCategories.contains(ConsoleCategory.simRacing)) ...[
          InkWell(
            onTap: () {
              widget.onChanged(5);
              setState(() => selectedIndex = 5);
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: selectedIndex == 5 ? Colors.black : Colors.transparent,
                  border: Border.all(color: Colors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/fast.png',
                    height: 25,
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Sim Racing")
                ],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
        ]
      ],
    );
  }
}
