import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:air_quality/EnterReading.dart';
import 'package:air_quality/StandardPage.dart';
import 'package:air_quality/AboutGases.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Air Quality"),
          backgroundColor: Colors.purple[200]),
      body: Container(
        padding: const EdgeInsets.all(40.6),
        child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: ListView(children: [
              SizedBox(
                  height: 140,
                  child: Card(
                      color: const Color.fromARGB(255, 177, 141, 183),
                      child: MaterialButton(
                        child: const Text(
                          "Standard values for gases",
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const StandardPage()));
                          // Navigate to the Standard page (Assuming it's already set up)
                        },
                      ))),
              SizedBox(
                  height: 140,
                  child: Card(
                      //height: 200,
                      color: const Color.fromARGB(255, 177, 141, 183),
                      child: MaterialButton(
                        child: const Text(
                          "Enter Reading",
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CounterWidgetState()),
                              (Route) =>
                                  false); // Navigate to Enter Reading page
                          //);
                        },
                      ))),
              SizedBox(
                  height: 140,
                  child: Card(
                      color: const Color.fromARGB(255, 177, 141, 183),
                      child: MaterialButton(
                        child: const Text(
                          "About gases",
                          style: TextStyle(fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutGases()));
                        },
                      ))),
            ]))),
      ),
    );
  }
}
