import 'dart:math';

import 'package:air_quality/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_pie_chart/flutter_pie_chart.dart';
import 'package:fl_chart/fl_chart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من أن Flutter قد تم تهيئته
  await Firebase.initializeApp(); //
  runApp(const LevelPage()); //
}

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  // CollectionReference AQI = FirebaseFirestore.instance.collection("AQI");
  double? Tmp;
  double? CO2_AQI,
      NO2_AQI,
      PM1_AQI,
      PM10_AQI,
      PM25_AQI,
      CH2O_AQI,
      O3_AQI,
      CO_AQI,
      poll_per,
      NO2_poll,
      CO_poll,
      PM1_poll,
      PM10_poll,
      PM25_poll,
      O3_poll,
      pie_o3 = 0,
      pie_no2 = 0,
      pie_pm1 = 0,
      pie_pm10 = 0,
      pie_pm25 = 0,
      pie_co = 0;

  double? CO2, NO2, PM1, PM10, PM25, CH2O, O3, CO, Temp, Humidity;
  bool isloading = false;

  @override
  void initState() {
    super.initState(); // تأكد من استدعاء super.initState()
    getData(); // استدعاء الدالة لجلب البيانات عند بدء تشغيل الصفحة
  }

  getData() async {
    setState(() {
      isloading = true;
    });

    try {
      // Define your document IDs in a list
      List<String> documentIds = [
        "H82QRj9aLU06pJg4KE6X",
      ];

      // Iterate through each document ID
      for (String documentId in documentIds) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("catogry") //catogry
            .doc(documentId)
            .get();

        if (documentSnapshot.exists) {
          setState(() {
            // Access data from the document
            CO2 = documentSnapshot['CO2'] ?? 0;
            CH2O = documentSnapshot['CH2O'] ?? 0;
            CO = documentSnapshot['CO'] ?? 0;
            Humidity = documentSnapshot['Humidity'] ?? 0;
            O3 = documentSnapshot['O3'] ?? 0;
            PM1 = documentSnapshot['PM1'] ?? 0;
            PM10 = documentSnapshot['PM10'] ?? 0;
            PM25 = documentSnapshot['PM25'] ?? 0;
            NO2 = documentSnapshot['NO2'] ?? 0;

            isloading = false;
          });
        } else {
          setState(() {
            isloading = false;
          });
          print('Document with ID $documentId not found');
        }
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error retrieving data: $e');
    }
  }

  add_foreach() async {
    try {
      setState(() {
        isloading = true;
      });

      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'CO_poll': CO_poll}, SetOptions(merge: true));

      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'NO2_poll': NO2_poll}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'O3_poll': O3_poll}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'PM1_poll': PM1_poll}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'PM10_poll': PM10_poll}, SetOptions(merge: true));
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("H82QRj9aLU06pJg4KE6X")
          .set({'PM25_poll': PM25_poll}, SetOptions(merge: true));

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  funpie() {}

// دالة لحساب AQI لكل غاز
  double calculateAQI(double value, double goodLimit, double moderateLimit,
      double unhealthyLimit) {
    // دالة لحساب AQI بناءً على القيم المدخلة
    if (value <= goodLimit) {
      return 0; // مستوى جيد
    } else if (value <= moderateLimit) {
      return ((value - goodLimit) / (moderateLimit - goodLimit)) *
          50; // مستوى متوسط
    } else if (value <= unhealthyLimit) {
      return 50 +
          ((value - moderateLimit) / (unhealthyLimit - moderateLimit)) *
              50; // مستوى غير صحي
    } else {
      return 100 +
          ((value - unhealthyLimit) / (2000 - unhealthyLimit)) *
              100; // مستوى خطير (تجاوز الحد غير الصحي)
    }
  }

