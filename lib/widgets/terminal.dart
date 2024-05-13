import 'package:flutter/material.dart';
import 'package:kde_plasma/utils/constants.dart';
import 'package:kde_plasma/widgets/menu_launcher.dart';

import '../utils/aascii_arts.dart';
import '../utils/specs.dart';

class TerminalEmulator extends StatefulWidget {
  const TerminalEmulator({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  State<TerminalEmulator> createState() => _TerminalEmulatorState();
}

class _TerminalEmulatorState extends State<TerminalEmulator> {
  // List<Color> terminalColors = [
  //   Colors.blue,
  //   Colors.purple,
  //   Colors.teal,
  //   Colors.lightGreen,
  //   Colors.red,
  // ];

  List<Color> terminalColors = [
    Colors.blue,
    //Colors.deepPurple,
    Colors.lightBlueAccent,
    Colors.teal,
    Colors.amber,
    //const Color.fromARGB(255, 196, 33, 22),
    Colors.redAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 640,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 4,
          color: Colors.white70,
        ),
      ),
      // child: Text(
      //   asciiArt,
      //   style: const TextStyle(
      //     color: Colors.blue,
      //     fontFamily: 'Roboto Mono',
      //     fontSize: 15,
      //   ),
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ListView.separated(
              //itemCount: asciiArtArchLinux.length,
              itemCount: asciiArts[widget.currentIndex].length,
              itemBuilder: (context, index) => Text(
                //asciiArtArchLinux[index],
                //jasciiArtUbuntu[index],
                asciiArts[widget.currentIndex][index],
                style: TextStyle(
                  color: terminalColors[widget.currentIndex],
                  fontFamily: 'Roboto Mono',
                  fontSize: 15,
                ),
              ),
              separatorBuilder: (context, index) => const SeparatorV(
                height: 1,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.separated(
              itemCount: distroSpecs[widget.currentIndex].length,
              itemBuilder: (context, index) => Text(
                distroSpecs[widget.currentIndex][index],
                style: TextStyle(
                  color: terminalColors[widget.currentIndex],
                  fontFamily: 'Roboto Mono',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              separatorBuilder: (context, index) => const SeparatorV(
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
