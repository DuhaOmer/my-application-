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
  runApp(const MedicalPage());
}

class MedicalPage extends StatefulWidget {
  const MedicalPage(
      {super.key}); // Fix here: widget constructor is missing a key
  @override
  _MedicalPageState createState() =>
      _MedicalPageState(); // Fix here: createState() with correct spelling
}

class _MedicalPageState extends State<MedicalPage> {
  GlobalKey<FormState> formState1 = GlobalKey();
  double? Tmp;
  double? CO2, NO2, PM1, PM10, PM25, CH2O, O3, CO, Temp, Humidity;
  bool isloading = false;
  int ima = 1;
  List<String> selectedRecCH2O = [];
  List<String> selectedRecPM25 = [];
  List<String> selectedRecTemp = [];
  List<String> selectedRecPM10 = [];
  List<String> selectedRecCO2 = [];
  List<String> selectedRecCO = [];
  List<String> selectedRecO3 = [];
  String range = "";
  String range_co2 = "";
  String range_pm25 = "";
  String range_o3 = "";
  String range_co = "";
  String range_ch2o = "";
  Widget imageWidgetco2 = Container();
  Widget imageWidgetpm25 = Container();
  Widget imageWidgetch2o = Container();
  Widget imageWidgeto3 = Container();
  Widget imageWidgetco = Container();
  String age = "";
  String x1 = "";