// دالة لحساب AQI لكل الغازات
  double calculateMaxAQI(
      double NO2, double PM1, double PM10, double PM25, double O3, double CO) {
    // تعديل الحدود حسب EPA و WHO
    double maxaqi = 150;
    double no2Aqi =
        calculateAQI(NO2, 0.053, 0.100, 0.2); // حدود AQI لـ NO2 (في ppm)
    double pm1Aqi = calculateAQI(PM1, 0, 13, 35); // حدود AQI لـ PM1 (µg/m³)
    double pm10Aqi = calculateAQI(PM10, 0, 54, 154); // حدود AQI لـ PM10 (µg/m³)
    double pm25Aqi =
        calculateAQI(PM25, 0, 12, 35.4); // حدود AQI لـ PM2.5 (µg/m³)

    double o3Aqi =
        calculateAQI(O3, 0.054, 0.070, 0.080); // حدود AQI لـ O3 (في ppm)
    double coAqi = calculateAQI(CO, 0, 4.4, 9.4);
    double maxA = [no2Aqi, pm1Aqi, pm10Aqi, pm25Aqi, o3Aqi, coAqi]
        .reduce((a, b) => a > b ? a : b);

    return [no2Aqi, pm1Aqi, pm10Aqi, pm25Aqi, o3Aqi, coAqi]
        .reduce((a, b) => a > b ? a : b);
  }

  double calculatePollutionPercentage(double totalAQI) {
    double MaxAQI = 150; // القيمة العليا المحددة
    // إذا كانت القيمة الإجمالية أكبر من الحد الأقصى
    if (totalAQI > MaxAQI) {
      return 100; // تعتبر النسبة 100% عندما تتجاوز القيم الحد
    }
    return (totalAQI / MaxAQI) * 100; // حساب النسبة المئوية
  }
  // دالة لحساب النسبة المئوية للتلوث لكل غاز بناءً على الحدود الخاصة به

  double for_each_gas(double value, double goodLimit, double moderateLimit,
      double unhealthyLimit) {
    double aqiValue =
        calculateAQI(value, goodLimit, moderateLimit, unhealthyLimit);
    double maxAQI = 150; // الحد الأقصى لـ AQI، يمكن تغييره حسب الحاجة
    return (aqiValue / maxAQI) * 100; // حساب النسبة المئوية
  }

  double findmax(NO2, PM1, PM10, PM25, CO, O3) {
    return [NO2, PM1, PM10, PM25, CO, O3].reduce((a, b) => a > b ? a : b);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 97, 147, 187),
            title: Text("Pollution level "),
            bottom: TabBar(
              tabs: [
                Tab(child: Text("pollution percentag")),
                Tab(
                  child: Text("pie chart "),
                )
              ],
            )),
        body: Container(
          padding: EdgeInsets.all(10.2),
          child: TabBarView(children: [
            ListView(children: [
              Row(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text(" Low Pollution[0% - 25%]")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.lightBlue),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("Moderate [25%-50%]")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.orange),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("High Pollution[51% - 75%]")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: const Color.fromARGB(255, 194, 136, 132)),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text(" Risk [76% - 100%]")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.red),
                    )),
              ]),
              MaterialButton(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "##click here# to calculate pollution percentage based on the gas values entered ",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    await getData();

                    setState(() {
                      if (NO2 != null &&
                          CO2 != null &&
                          PM1 != null &&
                          PM10 != null &&
                          PM25 != null &&
                          CH2O != null &&
                          O3 != null &&
                          CO != null) {
                        double MaxAQI =
                            calculateMaxAQI(NO2!, PM1!, PM10!, PM25!, O3!, CO!);

                        poll_per = double.tryParse(
                            calculatePollutionPercentage(MaxAQI)
                                .toStringAsFixed(2));
                        CO_poll = double.tryParse(
                            for_each_gas(CO!, 0, 1, 2).toStringAsFixed(2));
                        PM10_poll = for_each_gas(PM10!, 0, 50, 150);
                        PM25_poll = double.tryParse(
                            for_each_gas(PM25!, 0, 12, 35).toStringAsFixed(2));
                        PM1_poll = double.tryParse(
                            for_each_gas(PM1!, 0, 15, 35).toStringAsFixed(2));
                        NO2_poll = double.tryParse(
                            for_each_gas(NO2!, 0.053, 0.100, 0.2)
                                .toStringAsFixed(2));
                        O3_poll = double.tryParse(
                            for_each_gas(O3!, 0.054, 0.070, 0.080)
                                .toStringAsFixed(2));
                        add_foreach();
                      } else {
                        poll_per = null;
                        print("poll_per=null");
                      }
                    });
                  }),
              SizedBox(
                height: 50,
                child: Container(
                  color: Colors.lightBlue,
                  child: Center(
                    child: Text(poll_per == null
                        ? " poluation percantage "
                        : " poluation percantage===>  ${poll_per?.toStringAsFixed(2)} %"),
                  ),
                ),
              ),
              MaterialButton(onPressed: () {})
            ]),

            //temp leve
            ListView(children: [
              TextButton(
                  onPressed: () {
                    getData();
                    setState(() {
                      if (NO2 != null &&
                          CO2 != null &&
                          PM1 != null &&
                          PM10 != null &&
                          PM25 != null &&
                          CH2O != null &&
                          O3 != null &&
                          CO != null) {
                        double MaxAQI =
                            calculateMaxAQI(NO2!, PM1!, PM10!, PM25!, O3!, CO!);

                        poll_per = double.tryParse(
                            calculatePollutionPercentage(MaxAQI)
                                .toStringAsFixed(2));
                        CO_poll = double.tryParse(
                            for_each_gas(CO!, 0, 1, 2).toStringAsFixed(2));
                        PM10_poll = for_each_gas(PM10!, 0, 50, 200);
                        PM25_poll = double.tryParse(
                            for_each_gas(PM25!, 0, 13, 36).toStringAsFixed(2));
                        PM1_poll = double.tryParse(
                            for_each_gas(PM1!, 0, 15, 35).toStringAsFixed(2));
                        NO2_poll = double.tryParse(
                            for_each_gas(NO2!, 0.053, 0.100, 0.2)
                                .toStringAsFixed(2));
                        O3_poll = double.tryParse(
                            for_each_gas(O3!, 0.054, 0.070, 0.080)
                                .toStringAsFixed(2));
                        add_foreach();

                        double total = NO2_poll! +
                            PM10_poll! +
                            PM1_poll! +
                            PM25_poll! +
                            CO_poll! +
                            O3_poll!;

                        if (PM1_poll! +
                                NO2_poll! +
                                PM10_poll! +
                                PM25_poll! +
                                CO_poll! +
                                O3_poll! !=
                            0) {
                          pie_no2 = (NO2_poll! / total) * poll_per!;
                          pie_pm1 = (PM1_poll! / total) * poll_per!;

                          pie_pm10 = (PM10_poll! / total) * poll_per!;

                          pie_pm25 = (PM25_poll! / total) * poll_per!;

                          pie_co = (CO_poll! / total) * poll_per!;
                          pie_o3 = (O3_poll! / total) * poll_per!;
                        } else {
                          print("the total is zero");
                        }
                      } else {
                        poll_per = null;
                        print("poll_per=null");
                      }
                    });
                  },
                  child: Text(
                      " show a pie chart to representation the distribution of pollution percentag that $poll_per % ")),
              Row(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("CO:$CO ppm")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.blue),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("NO2:$NO2 ppm")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.red),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("PM1: $PM1 µg/m³")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.green),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("PM10:$PM10 µg/m³")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.orange),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("PM25:$PM25 µg/m³")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.yellow),
                    )),
              ]),
              Row(children: [
                Expanded(
                    flex: 4,
                    child: Container(
                      child: Text(""),
                    )),
                Expanded(flex: 3, child: Text("O3:$O3 ppm")),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          color: Colors.purple),
                    )),
              ]),
              Container(
                height: 355,
                child: PieChart(
                  PieChartData(
                      centerSpaceRadius: 1,
                      sections: [
                        PieChartSectionData(
                            value: pie_co,
                            color: Colors.blue,
                            title: "${pie_co!.toStringAsFixed(2)}%",
                            showTitle: true,
                            radius: 150),
                        PieChartSectionData(
                            value: pie_no2,
                            color: Colors.red,
                            title: "${pie_no2!.toStringAsFixed(2)}%",
                            showTitle: true,
                            radius: 150),
                        PieChartSectionData(
                            value: pie_pm1,
                            color: Colors.green,
                            title: "${pie_pm1!.toStringAsFixed(2)}%",
                            showTitle: true,
                            radius: 150),
                        PieChartSectionData(
                            value: pie_pm10,
                            color: Colors.orange,
                            title: "${pie_pm10!.toStringAsFixed(2)}%",
                            showTitle: true,
                            radius: 150),
                        PieChartSectionData(
                            value: pie_pm25,
                            color: Colors.yellow,
                            title: "${pie_pm25!.toStringAsFixed(2)}%",
                            showTitle: true,
                            radius: 150),
                        PieChartSectionData(
                            value: pie_o3,
                            color: Colors.purple,
                            title: "${pie_o3!.toStringAsFixed(2)}%",
                            showTitle: true,
                            radius: 150),
                      ],
                      sectionsSpace: 2),
                ),
              )
            ]),
          ]),
        ),
      ),
    );
  }
}
//mg/m³  µg/m³ 