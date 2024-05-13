import 'package:flutter/material.dart';
import 'package:kde_plasma/widgets/terminal.dart';
import 'widgets/menu_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var month = DateTime.now().toLocal().month;
  var day = DateTime.now().toLocal().day;
  var hour = DateTime.now().toLocal().hour;
  var minute = DateTime.now().toLocal().minute;
  var weekday = DateTime.now().weekday;

  var dayFormat;
  var timeFormat;

  void manipulateTime() {
    List days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    List months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];

    dayFormat =
        "${days[weekday]} ${DateTime.now().day} ${months[DateTime.now().month]}";

    var meridian = hour > 12 ? "PM" : "AM";
    var minuteVal = minute == 0 ? "00" : "$minute";
    timeFormat = "${hour % 12}:$minuteVal $meridian";
  }

  List<String> wallpapers = [
    'assets/images/wallpapers/arch_linux.jpg',
    'assets/images/wallpapers/endeavourOs.png',
    'assets/images/wallpapers/manjaro.jpg',
    'assets/images/wallpapers/opensuse.jpg',
    'assets/images/wallpapers/ubuntu.jpg',
  ];

  @override
  void initState() {
    super.initState();
    manipulateTime();
  }

  void _changeIndex() {
    setState(() {
      index = (index + 1) % wallpapers.length;
    });
  }

  void _toggleMenu() {
    setState(() {
      _menuOpened = !_menuOpened;
      manipulateTime();
    });
  }

  void _toggleTerminal() {
    setState(() {
      _terminalOpened = !_terminalOpened;
      manipulateTime();
    });
  }

  int index = 0;
  bool _menuOpened = false;
  bool _terminalOpened = false;
  @override
  Widget build(BuildContext context) {
    manipulateTime();
    var size = MediaQuery.of(context).size;
    var topWindow = {'height': size.height * .95, 'width': size.width};
    var panel = {'height': size.height * .05, 'width': size.width};

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(wallpapers[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: topWindow['height'],
                    width: topWindow['width'],
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  SizedBox(
                    height: panel['height'],
                    width: panel['width'],
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: _toggleMenu,
                        ),
                        IconButton(
                          icon: const Icon(Icons.terminal),
                          onPressed: _toggleTerminal,
                        ),
                        IconButton(
                          icon: const Icon(Icons.browser_updated),
                          onPressed: _changeIndex,
                        ),
                        const Spacer(),
                        const Icon(Icons.wifi),
                        const SeparatorH(width: 10),
                        const Icon(
                          Icons.battery_2_bar,
                        ),
                        const SeparatorH(width: 10),
                        Text(
                          //'$day $month',
                          dayFormat,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SeparatorH(width: 10),
                        Text(
                          //'$hour:$minute',
                          timeFormat,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
              if (_menuOpened)
                Positioned(
                  bottom: panel['height']! + 5,
                  left: 10,
                  child: const MenuLauncher(),
                ),
              if (_terminalOpened)
                Positioned(
                  top: 50,
                  left: 120,
                  child: TerminalEmulator(currentIndex: index),
                )
            ],
          ),
        ),
      ),
    );
  }
}