  @override
  @override
  void initState() {
    super.initState(); // تأكد من استدعاء super.initState()
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
            O3 = documentSnapshot['O3'] ?? 0;
            PM1 = documentSnapshot['PM1'] ?? 0;
            PM10 = documentSnapshot['PM10'] ?? 0;
            PM25 = documentSnapshot['PM25'] ?? 0;
            NO2 = documentSnapshot['NO2'] ?? 0;
            Temp = documentSnapshot['Temp'] ?? 0;
            age = documentSnapshot['age'] ?? 0;
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

  void chekage(age, PM25, CO2, PM10, NO2, O3, CH2O, CO) {
    if ((PM25! > 50 || CO2! > 1000) && age == '0-5') {
      x1 =
          'We recommend the pneumonia vaccine for young children due to high pollution levels.';
    } else if (age == '6-15' && (PM10! > 100 || O3! > 0.05)) {
      x1 =
          "We recommend the annual flu vaccine for children due to high ozone levels.";
    } else if (age == '16-30' && (NO2! > 40 || CH2O! > 0.1)) {
      x1 =
          "We recommend the flu or whooping cough vaccine to protect the respiratory system.";
    } else if (age == '31-50' && (CO! > 9)) {
      x1 =
          "We recommend the pneumonia and flu vaccines for adults due to high pollution levels ";
    } else if (age == 'more than 50' && (CO2! > 1000 || PM25! > 50)) {
      x1 =
          "We recommend the pneumonia and flu vaccines for seniors due to high pollution levels.";
    } else {
      x1 = "No specific vaccine recommendations based on the entered data .";
    }
  }

  Future<void> addmid_pm25() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("midpm25");

      final data1 = {
        'low': [
          // 0-12
          " Clean Air: PM2.5 levels in this range are relatively safe, indicating good air quality. You can enjoy outdoor activities without concern."
              " Physical Activity: Engage in physical activities outdoors, such as walking or jogging, without needing precautions.",
          " Avoid Smoking: Continue to avoid smoking or exposure to smoke, even in good air quality environments, as smoking adds additional pollutants",
          " Continuous Monitoring: Regularly check air quality reports, as conditions can change, and precautions may be needed if PM2.5 levels rise.",
          " Boost Immunity: Eat a balanced diet rich in vitamins and minerals to support respiratory health and the immune system",
        ],
        'mid': [
          //12-35
          "People with asthma or respiratory issues should be cautious and use preventive inhalers. Avoid prolonged outdoor activities, especially in poorly ventilated areas Studies have shown that even at lower PM₂.₅ concentrations, each 1 µg/m³ increase is associated with a 3% rise in asthma symptoms among adults.",
          "Use Preventive Inhalers: Ensure adherence to prescribed preventive inhaler regimens to manage airway inflammation effectively"
              " Warning: Mild respiratory symptoms like coughing or shortness of breath may start to appear for individuals with respiratory diseases",

          //   "Vaccination: Flu vaccine is recommended for individuals with asthma or respiratory diseases, as polluted air can increase the risk of respiratory infections."
        ],
        'high': [
          //36-55
          "Wear face masks (such as N95) to reduce the inhalation of fine particles.",
          "Asthma or allergy sufferers should stay indoors in well-ventilated or air-filtered spaces and avoid outdoor activities",
          "Use air purifiers at home to help reduce the impact of fine particulate matter.",
          "Warning: Respiratory symptoms such as wheezing or coughing may significantly worsen for individuals with asthma and allergies.",
          //       "Vaccination: Pneumococcal vaccine is recommended for individuals with asthma or respiratory problems to protect against lung infections, which can be exacerbated in polluted air.",
          //     "Flu vaccine is recommended for all ages, especially those with respiratory conditions."
        ],
        'vhigh': [
          // more than 55
          " Avoid going outdoors entirely and stay in air-filtered indoor environments.",
          " Individuals with asthma or chronic respiratory diseases should use emergency medications if their condition worsens",
          "Consider relocating to an area with better air quality if exposure to high levels persists.",
          " Warning: Rapid deterioration of lung function and increased risk of severe asthma attacks may occur, requiring immediate medical attention.",
          //   "Vaccination: Pneumococcal vaccine and Flu vaccine are strongly recommended for individuals with asthma or chronic respiratory diseases to protect against infections that can worsen due to inhaling polluted air."
        ]
      };
      //    for (String level in data1.keys) {
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midpm25")
          .collection("recommendations")
          .doc("allrange")
          .set(data1, SetOptions(merge: true));
      //  }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  } //the next

  Future<void> addmid_co2() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("midco2");

      final data1 = {
        'low': [
          // 0 to 600
          " Maintain proper ventilation to keep air quality healthy.",
          " Ensure windows are open regularly, especially in closed environments.",
          " Use indoor plants to help keep CO2 levels low."
        ],
        'mid': [
          // 600 to 1000
          " Increase ventilation by opening windows or using air purifiers.",
          " Limit time spent in crowded or poorly ventilated indoor spaces",
          " Regularly check CO2 levels if you work in enclosed areas.",
          " Warning: Prolonged exposure at this level may cause mild symptoms like drowsiness, headaches, and reduced focus  especially if the exposure is prolonged.",
          //      " Vaccination: Flu vaccine is recommended, especially for children under 5 years and adults over 65, as compromised air quality can make respiratory symptoms worse.",
        ],
        'high': [
          // 1000 1500
          " Improve ventilation immediately by using mechanical ventilation systems or moving to a more open area.",
          " Avoid strenuous activities in closed spaces at this level.",
          " Monitor CO2 levels regularly if you’re in high-risk locations such as classrooms, offices, or public transport",
          " Warning: Breathing air with this level of CO2 can lead to headaches, dizziness, and shortness of breath, especially for people with pre-existing respiratory conditions",
          "Control Indoor Sources: Limit activities that produce CO₂, such as burning fossil fuels indoors, and ensure appliances are properly vented."
          // " Vaccination: Pneumococcal vaccine is recommended for older adults (65+ years) and children (under 2 years), as they are more vulnerable to respiratory infections.",
          //   " Flu vaccine is also recommended for individuals with weakened immune systems."
        ],
        'vhigh': [
          //more than 1500
          " Evacuate the area and move to a well-ventilated or outdoor space immediately.",

          " Call emergency services if symptoms worsen, such as confusion, rapid heartbeat, or difficulty breathing.",
          " install CO2 monitors if exposure is frequent in specific locations.",
          " Warning: High levels of CO2 can cause serious health issues like hyperventilation, increased heart rate, confusion, unconsciousness, and even asphyxiation if not addressed quickly",
          " High risk for children, elderly, and those with respiratory diseases like asthma or COPD.",
          "CO2 levels above 2,000 ppm have been shown to increase occupant complaints of room “stuffiness” as well as statistically higher levels of negative respiratory effects.",
          "warning in this is very high range cause headaches ,fatigue,stagant ,stuffiness,poor concantration,loss of focus,increase heart rate nausea",
          "Children are at a higher risk of respiratory issues due to air pollution exposure, which can lead to conditions such as acute respiratory infections, asthma, and decreased lung function",
          "Elderly: Older adults are more susceptible to respiratory illnesses, and exposure to elevated CO₂ levels can exacerbate existing health conditions",
          " For those with asthma or COPD, elevated CO₂ levels can worsen symptoms, leading to increased shortness of breath, wheezing, and other respiratory difficulties"
          //        " Vaccination: Pneumococcal vaccine for those over 65 and those with chronic health issues, as respiratory infections are more likely in poor air conditions",
//          " COVID-19 vaccine for individuals over 12 years to prevent any exacerbation of respiratory issues caused by both poor air quality and infection"
        ]
      };
      // for (String level in data1.keys) {
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midco2")
          .collection("recommendations")
          .doc("allrange")
          .set(data1, SetOptions(merge: true));
      // }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  } //the next pm10

  Future<void> addmid_o3() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("mido3");

      final data1 = {
        'low': [
          " At this level, the air quality is generally good. Children, the elderly, and individuals with respiratory conditions like asthma can participate in outdoor activities without concern.",
          " Maintain indoor air quality by keeping windows open to allow for fresh air circulation.",
        ],
        'mid': [
          " Individuals with asthma, should limit prolonged outdoor exertion.",
          " Use air purifiers indoors if outdoor ozone levels rise, especially in urban areas where ozone can accumulate.",
          " Warning: Mild irritation of the respiratory system (e.g., throat or nose irritation) may occur, especially in children, the elderly, and individuals with pre-existing lung conditions.",
          " Asthma sufferers may begin to notice mild symptoms such as wheezing or shortness of breath."
          //        " Vaccination: Flu vaccine is recommended for children and the elderly to prevent respiratory infections that could be worsened by ozone exposure."
        ],
        'high': [
          " Children, the elderly, and individuals with asthma or other respiratory diseases should avoid outdoor activities, particularly in the afternoon when ozone levels tend to peak.",
          " Keep doors and windows closed and use indoor air filtration systems to maintain safe indoor air",
          " Warning: Noticeable respiratory symptoms such as coughing, shortness of breath, or chest tightness may occur for sensitive groups (especially children and the elderly).",
          " Increased risk of asthma attacks, particularly in children and older adults.",
          //  " Vaccination: Pneumococcal vaccine is recommended for adults 65+ and individuals with asthma or chronic respiratory conditions to protect against lung infections, which ozone exposure can exacerbate.",
          //" Flu vaccine is also recommended, as compromised respiratory health makes it easier for viral infections to occur."
        ],
        'vhigh': [
          " Avoid going outdoors entirely, especially for vulnerable groups (children, the elderly, and individuals with asthma or chronic lung diseases).",
          " Ozone levels at this range are hazardous and can significantly impair lung function. Use air filtration systems with HEPA filters to maintain indoor air quality",
          " Asthma patients should follow emergency protocols and seek medical attention if their condition worsens.",
          " Warning: Severe respiratory symptoms such as difficulty breathing, chest pain, and wheezing are likely for all age groups, particularly for those with pre-existing lung conditions.",
          " Children and the elderly are at a higher risk for lung inflammation and reduced lung function, which may require hospitalization.",
          //    " Vaccination: Pneumococcal vaccine is highly recommended for children under 2, adults 65+, and anyone with asthma or chronic lung conditions, as exposure to high ozone levels can increase susceptibility to lung infections.",
          //  "Flu vaccine is recommended for all ages, but especially for children, elderly individuals, and those with respiratory conditions to help prevent exacerbation of symptoms."
        ]
      };
      //  for (String level in data1.keys) {
      await FirebaseFirestore.instance
          .collection("catogry") //catogry
          .doc("mido3")
          .collection("recommendations")
          .doc("allrange")
          .set(data1, SetOptions(merge: true));
      //   }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  Future<void> addmid_ch2o() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("midch2o");

      final data1 = {
        'low': [
          "The U.S. Environmental Protection Agency (EPA) has established a reference concentration (RfC) for formaldehyde at 0.007 mg/m³, indicating the maximum safe level for continuous inhalation exposure without appreciable risk of adverse health effects.",
          " Keep indoor spaces well-ventilated, especially if using products that release formaldehyde (e.g., paints, adhesives, or pressed wood furniture).",
          " Individuals with asthma or respiratory allergies can remain comfortable at this level",
        ],
        'mid': [
          "Formaldehyde exposure can exacerbate respiratory symptoms, leading to discomfort or coughing. Ensuring proper ventilation and reducing exposure to formaldehyde-emitting sources can help mitigate these health risks."
              " Increase ventilation by opening windows or using air purifiers with formaldehyde filters.",
          " People with asthma or respiratory issues should reduce time spent in poorly ventilated areas where formaldehyde might be present",
          //     " Warning: Mild irritation of the eyes, nose, or throat may occur for sensitive individuals.",
          //   " warning: People with respiratory conditions may experience slight discomfort or coughing.",
          "Choose Low-Emission Products: Opt for building materials, furniture, and household products labeled as low in formaldehyde emissions."
              "Avoid Tobacco Smoke: Tobacco smoke is a significant source of formaldehyde; avoiding smoking indoors can reduce exposure.",

          // " Vaccination: Flu vaccine is recommended to protect against respiratory infections, as formaldehyde exposure can exacerbate asthma symptoms"
        ],
        'high': [
          " Avoid using products that emit formaldehyde indoors and use activated carbon filters to remove it from the air.",
          " People with asthma or allergies should stay in well-ventilated areas and avoid exposure to potential formaldehyde sources",
          " Formaldehyde at this level may cause noticeable respiratory symptoms like coughing, wheezing, or eye irritation.",
          " Individuals with asthma may experience more frequent attacks or need to increase the use of inhalers.",
          //       " Vaccination: Pneumococcal vaccine is recommended for individuals with respiratory conditions to reduce the risk of infections caused by weakened lung function.",
          //     " Flu vaccine is also recommended as formaldehyde can irritate the respiratory system.",
        ],
        'vhigh': [
          " Avoid using products that emit formaldehyde indoors and use activated carbon filters to remove it from the air.",
          " People with asthma or allergies should stay in well-ventilated areas and avoid exposure to potential formaldehyde sources",
          " Formaldehyde at this level may cause noticeable respiratory symptoms like coughing, wheezing, or eye irritation.",
          " Individuals with asthma may experience more frequent attacks or need to increase the use of inhalers.",
          //   " Vaccination: Pneumococcal vaccine is recommended for individuals with respiratory conditions to reduce the risk of infections caused by weakened lung function.",
          // " Flu vaccine is also recommended as formaldehyde can irritate the respiratory system."
        ]
      };
      //  for (String level in data1.keys) {
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midch2o")
          .collection("recommendations")
          .doc("allrange")
          .set(data1, SetOptions(merge: true));
      //   }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  Future<void> addmid_co() async {
    try {
      setState(() {
        isloading = true;
      });
      var docRef =
          FirebaseFirestore.instance.collection("catogry").doc("midch2o");

      final data1 = {
        'low': [
          " This level is generally safe for all individuals, including children, the elderly, and those with respiratory issues.",
        ],
        'mid': [
          " Individuals with heart disease or respiratory issues should be cautious and minimize exposure, particularly in poorly ventilated spaces.",
          " Ensure that carbon monoxide detectors are installed and functioning in homes and workplaces.",
          " Warning: Some sensitive individuals may experience mild symptoms, such as headache or dizziness.",
          //   " Vaccination: Flu vaccine is recommended for individuals with heart or respiratory conditions, as they may be at higher risk of complications from infections."
        ],
        'high': [
          " Individuals with respiratory diseases (especially children and the elderly) should avoid prolonged exposure and consider staying indoors with fresh air.",
          " Use carbon monoxide detectors to alert occupants of rising levels and ventilate the area immediately if readings increase.",
          " Warning: Symptoms such as headache, dizziness, and fatigue may be experienced, particularly in sensitive populations",
          " Individuals with heart conditions may face increased risks of complications.",
          //   " Vaccination: Pneumococcal vaccine is recommended for individuals with heart or respiratory conditions to protect against lung infections.",
          // " Flu vaccine is also recommended to prevent respiratory infections that could worsen symptoms"
        ],
        'vhigh': [
          " Individuals with respiratory diseases (especially children and the elderly) should avoid prolonged exposure and consider staying indoors with fresh air.",
          " Use carbon monoxide detectors to alert occupants of rising levels and ventilate the area immediately if readings increase.",
          " Warning: Symptoms such as headache, dizziness, and fatigue may be experienced, particularly in sensitive populations",
          " Individuals with heart conditions may face increased risks of complications.",
          //   " Vaccination: Pneumococcal vaccine is recommended for individuals with heart or respiratory conditions to protect against lung infections.",
          // " Flu vaccine is also recommended to prevent respiratory infections that could worsen symptoms"
        ]
      };
      //  for (String level in data1.keys) {
      await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midco")
          .collection("recommendations")
          .doc("allrange")
          .set(data1, SetOptions(merge: true));
      //    }

      setState(() {
        isloading = false;
      });
    } catch (e) {
      print("Error adding reading: $e");
    }
  }

