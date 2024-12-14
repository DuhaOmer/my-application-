import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(Enviro());
}

class Enviro extends StatefulWidget {
  const Enviro({super.key}); // تأكد من وجود هذا المفتاح

  @override
  EnviroState createState() => EnviroState();
}

class EnviroState extends State<Enviro> {
  GlobalKey<FormState> formState1 = GlobalKey();
  bool isloading = false;
  double? PM1, O3, VOC, Temp, Humidity, CH2O, NO2, CO, CO2, PM25, PM10;
  String range = "";
  List<String> selectedRecPM10 = [];
  List<String> selectedRecCO2 = [];
  List<String> selectedRecPM25 = [];
  List<String> selectedRecTemp = [];

  getData() async {
    setState(() {
      isloading = true;
    });

    try {
      // Define your document IDs in a list
      List<String> documentIds = [
        "H82QRj9aLU06pJg4KE6X",
      ];
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
            Temp = documentSnapshot['Temp'] ?? 0;
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
  } //end if get reading

  Future<void> addenv_co2() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("enviroco2");
      var docSnapshot = await docRef.get();
      var subCollectionSnapshot =
          await docRef.collection("recommendations").doc("allrange").get();

      // Prepare the data to be added
      final data1 = {
        'low': [
          " Continue cultivating green plants, as they help absorb CO2.\n",
          " Conduct regular monitoring of values using precise measuring devices.\n",
          " Encourage organic farming that reduces CO2 emissions.\n",
          " Implement sustainable farming techniques such as vertical farming.\n",
          " Participate in reforestation programs.\n"
              " fertilizer:Compost=> enriches soil with organic matter, helping plant growth\n",
          " fertilizer:Nitrogen-based fertilizers: boosts overall plant health.\n"
        ],
        'mid': [
          " Enhance ventilation in greenhouses and closed farms.\n",
          " Increase the use of renewable energy in agricultural operations.\n",
          " Improve soil quality by adding organic fertilizer.\n",
          " Plant species capable of absorbing CO2 more efficiently.\n",
          " Create green walls in farms to improve air quality\n."
              " fertilizer:Organic fertilizer => helps improve soil quality naturally.\n",
          " Balanced NPK fertilizer (10-10-10)=> promotes balanced growth in plants\n"
        ],
        'high': [
          " Reduce the use of air-polluting vehicles in farms.\n",
          " Increase plant diversity to help absorb CO2.\n",
          " Organize workshops on sustainable farming techniques.\n",
          " Improve drainage systems to enhance soil health.\n",
          " Conduct studies to identify sources of CO2 emissions in the area.\n"
              " fertilizer:Slow-release nitrogen fertilizer=>supports plant health in high CO2 conditions.\n"
              " Humic acid=> enhances nutrient uptake and improves soil structure.  "
        ],
        'vhigh': [
          " Develop an emergency plan to address pollution effects.\n",
          " Communicate with local authorities to raise awareness.\n",
          " Implement agricultural waste recycling programs.\n",
          " Reduce industrial activities in the surrounding areas of farms.\n",
          " Consult environmental experts to assess the situation and develop effective control plans.\n",
          " fertilizer:Phosphorus-rich fertilizers (e.g., bone meal): promotes root growth.\n",
          " fertilizer:Mycorrhizal inoculants=> helps plants manage stress from elevated CO2.\n"
        ]
      };

      // Add each range of recommendations to Firestore
      for (String level in data1.keys) {
        await FirebaseFirestore.instance
            .collection("catogry")
            .doc("enviroco2")
            .collection("recommendations")
            .doc("allrange")
            .set(data1, SetOptions(merge: true));
      }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  Future<void> addenv_pm25() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("enviropm25");
      var docSnapshot = await docRef.get();
      var subCollectionSnapshot =
          await docRef.collection("recommendations").doc("allrange").get();
      final data1 = {
        'low': [
          " Continue monitoring and recording data.\n",
          " Enhance the use of clean agricultural technologies.\n",
          " Increase vegetation cover in agricultural areas.\n",
          " Organize awareness programs for farmers on the importance of air quality.\n",
          " Use efficient irrigation systems to maintain soil moisture.\n",
          " fertilizer:Organic compost=> enhances soil health without adding airborne pollutants.\n",
          " Vermicompost=> provides essential nutrients and helps maintain air quality.\n"
        ],
        'mid': [
          " Use air quality measurement devices for regular testing..\n",
          " Reduce outdoor activities during periods of high particulate levels.\n ",
          " Improve ventilation in agricultural stores and facilities.\n",
          " Plant trees and vegetation that can absorb PM2.5.\n",
          " Provide health guidance for farmers with sensitivities.\n",
          " fertilizer:Green manure=> adds nutrients and organic matter to soil without increasing particulate matter.\n",
          " Liquid organic fertilizer=> reduces dust potential compared to powder-based fertilizers.\n"
        ],
        'high': [
          " Take measures to limit emissions from agricultural machinery.\n",
          " Improve ventilation systems in greenhouses.\n",
          " Promote drought-resistant crop planting.\n",
          " Organize regular inspections of air quality levels.\n",
          " Establish partnerships with local communities to improve air quality.\n",
          " fertilizer:Composted manure=> reduces the need for chemical fertilizers, which may add particulates\n",
          " Fish emulsion fertilizer=> a liquid fertilizer that avoids dust production.\n"
        ],
        'vhigh': [
          " Provide medical information about health risks for farmers.\n",
          " Implement emergency measures to reduce exposure.\n",
          " Conduct research on sources of PM2.5 in the area.\n",
          " Communicate with authorities to impose restrictions on polluting activities.\n",
          " Seek alternative energy solutions that reduce emissions.\n",
          " fertilizer:Seaweed fertilizer: nutrient-rich and free from particulate matter\n",
          " Hydroponic nutrients: ideal for greenhouse settings, minimizing particulate interference.\n"
        ]
      };
      for (String level in data1.keys) {
        await FirebaseFirestore.instance
            .collection("catogry")
            .doc("enviropm25")
            .collection("recommendations")
            .doc("allrange")
            .set(data1, SetOptions(merge: true));
      }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  } //the next pm10

