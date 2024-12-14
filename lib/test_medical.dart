import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(const MedicalPage2());
}

class MedicalPage2 extends StatefulWidget {
  const MedicalPage2(
      {super.key}); // Fix here: widget constructor is missing a key
  @override
  _MedicalPage2State createState() =>
      _MedicalPage2State(); // Fix here: createState() with correct spelling
}

class _MedicalPage2State extends State<MedicalPage2> {
  GlobalKey<FormState> formState1 = GlobalKey();
  double? Tmp;
  double? CO2, NO2, PM1, PM10, PM25, CH2O, O3, CO, Temp, Humidity;
  bool isloading = false;
  bool clickco2 = false,
      clicko3 = false,
      clickch2o = false,
      clickpm25 = false,
      clickco = false;
  String? rec1 = "...",
      rec2 = "...",
      rec3 = "...",
      rec4 = "...",
      rec5 = "...",
      rec6 = "...",
      rec7 = "...";

  Widget imageWidget = Container();
  var pm25_mp, co2_mp, ch2o_mp, co_mp, o3_mp;
  @override
  void initState() {
    super.initState();
    getData();
    fetchco2();
    fetchpm25();
    fetchch2o();
    fetcho3();
    fetchco();
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
  } //end of get reading

  fetchco2() async {
    setState(() {
      isloading = true;
    });

    try {
      List<String> documentIds = [
        "typeCO2",
      ];

      // Iterate through each document ID
      for (String documentId in documentIds) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("catogry") //catogry
            .doc(documentId)
            .get();

        if (documentSnapshot.exists) {
          if (CO2! <= 600 && CO2! >= 0) {
            setState(() {
              isloading = true;
              rec1 =
                  "Maintain proper ventilation to keep air quality healthy.\n";
              rec2 =
                  "Ensure windows are open regularly, especially in closed environments.\n";
              rec3 = "Use indoor plants to help keep CO2 levels low.\n";
              rec4 = " ";
              rec5 = " ";
              rec6 = " ";
              rec7 = " ";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
              isloading = false;
            });
          } else if (CO2! <= 1000 && CO2! >= 601) {
            setState(() {
              isloading = true;
              rec1 =
                  "Increase ventilation by opening windows or using air purifiers.\n";
              rec2 =
                  "Limit time spent in crowded or poorly ventilated indoor spaces\n";
              rec3 =
                  "Regularly check CO2 levels if you work in enclosed areas.\n";
              rec4 =
                  "Warning: Prolonged exposure at this level may cause mild symptoms like drowsiness, headaches, and reduced focus.\n";
              rec5 =
                  "Vaccination: Flu vaccine is recommended, especially for children under 5 years and adults over 65, as compromised air quality can make respiratory symptoms worse.\n";
              rec6 = " ";
              rec7 = " ";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
              isloading = false;
            });
          } else if (CO2! <= 1500 && CO2! >= 1001) {
            setState(() {
              isloading = true;
              rec1 =
                  "Improve ventilation immediately by using mechanical ventilation systems or moving to a more open area.\n";
              rec2 =
                  "Avoid strenuous activities in closed spaces at this level.\n";
              rec3 =
                  "Monitor CO2 levels regularly if you’re in high-risk locations such as classrooms, offices, or public transport/n";
              rec4 =
                  "Warning: Breathing air with this level of CO2 can lead to headaches, dizziness, and shortness of breath, especially for people with pre-existing respiratory conditions\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine is recommended for older adults (65+ years) and children (under 2 years), as they are more vulnerable to respiratory infections.\n";
              rec6 =
                  "Flu vaccine is also recommended for individuals with weakened immune systems.\n";
              rec7 = " ";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                      fit: BoxFit.fill, "images/imageshighony.webp"));
              isloading = false;
            });
          } else {
            setState(() {
              isloading = true;
              rec1 =
                  "Evacuate the area and move to a well-ventilated or outdoor space immediately.\n";
              rec2 =
                  "Call emergency services if symptoms worsen, such as confusion, rapid heartbeat, or difficulty breathing.\n";
              rec3 =
                  "install CO2 monitors if exposure is frequent in specific locations.\n";
              rec4 =
                  "Warning: High levels of CO2 can cause serious health issues like hyperventilation, increased heart rate, confusion, unconsciousness, and even asphyxiation if not addressed quickly\n";
              rec5 =
                  "High risk for children, elderly, and those with respiratory diseases like asthma or COPD.\n";
              rec6 =
                  "Vaccination: Pneumococcal vaccine for those over 65 and those with chronic health issues, as respiratory infections are more likely in poor air conditions\n";
              rec7 =
                  "COVID-19 vaccine for individuals over 12 years to prevent any exacerbation of respiratory issues caused by both poor air quality and infection\n";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));

              isloading = false;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error retrieving data: $e');
    }
  }