  fetchco2() async {
    try {
      setState(() {
        isloading = true;
      });
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midco2")
          .collection("recommendations")
          .doc("allrange")
          .get();

      if (docSnapshot.exists) {
        List<dynamic> recommendations;
        setState(() {
          recommendations = docSnapshot[range_co2] ?? [];
          selectedRecCO2 = List<String>.from(recommendations);
          isloading = false;
        });
      } else {
        print("Document not found for range $range.");
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
    if (CO2! <= 800 && CO2! >= 0) {
      setState(() {
        isloading = true;
        range_co2 = 'low';
        ima = 1;
        imageWidgetco2 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
        isloading = false;
      });
    } else if (CO2! <= 1000 && CO2! >= 801) {
      setState(() {
        isloading = true;
        range_co2 = 'mid';
        ima = 2;
        imageWidgetco2 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
        isloading = false;
      });
    } else if (CO2! <= 1500 && CO2! >= 1001) {
      setState(() {
        isloading = true;
        range_co2 = 'high';
        imageWidgetco2 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/imageshighony.webp"));
        isloading = false;
      });
    } else {
      setState(() {
        isloading = true;
        range_co2 = 'vhigh';
        imageWidgetco2 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));

        isloading = false;
      });
    }
  }

  fetchpm25() async {
    try {
      setState(() {
        isloading = true;
      });
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midpm25")
          .collection("recommendations")
          .doc("allrange")
          .get();

      if (docSnapshot.exists) {
        // Retrieve the specific range recommendations
        List<dynamic> recommendations;
        setState(() {
          recommendations = docSnapshot[range_pm25] ?? [];
          selectedRecPM25 = List<String>.from(recommendations);
          isloading = false;
        });
      } else {
        print("Document not found for range $range.");
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
    if (PM25! <= 12 && PM25! >= 0) {
      setState(() {
        isloading = true;
        range_pm25 = 'low';
        ima = 1;
        imageWidgetpm25 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
        isloading = false;
      });
    } else if (PM25! <= 35 && PM25! >= 13) {
      setState(() {
        isloading = true;
        range_pm25 = 'mid';
        ima = 2;
        imageWidgetpm25 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
        isloading = false;
      });
    } else if (PM25! <= 55 && PM25! >= 36) {
      setState(() {
        isloading = true;
        range_pm25 = 'high';
        imageWidgetpm25 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/imageshighony.webp"));
        isloading = false;
      });
    } else {
      setState(() {
        isloading = true;
        range_pm25 = 'vhigh';
        imageWidgetpm25 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));

        isloading = false;
      });
    }
  }

