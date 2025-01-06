import 'package:flutter/material.dart';
//import 'dart:ffi';

void main() {
  runApp(const StandardPage());
}

class StandardPage extends StatefulWidget {
  const StandardPage({super.key}); // StatefulWidget constructor

  @override
  _StandardPageState createState() =>
      _StandardPageState(); // Create state class
}

class _StandardPageState extends State<StandardPage> {
  // Example of mutable state (you can add more variables if needed)
  List<Color> cardColors = List.filled(9, Colors.white);

  void change_color(int index) {
    setState(() {
      cardColors[index] = cardColors[index] == Colors.white
          ? const Color.fromARGB(255, 181, 148, 187)
          : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   floatingActionButtonLocation:
      //   FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text(
          'the standard Gas for pure Air',
          style: TextStyle(color: Colors.purple[400]),
        ),
      ),
      body: ListView(children: [
        Card(
          color: cardColors[0],
          child: ListTile(
            title: const Text("CO2"),
            leading: const Text("1"),
            trailing: const Text(
              "less than 400 ppm",
              style: TextStyle(fontSize: 16.9),
            ),
            onTap: () {
              change_color(0);
              print("press");
            },
          ),
        ),
        Card(
          color: cardColors[1],
          child: ListTile(
              title: const Text("PM2.5"),
              leading: const Text("2"),
              trailing: const Text(
                " 0 - 12 µg/m³",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                change_color(1);
                print("press");
              }),
        ),
        Card(
          color: cardColors[2],
          child: ListTile(
              title: const Text("CH2O"),
              leading: const Text("3"),
              trailing: const Text(
                " 0 - 0.06 mg/m³",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                change_color(2);
                print("press");
              }),
        ),
        Card(
          color: cardColors[3],
          child: ListTile(
              title: const Text("O3"),
              leading: const Text("4"),
              trailing: const Text(
                "0 - 0.054 ppm",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                change_color(3);
                print("press");
              }),
        ),
        Card(
          color: cardColors[4],
          child: ListTile(
              title: const Text("CO"),
              leading: const Text("5"),
              trailing: const Text(
                " 0-1 ppm",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                change_color(4);
                print("press");
              }),
        ),
        //   Card(
        //   color: cardColors[5],
        // child: ListTile(
        //   title: const Text("TVOC "),
        // leading: const Text("6"),
        //      trailing: const Text(
        //      " 0 - 0.3 mg/m³",
        //    style: TextStyle(fontSize: 16.9),
        //       ),
        //     onTap: () {
        //     change_color(5);
        //   print("press");
        //        }),
        // )

        Card(
          color: cardColors[6],
          child: ListTile(
              title: const Text("NO2 "),
              leading: const Text("7"),
              trailing: const Text(
                "  0 - 0.053 ppm",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                change_color(6);
                print("press");
              }),
        ),
        Card(
          color: cardColors[7],
          child: ListTile(
            onTap: () {
              change_color(7);
              print("click");
            },
            title: const Text("PM 10"),
            trailing: const Text(
              "0 - 20 µg/m³ ",
              style: TextStyle(fontSize: 16.9),
            ),
            leading: const Text("8"),
          ),
        ),
        Card(
          color: cardColors[8],
          child: ListTile(
            onTap: () {
              print("click");
              change_color(8);
            },
            title: const Text("PM 1.0"),
            trailing:
                const Text(" 0 - 20 µg/m³ ", style: TextStyle(fontSize: 16.9)),
            leading: const Text("9"),
          ),
        ),
        Card(
          child: ListTile(
            enabled: false,
            title: Text("tempreture"),
            leading: Text("10"),
          ),
        ),
        Card(
          child: ListTile(
            enabled: false,
            title: Text("Humidity"),
            leading: Text("11"),
          ),
        ),
      ]),
    );
  }
}