  fetchpm25() async {
    setState(() {
      isloading = true;
    });

    try {
      List<String> documentIds = [
        "typePM2.5",
      ];

      // Iterate through each document ID
      for (String documentId in documentIds) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("catogry") //catogry
            .doc(documentId)
            .get();

        if (documentSnapshot.exists) {
          // Access data from the document
          var data = documentSnapshot.data() as Map<String, dynamic>;
          if (PM25! <= 12 && PM25! >= 0) {
            setState(() {
              isloading = true;
              rec1 =
                  "Clean Air: PM2.5 levels in this range are relatively safe, indicating good air quality. You can enjoy outdoor activities without concern.\n";
              rec2 =
                  "Physical Activity: Engage in physical activities outdoors, such as walking or jogging, without needing precautions.\n";
              rec3 =
                  "Avoid Smoking: Continue to avoid smoking or exposure to smoke, even in good air quality environments, as smoking adds additional pollutants.\n";
              rec4 =
                  "Continuous Monitoring: Regularly check air quality reports, as conditions can change, and precautions may be needed if PM2.5 levels rise.\n";
              rec5 =
                  "Boost Immunity: Eat a balanced diet rich in vitamins and minerals to support respiratory health and the immune system.\n";
              rec6 = " ";
              rec7 = " ";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
              isloading = false;
              print(documentSnapshot.data());
            });
          } else if (PM25! <= 35 && PM25! >= 13) {
            setState(() {
              isloading = true;
              rec1 =
                  "People with asthma or respiratory issues should be cautious and use preventive inhalers. Avoid prolonged outdoor activities, especially in poorly ventilated areas.\n";
              rec2 =
                  "Warning: Mild respiratory symptoms like coughing or shortness of breath may start to appear for individuals with respiratory diseases.\n";
              rec3 =
                  "Vaccination: Flu vaccine is recommended for individuals with asthma or respiratory diseases, as polluted air can increase the risk of respiratory infections.\n";
              rec4 = "";
              rec5 = "";
              rec6 = "";
              rec7 = "";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
              isloading = false;
            });
          } else if (PM25! <= 55 && PM25! >= 36) {
            setState(() {
              isloading = true;
              rec1 =
                  "Wear face masks (such as N95) to reduce the inhalation of fine particles.\n";
              rec2 =
                  "Asthma or allergy sufferers should stay indoors in well-ventilated or air-filtered spaces and avoid outdoor activities\n";
              rec3 =
                  "Use air purifiers at home to help reduce the impact of fine particulate matter.\n";
              rec4 =
                  "Warning: Respiratory symptoms such as wheezing or coughing may significantly worsen for individuals with asthma and allergies.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine is recommended for individuals with asthma or respiratory problems to protect against lung infections, which can be exacerbated in polluted air.\n";
              rec6 =
                  "Flu vaccine is recommended for all ages, especially those with respiratory conditions.\n";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                      fit: BoxFit.fill, "images/imageshighony.webp"));
              isloading = false;
            });
          } else {
            setState(() {
              isloading = true;
              rec1 =
                  "Avoid going outdoors entirely and stay in air-filtered indoor environments.\n";
              rec2 =
                  "Individuals with asthma or chronic respiratory diseases should use emergency medications if their condition worsens\n";
              rec3 =
                  "Consider relocating to an area with better air quality if exposure to high levels persists.\n";
              rec4 =
                  "Warning: Rapid deterioration of lung function and increased risk of severe asthma attacks may occur, requiring immediate medical attention.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine and Flu vaccine are strongly recommended for individuals with asthma or chronic respiratory diseases to protect against infections that can worsen due to inhaling polluted air.\n";
              rec6 = "";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));
              isloading = false;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error retrieving data: $e');
    }
  }