  fetchCH2O() async {
    try {
      setState(() {
        isloading = true;
      });
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midch2o")
          .collection("recommendations")
          .doc("allrange")
          .get();

      if (docSnapshot.exists) {
        // Retrieve the specific range recommendations
        List<dynamic> recommendations;
        setState(() {
          recommendations = docSnapshot[range_ch2o] ?? [];
          selectedRecCH2O = List<String>.from(recommendations);
          isloading = false;
        });
        //  print("بيانات المستند:  ${recommendations}  ");
      } else {
        print("Document not found for range $range.");
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
    if (CH2O! <= 0.03 && CH2O! >= 0) {
      // in unit mg/m³
      setState(() {
        isloading = true;
        range_ch2o = 'low';
        ima = 1;
        imageWidgetch2o = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
        isloading = false;
      });
    } else if (CH2O! <= 0.08 && CH2O! >= 0.031) {
      setState(() {
        isloading = true;
        range_ch2o = 'mid';
        ima = 2;
        imageWidgetch2o = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
        isloading = false;
      });
    } else if (CH2O! <= 0.1 && CH2O! >= 0.081) {
      setState(() {
        isloading = true;
        range_ch2o = 'high';
        imageWidgetch2o = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/imageshighony.webp"));
        isloading = false;
      });
    } else {
      setState(() {
        isloading = true;
        range_ch2o = 'vhigh';
        imageWidgetch2o = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));

        isloading = false;
      });
    }
  }