  Future<void> addenv_pm10() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("enviropm10");
      var subCollectionSnapshot =
          await docRef.collection("recommendations").doc("allrange").get();

      var docSnapshot = await docRef.get();
      final data1 = {
        'low': [
          "  Maintain clean agricultural practices.\n",
          "  Continue improving the agricultural environment.\n",
          "  Promote the cultivation of crops that enhance air quality.\n",
          "  Continue recording particulate levels for monitoring.\n",
          "  Share information with other farmers.\n",
          "  fertilizer:Organic compost=> minimizes soil dust without chemical residues\n",
          "  Biochar=> improves soil health and reduces dust formation\n"
        ],
        'mid': [
          "  Increase ventilation in buildings and storage areas.\n",
          "  Check the materials used in agriculture.\n ",
          "  Explore alternative methods to dispose of formaldehyde.\n",
          "  Promote planting of air-quality improving plants.\n",
          "  Provide information about potential health risks.\n",
          "  Liquid organic fertilizer=> avoids dust and improves soil without adding particulates.\n",
          "  Mulched compost=> reduces airborne dust when applied over crops\n"
        ],
        'high': [
          "  Limit the use of formaldehyde-containing chemicals.\n",
          "  Improve ventilation systems in farms.\n",
          "  Develop emergency response plans for farmers.\n",
          "  Provide tools for risk assessment.\n",
          "  Organize workshops on using alternative materials.\n",
          "  Composted manure=> provides nutrients while reducing dust impact\n",
          "  Organic peat-based fertilizers=> retains moisture in soil and limits dust\n"
        ],
        'vhigh': [
          "  Warn of danger and evacuate the area if necessary.\n",
          "  Consult public health experts.",
          "  Conduct a comprehensive risk assessment.",
          "  Develop a health information program for farmers.",
          "  Seaweed extract fertilizer=> nutrient-rich and dust-free",
          "  Hydroponic or soilless fertilizers=> ideal for greenhouse or enclosed farming"
        ]
      };
      for (String level in data1.keys) {
        await FirebaseFirestore.instance
            .collection("catogry")
            .doc("enviropm10")
            .collection("recommendations")
            .doc("allrange")
            .set(data1, SetOptions(merge: true));
      }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  Future<void> addenv_temp() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("envirotemp");
      var docSnapshot = await docRef.get();
      var subCollectionSnapshot =
          await docRef.collection("recommendations").doc("allrange").get();
      final data1 = {
        'low': [
          "  Protect plants against frost.\n",
          "  Use insulating covers to protect crops.\n",
          "  Plant frost-resistant crops.\n",
          "  Improve insulation in greenhouses.\n",
          "  Limit watering to prevent root freezing\n",
          "  Slow-release nitrogen fertilizer=> maintains gradual nutrient availability in cold.\n"
              "  Organic compost: improves soil warmth and texture, aiding root insulation.\n"
        ],
        'mid': [
          "  Continue planting according to appropriate conditions.\n",
          "  Maintain soil moisture.\n",
          "  Apply multiple cropping techniques.\n",
          "  Monitor climatic changes and their impacts.\n",
          "  Enhance productivity by selecting suitable varieties.\n",
          "  Balanced N-P-K fertilizer: supports optimal growth and fruiting.",
          "  Organic manure: offers a steady supply of nutrients during the growing season.\n"
        ],
        'high': [
          "  Provide effective irrigation systems such as drip irrigation.\n",
          "  Use shade to protect plants.\n",
          "  Apply mulch to prevent water evaporation and keep root zones cooler.\n",
          "  Organic mulch=> retains soil moisture and reduces soil temperature.\n",
          "  Compost tea=> provides nutrients without stressing roots under heat\n"
        ],
        'vhigh': [
          "  Increase watering schedules to prevent dehydration and root damage\n",
          "  Consider greenhouse cooling systems or shade nets to reduce heat exposure.\n",
          "  Add soil conditioners to improve water retention in sandy soils.\n",
          "  Communicate with agricultural extension services for drought management strategies.\n",
          "  Seaweed extract=> strengthens plants' heat tolerance and resilience\n",
          "  Potassium-rich fertilizers: supports water retention and stress resilience.\n"
        ],
      };
      for (String level in data1.keys) {
        await FirebaseFirestore.instance
            .collection("catogry")
            .doc("envirotemp")
            .collection("recommendations")
            .doc("allrange")
            .set(data1, SetOptions(merge: true));
      }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  } //end of get CO2

  Future<void> getpm25() async {
    try {
      setState(() {
        isloading = true;
      });

      String range;
      if (PM25 != null && PM25 != null) {
        if (PM25! >= 0 && PM25! <= 12) {
          range = 'low';
        } else if (PM25! > 12 && PM25! <= 35) {
          range = 'mid';
        } else if (PM25! > 35 && PM25! <= 55) {
          range = 'high';
        } else {
          range = 'vhigh';
        }
        DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
            .collection("catogry")
            .doc("enviropm25")
            .collection("recommendations")
            .doc("allrange")
            .get();

        if (docSnapshot.exists) {
          List<dynamic> recommendations = docSnapshot[range] ?? [];
          setState(() {
            selectedRecPM25 = List<String>.from(recommendations);
            isloading = false;
          });
        } else {
          print("Document not found for range $range.");
          setState(() {
            isloading = false;
          });
        }
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
  }

  Future<void> getReco2() async {
    try {
      setState(() {
        isloading = true;
      });

      String range; // to determine the range based on gas values

      // Logic to set range based on gas levels
      if (CO2 != null && CO != null) {
        if (CO2! <= 400 && CO! >= 0) {
          range = 'low';
        } else if (CO2! > 400 && CO2! <= 800) {
          range = 'mid';
        } else if (CO2! > 800 && CO2! <= 1200) {
          range = 'high';
        } else {
          range = 'vhigh';
        }
        DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
            .collection("catogry")
            .doc("enviroco2")
            .collection("recommendations")
            .doc("allrange")
            .get();

        if (docSnapshot.exists) {
          // Retrieve the specific range recommendations
          List<dynamic> recommendations = docSnapshot[range] ?? [];
          setState(() {
            selectedRecCO2 = List<String>.from(recommendations);
            isloading = false;
          });
        } else {
          print("Document not found for range $range.");
          setState(() {
            isloading = false;
          });
        }
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
  }

  Future<void> getRectemp() async {
    try {
      setState(() {
        isloading = true;
      });
      if (Temp != null) {
        if (Temp! <= 10) {
          range = 'low';
        } else if (Temp! > 10 && Temp! <= 25) {
          range = 'mid';
        } else if (Temp! > 25 && Temp! <= 35) {
          range = 'high';
        } else {
          range = 'vhigh';
        }
        DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
            .collection("catogry")
            .doc("envirotemp")
            .collection("recommendations")
            .doc("allrange")
            .get();

        if (docSnapshot.exists) {
          List<dynamic> recommendations = docSnapshot[range] ?? [];
          setState(() {
            selectedRecTemp = List<String>.from(recommendations);
            isloading = false;
            print(" temp ranges to test :$selectedRecTemp");
          });
        } else {
          print("Document in temp  not found for range $range.");
          setState(() {
            isloading = false;
          });
        }
      } else {
        print("the Temp is null ");
      }
    } catch (e) {
      print("Error fetching range im temp recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
  }

  Future<void> getRecpm10() async {
    try {
      setState(() {
        isloading = true;
      });
      if (PM10 != null && PM10 != null) {
        if (PM10! <= 50 && PM10! >= 0) {
          range = 'low';
        } else if (PM10! > 50 && PM10! <= 150) {
          range = 'mid';
        } else if (PM10! > 150 && PM10! <= 250) {
          range = 'high';
        } else {
          range = 'vhigh';
        }

        // Fetch the recommendations for the specified range
        DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
            .collection("catogry")
            .doc("enviropm10")
            .collection("recommendations")
            .doc("allrange")
            .get();

        if (docSnapshot.exists) {
          // Retrieve the specific range recommendations
          List<dynamic> recommendations = docSnapshot[range] ?? [];
          setState(() {
            selectedRecPM10 = List<String>.from(recommendations);
            isloading = false;
          });
        } else {
          print("Document not found for range $range.");
          setState(() {
            isloading = false;
          });
        }
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 123, 174, 198),
        title: Text("Enviroment Field"),
      ),
      body: Stack(children: [
        ListView(
          children: [
            InkWell(
              onTap: () async {
                await getData();
                await addenv_co2();
                await addenv_pm10();
                await addenv_pm25();
                await addenv_temp();
                await getReco2();
                await getRecpm10();
                await getRectemp();
                await getpm25();
              },
              child: Text(
                "\n##get the recommendation.... \n",
                style: TextStyle(color: Colors.lightBlue, fontSize: 20),
              ),
            ),
            Text("##according to the  CO2 "),
            Container(
              width: 400,
              margin: EdgeInsets.all(10),
              color: const Color.fromARGB(255, 124, 105, 133),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecCO2.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(selectedRecCO2[index]),
                    );
                  }),
            ),
            Text("\n##according to PM2.5 input\n "),
            Container(
              width: 400,
              margin: EdgeInsets.all(10),
              color: const Color.fromARGB(255, 55, 105, 129),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecPM25.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(selectedRecPM25[index]),
                    );
                  }),
            ),
            Text("\n##according to Temperature input... \n"),
            Container(
              margin: EdgeInsets.all(10),
              width: 400,
              color: const Color.fromARGB(255, 164, 122, 118),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecTemp.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(selectedRecTemp[index]),
                    );
                  }),
            ),
            Text("\n##according to PM10 input\n"),
            Container(
              margin: EdgeInsets.all(10),
              width: 400,
              color: const Color.fromARGB(255, 77, 136, 163),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecPM10.length,
                  itemBuilder: (context, index) {
                    return Card(child: Text(selectedRecPM10[index]));
                  }),
            )
          ],
        ),
        if (isloading) // هنا نستخدم الشرط بشكل صحيح
          Center(child: CircularProgressIndicator())
      ]),
    );
  }
}
