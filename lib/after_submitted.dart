import 'package:air_quality/age_med.dart';
import 'package:flutter/material.dart';
//import 'package:air_quality/AgeMed.dart';
//import 'package:air_quality/LevelPage.dart';
import 'package:air_quality/level_page.dart';
import 'package:air_quality/enviro.dart';
import 'package:air_quality/temp_only.dart';

void main() {
  runApp(
      const AfterSubmitted()); // تأكد أن الفئة AfterSubmitted هي من نوع Widget
}

class AfterSubmitted extends StatefulWidget {
  const AfterSubmitted({super.key}); // تأكد من وجود هذا المفتاح

  @override
  AfterSubmittedState createState() => AfterSubmittedState();
}

class AfterSubmittedState extends State<AfterSubmitted> {
  GlobalKey<FormState> formState1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Fields "), backgroundColor: Colors.purple[200]),
      body: Container(
        padding: const EdgeInsets.all(40.6),
        // color: Colors.purple,
        //height: 300,
        child: ListView(children: [
          SizedBox(
              height: 200,
              child: Card(
                  color: const Color.fromARGB(255, 159, 126, 165),
                  child: MaterialButton(
                    child: const Text("Medical page",
                        style: TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AgeMed()));
                      // Navigate to the Standard page (Assuming it's already set up)
                    },
                  ))),

          //  SizedBox(height: 20), // إضافة مسافة فارغة
          SizedBox(
            height: 200,
            child: Card(
              color: const Color.fromARGB(255, 159, 126, 165),
              child: MaterialButton(
                child: const Text(
                  "Enviroment Feild",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Enviro(),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Card(
              color: const Color.fromARGB(255, 159, 126, 165),
              child: MaterialButton(
                child: const Text(
                  "pollution level",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LevelPage(),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(
            height: 200,
            child: Card(
              color: const Color.fromARGB(255, 159, 126, 165),
              child: MaterialButton(
                child: const Text(
                  "Temperature level",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TempLevel(),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
