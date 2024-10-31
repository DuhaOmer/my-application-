import 'package:flutter/material.dart';
//import 'dart:ffi';

void main() {
  runApp(const StandardPage());
}

class StandardPage extends StatelessWidget {
  const StandardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: Text(
          'the standard Gas for pure Air',
          style: TextStyle(color: Colors.purple[400]),
        ),
      ),
      body: ListView(children: [
        Card(
          child: ListTile(
            title: const Text("CO2"),
            leading: const Text("1"),
            trailing: const Text(
              "less than 400 ppm",
              style: TextStyle(fontSize: 16.9),
            ),
            onTap: () {
              print("press");
            },
          ),
        ),
        Card(
          child: ListTile(
              title: const Text("PM2.5"),
              leading: const Text("2"),
              trailing: const Text(
                " 0 - 12 µg/m³",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                print("press");
              }),
        ),
        Card(
          child: ListTile(
              title: const Text("CH2O"),
              leading: const Text("3"),
              trailing: const Text(
                " 0 - 0.1 mg/m³",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                print("press");
              }),
        ),
        Card(
          child: ListTile(
              title: const Text("O3"),
              leading: const Text("4"),
              trailing: const Text(
                "0 - 0.054 ppm",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                print("press");
              }),
        ),
        Card(
          child: ListTile(
              title: const Text("CO"),
              leading: const Text("5"),
              trailing: const Text(
                " 0-2 ppm",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                print("press");
              }),
        ),
        Card(
          child: ListTile(
              title: const Text("TVOC "),
              leading: const Text("6"),
              trailing: const Text(
                " 0 - 0.3 mg/m³",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                print("press");
              }),
        ),
        Card(
          child: ListTile(
              title: const Text("NO2 "),
              leading: const Text("7"),
              trailing: const Text(
                "  0 - 0-0.053 ppm",
                style: TextStyle(fontSize: 16.9),
              ),
              onTap: () {
                print("press");
              }),
        ),
        Card(
          child: ListTile(
            onTap: () => print("click"),
            title: const Text("PM 10"),
            trailing: const Text(
              "0 - 5 µg/m³ ",
              style: TextStyle(fontSize: 16.9),
            ),
            leading: const Text("8"),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () => print("click"),
            title: const Text("PM 1.0"),
            trailing:
                const Text(" 0 - 20 µg/m³ ", style: TextStyle(fontSize: 16.9)),
            leading: const Text("9"),
          ),
        ),
        const Card(
          child: ListTile(
            enabled: false,
            title: Text("tempreture"),
            leading: Text("10"),
          ),
        ),
        const Card(
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