  fetchch2o() async {
    setState(() {
      isloading = true;
    });

    try {
      List<String> documentIds = [
        "typeCH2O",
      ];

      // Iterate through each document ID
      for (String documentId in documentIds) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("catogry") //catogry
            .doc(documentId)
            .get();

        if (documentSnapshot.exists) {
          var data = documentSnapshot.data() as Map<String, dynamic>;

          if (CH2O! <= 0.1 && CH2O! >= 0) {
            setState(() {
              isloading = true;
              rec1 =
                  " • Keep indoor spaces well-ventilated, especially if using products that release formaldehyde (e.g., paints, adhesives, or pressed wood furniture).\n";
              rec2 =
                  " • Individuals with asthma or respiratory allergies can remain comfortable at this level\n";
              rec3 = "";
              rec4 = "";
              rec5 = "";
              rec6 = "";
              rec7 = "";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
              isloading = false;
            });
          } else if (CH2O! <= 0.3 && CH2O! >= 0.11) {
            setState(() {
              isloading = true;
              rec1 =
                  "  •  Increase ventilation by opening windows or using air purifiers with formaldehyde filter. \n";
              rec2 =
                  "People with asthma or respiratory issues should reduce time spent in poorly ventilated areas where formaldehyde might be present\n";
              rec3 =
                  "Warning: Mild irritation of the eyes, nose, or throat may occur for sensitive individuals.\n";
              rec4 =
                  "warning: People with respiratory conditions may experience slight discomfort or coughing.\n";
              rec5 =
                  "Vaccination: Flu vaccine is recommended to protect against respiratory infections, as formaldehyde exposure can exacerbate asthma symptoms\n";
              rec6 = "";
              rec7 = "";
              clickch2o = false;
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
              isloading = false;
            });
          } else if (CH2O! <= 0.5 && CH2O! >= 0.31) {
            setState(() {
              isloading = true;
              rec1 =
                  "Avoid using products that emit formaldehyde indoors and use activated carbon filters to remove it from the air.\n";
              rec2 =
                  "People with asthma or allergies should stay in well-ventilated areas and avoid exposure to potential formaldehyde sources\n";
              rec3 =
                  "Formaldehyde at this level may cause noticeable respiratory symptoms like coughing, wheezing, or eye irritation.\n";
              rec4 =
                  "Individuals with asthma may experience more frequent attacks or need to increase the use of inhalers.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine is recommended for individuals with respiratory conditions to reduce the risk of infections caused by weakened lung function.\n";
              rec6 =
                  "Flu vaccine is also recommended as formaldehyde can irritate the respiratory system.\n";
              rec7 = "";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                      fit: BoxFit.fill, "images/imageshighony.webp"));

              isloading = false;
            });
          } else {
            setState(() {
              isloading = true;
              rec1 =
                  "Evacuate or ventilate the area immediately. Formaldehyde at this level poses a significant health risk.\n";
              rec2 =
                  "Individuals with asthma or chronic respiratory diseases should avoid exposure entirely and seek medical advice if symptoms worsen.\n";
              rec3 =
                  "Warning: Severe respiratory symptoms such as difficulty breathing, chest tightness, and wheezing are likely at this level, especially in people with asthma or lung diseases.\n";
              rec4 =
                  "Prolonged exposure can lead to serious health issues, including lung damage.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine and Flu vaccine are strongly recommended for individuals with asthma or chronic respiratory conditions to protect against infections that could be aggravated by formaldehyde exposure.\n";
              rec6 = "";
              rec7 = "";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));
              isloading = false;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error retrieving data: $e');
    }
  }