  fetchO3() async {
    try {
      setState(() {
        isloading = true;
      });
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("catogry")
          .doc("mido3")
          .collection("recommendations")
          .doc("allrange")
          .get();

      if (docSnapshot.exists) {
        // Retrieve the specific range recommendations

        setState(() {
          List<dynamic> recommendations = docSnapshot[range_o3] ?? [];
          selectedRecO3 = List<String>.from(recommendations);
          isloading = false;
        });
      } else {
        print("Document not found for range $range.");
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
    if (O3! <= 0.05 && O3! >= 0) {
      //o3
      setState(() {
        isloading = true;
        range_o3 = 'low';
        ima = 1;
        imageWidgeto3 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
        isloading = false;
      });
    } else if (O3! <= 0.1 && O3! >= 0.051) {
      setState(() {
        isloading = true;
        range_o3 = 'mid';
        ima = 2;
        imageWidgeto3 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
        isloading = false;
      });
    } else if (O3! <= 0.15 && O3! >= 0.1001) {
      setState(() {
        isloading = true;
        range_o3 = 'high';
        imageWidgeto3 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/imageshighony.webp"));
        isloading = false;
      });
    } else {
      setState(() {
        isloading = true;
        range_o3 = 'vhigh';
        imageWidgeto3 = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));

        isloading = false;
      });
    }
  }

