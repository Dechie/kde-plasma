import 'package:flutter/material.dart';

class MenuLauncher extends StatelessWidget {
  const MenuLauncher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 640,
      height: 500,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 4,
            child: Column(
              children: [
                Item(icon: Icons.bookmark, text: 'Favorites'),
                SeparatorV(height: 10),
                Item(
                  icon: Icons.grid_3x3,
                  text: 'All Applications',
                ),
                SeparatorV(height: 15),
                Item(icon: Icons.work, text: 'Development'),
                SeparatorV(height: 15),
                Item(icon: Icons.gamepad, text: 'Games'),
                SeparatorV(height: 15),
                Item(icon: Icons.web, text: 'Internet'),
                SeparatorV(height: 15),
                Item(icon: Icons.foundation, text: 'Lost and Found'),
                SeparatorV(height: 15),
                Item(icon: Icons.music_note, text: 'Multimedia'),
                SeparatorV(height: 15),
                Item(icon: Icons.desk, text: 'Office'),
                SeparatorV(height: 15),
                Item(icon: Icons.settings, text: 'Settings'),
                SeparatorV(height: 15),
                Item(icon: Icons.system_update_sharp, text: 'System'),
                SeparatorV(height: 15),
                Item(icon: Icons.desk, text: 'Utilities'),
                SeparatorV(height: 15),
                Spacer(),
                SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Icon(Icons.restore),
                      SeparatorH(width: 8),
                      Icon(Icons.power_off_rounded),
                      SeparatorH(width: 8),
                      Icon(Icons.restore),
                      SeparatorH(width: 8),
                      Icon(Icons.restore),
                      SeparatorH(width: 8),
                      Icon(Icons.restore),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                const Spacer(),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 244, 243, 243),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Applications',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SeparatorH extends StatelessWidget {
  const SeparatorH({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class SeparatorV extends StatelessWidget {
  const SeparatorV({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Icon(icon),
          const SeparatorH(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