  //end getdata (readings)
  fetcho3() async {
    setState(() {
      isloading = true;
    });

    try {
      List<String> documentIds = [
        "typeO3",
      ];

      // Iterate through each document ID
      for (String documentId in documentIds) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("catogry") //catogry
            .doc(documentId)
            .get();

        if (documentSnapshot.exists) {
          if (O3! <= 0.05 && O3! >= 0) {
            setState(() {
              isloading = true;
              rec1 =
                  "At this level, the air quality is generally good. Children, the elderly, and individuals with respiratory conditions like asthma can participate in outdoor activities without concern.\n";
              rec2 =
                  "Maintain indoor air quality by keeping windows open to allow for fresh air circulation.\n";
              rec3 = " ";
              rec4 = " ";
              rec5 = " ";
              rec6 = " ";
              rec7 = " ";
              clicko3 = false;
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));

              isloading = false;
            });
          } else if (O3! <= 0.1 && O3! >= 0.051) {
            setState(() {
              isloading = true;
              rec1 =
                  "Individuals with asthma, young children (ages 2-12), and the elderly (65+) should limit prolonged outdoor exertion.\n";
              rec2 =
                  "Use air purifiers indoors if outdoor ozone levels rise, especially in urban areas where ozone can accumulate.\n";
              rec3 =
                  "Warning: Mild irritation of the respiratory system (e.g., throat or nose irritation) may occur, especially in children, the elderly, and individuals with pre-existing lung conditions.\n";
              rec4 =
                  "Asthma sufferers may begin to notice mild symptoms such as wheezing or shortness of breath.\n";
              rec5 =
                  "Vaccination: Flu vaccine is recommended for children and the elderly to prevent respiratory infections that could be worsened by ozone exposure.\n";
              rec6 = "";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      Image.asset(fit: BoxFit.fill, "images/images mid.webp"));

              isloading = false;
            });
          } else if (O3! <= 0.15 && O3! >= 0.101) {
            setState(() {
              isloading = true;
              rec1 =
                  "Children, the elderly, and individuals with asthma or other respiratory diseases should avoid outdoor activities, particularly in the afternoon when ozone levels tend to peak.\n";
              rec2 =
                  "Keep doors and windows closed and use indoor air filtration systems to maintain safe indoor air\n";
              rec3 =
                  "Warning: Noticeable respiratory symptoms such as coughing, shortness of breath, or chest tightness may occur for sensitive groups (especially children and the elderly).\n";
              rec4 =
                  "Increased risk of asthma attacks, particularly in children and older adults.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine is recommended for adults 65+ and individuals with asthma or chronic respiratory conditions to protect against lung infections, which ozone exposure can exacerbate.\n";
              rec6 =
                  "Flu vaccine is also recommended, as compromised respiratory health makes it easier for viral infections to occur.\n";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                      fit: BoxFit.fill, "images/imageshighony.webp"));

              isloading = false;
            });
          } else {
            setState(() {
              isloading = true;
              rec1 =
                  "Avoid going outdoors entirely, especially for vulnerable groups (children, the elderly, and individuals with asthma or chronic lung diseases).\n";
              rec2 =
                  "Ozone levels at this range are hazardous and can significantly impair lung function. Use air filtration systems with HEPA filters to maintain indoor air quality\n";
              rec3 =
                  "Asthma patients should follow emergency protocols and seek medical attention if their condition worsens.\n";
              rec4 =
                  "Warning: Severe respiratory symptoms such as difficulty breathing, chest pain, and wheezing are likely for all age groups, particularly for those with pre-existing lung conditions.\n";
              rec5 =
                  "Children and the elderly are at a higher risk for lung inflammation and reduced lung function, which may require hospitalization.\n";
              rec6 =
                  "Vaccination: Pneumococcal vaccine is highly recommended for children under 2, adults 65+, and anyone with asthma or chronic lung conditions, as exposure to high ozone levels can increase susceptibility to lung infections.\n";
              rec7 =
                  "Flu vaccine is recommended for all ages, but especially for children, elderly individuals, and those with respiratory conditions to help prevent exacerbation of symptoms.\n";

              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));
              isloading = false;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error retrieving data: $e');
    }
  }

  fetchco() async {
    setState(() {
      isloading = true;
    });

    try {
      List<String> documentIds = [
        "typeCO",
      ];

      // Iterate through each document ID
      for (String documentId in documentIds) {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection("catogry") //catogry
            .doc(documentId)
            .get();

        if (documentSnapshot.exists) {
          if (CO! <= 5 && CO! >= 0) {
            setState(() {
              isloading = true;
              rec1 =
                  " This level is generally safe for all individuals, including children, the elderly, and those with respiratory issues.\n";
              rec2 = "";
              rec3 = "";
              rec4 = "";
              rec5 = "";
              rec6 = "";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));

              isloading = false;
            });
          } else if (CO! <= 15 && CO! >= 6) {
            setState(() {
              isloading = true;
              rec1 =
                  "Individuals with heart disease or respiratory issues should be cautious and minimize exposure, particularly in poorly ventilated spaces.\n";
              rec2 =
                  "Ensure that carbon monoxide detectors are installed and functioning in homes and workplaces.\n";
              rec3 =
                  "Warning: Some sensitive individuals may experience mild symptoms, such as headache or dizziness.\n";
              rec4 =
                  "Vaccination: Flu vaccine is recommended for individuals with heart or respiratory conditions, as they may be at higher risk of complications from infections.\n";
              rec5 = "";
              rec6 = "";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      Image.asset(fit: BoxFit.fill, "images/images mid.webp"));

              isloading = false;
            });
          } else if (CO! <= 35 && CO! >= 16) {
            setState(() {
              isloading = true;
              rec1 =
                  "Individuals with respiratory diseases (especially children and the elderly) should avoid prolonged exposure and consider staying indoors with fresh air.\n";
              rec2 =
                  "Use carbon monoxide detectors to alert occupants of rising levels and ventilate the area immediately if readings increase.\n";
              rec3 =
                  "Warning: Symptoms such as headache, dizziness, and fatigue may be experienced, particularly in sensitive populations\n";
              rec4 =
                  "Individuals with heart conditions may face increased risks of complications.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine is recommended for individuals with heart or respiratory conditions to protect against lung infections.\n";
              rec6 =
                  "Flu vaccine is also recommended to prevent respiratory infections that could worsen symptoms\n";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                      fit: BoxFit.fill, "images/imageshighony.webp"));

              isloading = false;
            });
          } else {
            setState(() {
              isloading = true;
              rec1 =
                  "Evacuate the area immediately. High levels of carbon monoxide pose serious health risks.\n";
              rec2 =
                  "Ensure that all individuals, especially vulnerable groups (children, elderly, and those with respiratory or heart issues), are moved to fresh air.\n";
              rec3 =
                  "Warning: Severe symptoms such as confusion, impaired vision, and loss of consciousness can occur. Individuals with respiratory diseases may experience a rapid decline in lung function\n";
              rec4 =
                  "Prolonged exposure can lead to coma or death, making immediate action crucial.\n";
              rec5 =
                  "Vaccination: Pneumococcal vaccine and Flu vaccine are highly recommended for vulnerable groups to protect against respiratory infections that may arise in the context of carbon monoxide exposure.\n";
              rec6 = "";
              rec7 = "";
              imageWidget = ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));
              isloading = false;
            });
          }
        }
      }
    } catch (e) {
      setState(() {
        isloading = false;
      });
      print('Error retrieving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Medical page "),
          backgroundColor: Colors.purple[200]),
      body: Stack(children: [
        PageView(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Text("  ## according to the input gas CO2 value..."),
                InkWell(
                  onTap: () async {
                    await getData();
                    await fetchco2();
                  },
                  child: Text(
                    "<click here> ",
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ),
                imageWidget,
                Text(
                  clickco2 ? 'the recommenddations:\n ' : "",
                  style: TextStyle(color: Colors.black),
                ),
                Text(rec1!),
                Text(rec2!),
                Text(rec3!),
                Text(rec3!),
                Text(rec4!),
                Text(rec5!),
                Text(rec6!),
                Text(rec7!)
              ]),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Text(" ## according to the input gas PM2.5 value...\n"),
                InkWell(
                  onTap: () async {
                    await getData();
                    await fetchpm25();
                  },
                  child: Text(
                    "<click here>",
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ),
                imageWidget,
                Text(
                  'the recommendations\n ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(rec1!),
                Text(rec2!),
                Text(rec3!),
                Text(rec3!),
                Text(rec4!),
                Text(rec5!),
                Text(rec6!),
                Text(rec7!)
              ]),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Text(" ## according to the input gas O3 value..."),
                InkWell(
                  onTap: () async {
                    await getData();
                    await fetcho3();
                  },
                  child: Text(
                    "<click here>",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 24),
                  ),
                ),
                imageWidget,
                Text(
                  'the recommendations:\n ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(rec1!),
                Text(rec2!),
                Text(rec3!),
                Text(rec3!),
                Text(rec4!),
                Text(rec5!),
                Text(rec6!),
                Text(rec7!)
              ]),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Text(" ## according to the input gas CH2O value..."),
                InkWell(
                  onTap: () async {
                    await getData();
                    await fetchch2o();
                  },
                  child: Text(
                    "<click here>",
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ),
                imageWidget,
                Text(
                  'the recommendations:\n  ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(rec1!),
                Text(rec2!),
                Text(rec3!),
                Text(rec3!),
                Text(rec4!),
                Text(rec6!),
                Text(rec7!)
              ]),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: ListView(children: [
                Text(" ## according to the input gas CO value..."),
                InkWell(
                  onTap: () async {
                    await getData();
                    await fetchco();
                  },
                  child: Text(
                    "<click here>",
                    style: TextStyle(color: Colors.blue, fontSize: 24),
                  ),
                ),
                imageWidget,
                Text(
                  'The recommendations:\n  ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(rec1!),
                Text(rec2!),
                Text(rec3!),
                Text(rec3!),
                Text(rec4!),
                Text(rec5!),
                Text(rec6!),
                Text(rec7!)
              ]),
            ),
          ],
        ),
        if (isloading) // هنا نستخدم الشرط بشكل صحيح
          Center(child: CircularProgressIndicator())
      ]),
    );
  }
}