  fetchCO() async {
    try {
      setState(() {
        isloading = true;
      });
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("catogry")
          .doc("midco")
          .collection("recommendations")
          .doc("allrange")
          .get();

      if (docSnapshot.exists) {
        // Retrieve the specific range recommendations
        List<dynamic> recommendations = docSnapshot[range_co] ?? [];
        setState(() {
          selectedRecCO = List<String>.from(recommendations);
          isloading = false;
        });
      } else {
        print("Document not found for range $range.");
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print("Error fetching range recommendations: $e");
      setState(() {
        isloading = false;
      });
    }
    if (CO! <= 5 && CO! >= 0) {
      //o3
      setState(() {
        isloading = true;
        range_co = 'low';
        ima = 1;
        imageWidgetco = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/low risk.webp"));
        isloading = false;
      });
    } else if (CO! <= 15 && CO! >= 6) {
      setState(() {
        isloading = true;
        range_co = 'mid';
        ima = 2;
        imageWidgetco = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/images mid.webp"));
        isloading = false;
      });
    } else if (CO! <= 35 && CO! >= 16) {
      setState(() {
        isloading = true;
        range_co = 'high';
        imageWidgetco = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/imageshighony.webp"));
        isloading = false;
      });
    } else {
      setState(() {
        isloading = true;
        range_co = 'vhigh';
        imageWidgetco = ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(fit: BoxFit.fill, "images/veryrisk.webp"));

        isloading = false;
      });
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
            ListView(children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(15),
                color: Colors.purple[200],
                child: MaterialButton(
                  onPressed: () async {
                    await getData();
                    await addmid_co2();
                    await fetchco2();
                    await addmid_pm25();
                    await fetchpm25();
                    await addmid_ch2o();
                    await fetchCH2O();
                    await addmid_o3();
                    await fetchO3();
                    await fetchco2();
                    await addmid_co();
                    await fetchCO();
                    chekage(age, PM25, CO2, PM10, NO2, O3, CH2O, CO);
                  },
                  child: Text(
                    "  to show medical recommendatios click here then swipe right",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: age == ''
                      ? Container()
                      : Container(
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple),
                          ),
                          child: ListTile(
                            title: Text(
                              "vaccines",
                              style: TextStyle(color: Colors.purple),
                            ),
                            subtitle: Text(x1, maxLines: 3),
                            isThreeLine: true,
                          ),
                        ))
            ]),
            ListView(children: [
              Text(
                " ## according to the input gas CO2 value...",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              imageWidgetco2,
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecCO2.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(selectedRecCO2[index])));
                  }),
            ]),
            ListView(children: [
              InkWell(
                child: Text(
                  "## according to the input gas PM2.5 value...\n",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              imageWidgetpm25,
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecPM25.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(selectedRecPM25[index])));
                  })
            ]),
            ListView(children: [
              InkWell(
                child: Text(
                  "## according to the input gas O3 value...",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              imageWidgeto3,
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecO3.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(selectedRecO3[index])));
                  }),
            ]),
            ListView(children: [
              InkWell(
                child: Text(
                  " ## according to the input gas CO value..",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ),
              imageWidgetco,
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecCO.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(selectedRecCO[index])));
                  }),
            ]),
            ListView(children: [
              InkWell(
                child: Text(
                  "## according to the input gas CH2O value..",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ),
              imageWidgetch2o,
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectedRecCH2O.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(selectedRecCH2O[index])));
                  }),
            ]),
          ],
        ),
        if (isloading) Center(child: CircularProgressIndicator())
      ]),
    );
  }
}
