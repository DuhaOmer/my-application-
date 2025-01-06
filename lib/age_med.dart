import 'package:air_quality/medical_page.dart';
//AgeMed
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(const AgeMed());
}

class AgeMed extends StatefulWidget {
  const AgeMed({super.key});
  @override
  _AgeMedState createState() => _AgeMedState();
}

class _AgeMedState extends State<AgeMed> {
  String? age;
  //String? val;
  bool isloading = false;

  Future<void> addReading() async {
    try {
      setState(() {
        isloading = true;
      });

      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'age': age}, SetOptions(merge: true));
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("select your age"),
          backgroundColor: Colors.purple[200]),
      body: ListView(
        children: [
          RadioListTile(
            title: const Text("0-5"),
            value: "0-5",
            groupValue: age,
            onChanged: (val) {
              setState(() {
                age = val;
              });
            },
          ),
          RadioListTile(
              title: const Text("6-15"),
              value: "6-15",
              groupValue: age,
              onChanged: (val) {
                setState(() {
                  age = val;
                });
              }),
          RadioListTile(
              title: const Text("16-30"),
              value: "16-30",
              groupValue: age,
              onChanged: (val) {
                setState(() {
                  age = val;
                });
              }),
          RadioListTile(
              title: const Text("31-50"),
              value: "31-50",
              groupValue: age,
              onChanged: (val) {
                setState(() {
                  age = val;
                });
              }),
          RadioListTile(
              title: const Text(" more than 50"),
              value: "50-100",
              groupValue: age,
              onChanged: (val) {
                setState(() {
                  age = val;
                });
              }),
          Container(
            margin: const EdgeInsets.all(30),
            color: Colors.purple[200],
            child: MaterialButton(
                child: const Text("Next"),
                onPressed: () {
                  addReading();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MedicalPage()));
                }),
          )
        ],
      ),
    );
  }
}
