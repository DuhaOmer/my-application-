import 'package:air_quality/after_submitted.dart.';
import 'package:air_quality/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//page 2

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CounterWidgetState());
}

class CounterWidgetState extends StatefulWidget {
  const CounterWidgetState({super.key});
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidgetState> {
  double? PM1, O3, VOC, Temp, Humidity, CH2O, NO2, CO, CO2, PM25, PM10;
  bool isloading = false;
  GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey();

  Future<void> addReading() async {
    try {
      setState(() {
        isloading = true;
      });

      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'CO2': CO2}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'CH2O': CH2O}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'CO': CO}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'Humidity': Humidity}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'O3': O3}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'PM1': PM1}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'PM10': PM10}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'PM25': PM25}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'Temp': Temp}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'NO2': NO2}, SetOptions(merge: true));
      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  GlobalKey<FormState> formstate1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Enter Reading "),
            backgroundColor: Colors.purple[200]),
        body: Stack(children: [
          ListView(children: [
            Container(
              padding: const EdgeInsets.all(10.2),
              child: const Text(
                  "## please enter readings in numbers from sensor zphs01b to help you...."),
            ),
            Container(
              child: Container(
                child: Form(
                  key: formstate1,
                  child: Column(children: [
                    Container(
                        padding: const EdgeInsets.all(10.2),
                        child: TextFormField(
                            onSaved: (val) {
                              CO2 = double.tryParse(val ?? "") ?? 0.0;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Not valid";
                              }
                              double? num = double.tryParse(value);
                              if (num == null || num < 0) {
                                return "Not valid";
                              }

                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: " CO2:",
                              suffix: Text(" ppm"),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                            ),
                            keyboardType: TextInputType.number)),
                    Container(
                        padding: const EdgeInsets.all(10.2),
                        child: TextFormField(
                          onSaved: (val) {
                            PM25 = double.tryParse(val ?? "") ?? 0.0;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Not valid";
                            }
                            double? num = double.tryParse(value);
                            if (num == null || num < 0) {
                              return "Not valid";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: " PM2.5:",
                            suffix: Text(" µg/m³"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          CH2O = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid ";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: " CH2O:",
                          suffix: Text(" mg/m³"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          O3 = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: " O3:",
                          suffix: Text(" ppm"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          CO = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: " CO:",
                            suffix: Text(" ppm"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          NO2 = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: " NO2:",
                          suffix: Text(" ppm"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          PM10 = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: " PM10:",
                          suffix: Text(" µg/m³"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          PM1 = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: " PM1.0:",
                            suffix: Text(" µg/m³"),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            )),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                          onSaved: (val) {
                            Temp = double.tryParse(val ?? "") ?? 0.0;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Not valid";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: " Temperature",
                            suffix: Text(" ℃ "),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                          keyboardType: TextInputType.number),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.2),
                      child: TextFormField(
                        onSaved: (val) {
                          Humidity = double.tryParse(val ?? "") ?? 0.0;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Not valid";
                          }
                          double? num = double.tryParse(value);
                          if (num == null || num < 0) {
                            return "Not valid";
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: " Humidity",
                          suffix: Text("%"),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    MaterialButton(
                      color: Colors.purple[200],
                      onPressed: () async {
                        if (formstate1.currentState!.validate()) {
                          formstate1.currentState!.save();
                          setState(() {
                            isloading = true;
                          });

                          await addReading();
                          setState(() {
                            isloading = false;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AfterSubmitted()));
                        } else {
                          print("Not valid");
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(15.2), child: Text('Submit')),
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: MaterialButton(
                          color: Colors.purple[200],
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text("warning"),
                                      content: Text(
                                          "Are you sure to you want to come back"),
                                      actions: [
                                        TextButton(
                                            child: Text("yes"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Homepage()),
                                                      (route) => false);
                                            }),
                                        TextButton(
                                            child: Text("No"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ]);
                                });
                          },
                          child: Container(
                              padding: EdgeInsets.all(20), child: Text("Back")),
                        ))
                  ]),
                ),
              ),
            ),
          ]),
          if (isloading) // هنا نستخدم الشرط بشكل صحيح
            Center(child: CircularProgressIndicator())
        ]));
  }
}
