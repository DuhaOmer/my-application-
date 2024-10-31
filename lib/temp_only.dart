import 'package:air_quality/after_submitted.dart.';
import 'package:flutter/material.dart';

void main() {
  runApp(const TempLevel());
}

class TempLevel extends StatelessWidget {
  const TempLevel({super.key}); // تأكد من وجود هذا المفتاح

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 97, 147, 187),
        title: const Text("Temperature "),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  "   ##Level of temp according to the value of temp sensor")),
          Row(children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Text(""),
                )),
            Expanded(flex: 3, child: Text("very cold [Below 0°C]")),
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3),
                      color: Colors.blue),
                )),
          ]),
//Row2
          Row(children: [
            Expanded(
                flex: 3,
                child: Container(
                  child: Text(""),
                )),
            Expanded(flex: 3, child: Text("cold ~[0-10]°C")),
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3),
                      color: Colors.lightBlue),
                )),
          ]),
          //Row 3
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(flex: 3, child: Container()),
            Expanded(flex: 3, child: Text("Mid ~[10-20]°C")),
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                    color: Colors.green,
                  ),
                )),
          ]),
          //Row 4
          Row(children: [
            Expanded(flex: 3, child: Container()),
            Expanded(flex: 3, child: Text("warm ~[20-30]°C")),
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                    color: Colors.yellow,
                  ),
                )),
          ]),
          //Row 5
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(flex: 3, child: Container()),
            Expanded(flex: 3, child: Text("Hot [above 30°C]")),
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  //   margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 3),
                      color: Colors.red),
                )),
          ]),
          //text container
          SizedBox(
              height: 300,
              child: Card(
                child: Container(
                    // height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 29, 134, 220),
                    margin: EdgeInsets.all(5),
                    child: ListView(children: [
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Very Cold: Below 0°C",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " !Protect your self ",
                            style: TextStyle(fontSize: 16),
                          )),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "  #Wear multiple layers of warm clothing, including thermal wear, sweaters, coats, hats, gloves, and scarves.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Ensure exposed skin is covered to prevent frostbite.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          " Use insulated boots and socks to keep feet warm",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Stay indoors as much as possible, especially during extreme cold or windy conditions.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Avoid Illness:Cold weather can weaken the immune system, making you more susceptible to colds, flu, and hypothermia. Keep your home heated and stay hydrated.",
                            style: TextStyle(fontSize: 15),
                          ))
                    ])),
              )),
          //container 2
          SizedBox(
              height: 300,
              child: Card(
                child: Container(
                    //height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 77, 136, 163),
                    margin: EdgeInsets.all(10),
                    child: ListView(children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          " Cold: 0°C to 10°C",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " !Protect your self",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Wear layers, including a warm jacket, scarf, and gloves.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Ensure your home is heated, especially during night hours.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Cover your head and neck to reduce heat loss from the body.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Wear shoes or boots that keep your feet dry and warm.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Avoid Illness:Cold air can dry out your nasal passages, increasing the risk of respiratory infections. Use a humidifier at home to maintain moisture in the air.",
                            style: TextStyle(fontSize: 15),
                          )),
                    ])),
              )),
          //container 3
          SizedBox(
              height: 300,
              child: Card(
                child: Container(
                    // height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 80, 143, 82),
                    margin: EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " Mid: 10°C to 20°C",
                              style: TextStyle(fontSize: 16),
                            )),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " !Protect your self",
                              style: TextStyle(fontSize: 15),
                            )),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " Dress in light layers that can be easily adjusted depending on changing conditions.",
                              style: TextStyle(fontSize: 15),
                            )),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " Keep a jacket or sweater handy for cooler mornings or evenings.",
                              style: TextStyle(fontSize: 15),
                            )),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " Stay hydrated, as mild temperatures can still cause dehydration if you're active.",
                              style: TextStyle(fontSize: 15),
                            )),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              " Avoid Illness:Seasonal allergies may become an issue in mild temperatures, so keep windows closed during high pollen times if you're sensitive.",
                              style: TextStyle(fontSize: 15),
                            ))
                      ],
                    )),
              )),
          SizedBox(
              height: 300,
              child: Card(
                child: Container(
                    // height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 168, 160, 85),
                    margin: EdgeInsets.all(10),
                    child: ListView(children: [
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Warm: 20°C to 30°C",
                            style: TextStyle(fontSize: 16),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " !Protect your self",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Wear light, breathable clothing made of cotton or linen to keep cool.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Use sunscreen and wear sunglasses to protect your skin and eyes from UV rays.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Try to stay in the shade or air-conditioned areas during peak heat times.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Avoid Illness:Overheating can lead to heat exhaustion or heat stroke. Take regular breaks in cooler areas if you're outdoors.",
                            style: TextStyle(fontSize: 15),
                          ))
                    ])),
              )),

          SizedBox(
              height: 300,
              child: Card(
                child: Container(
                    // height: 200,
                    width: 200,
                    color: const Color.fromARGB(255, 147, 58, 49),
                    margin: EdgeInsets.all(10),
                    child: ListView(children: [
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Hot: Above 30°C",
                            style: TextStyle(fontSize: 16),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " !Protect your self",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Wear loose, light-colored clothing to reflect sunlight.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Avoid outdoor activities during peak heat hours (typically 10 AM - 4 PM).",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Use hats, umbrellas, or seek shade to reduce exposure to direct sunlight.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Avoid Illness:Dehydration and heat stroke are major concerns. Drink plenty of water, and avoid alcohol and caffeine.",
                            style: TextStyle(fontSize: 15),
                          )),
                      Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            " Apply high-SPF sunscreen and reapply frequently when outdoors.",
                            style: TextStyle(fontSize: 15),
                          ))
                    ])),
              )),
          Container(
            margin: EdgeInsets.all(20),
            child: MaterialButton(
                padding: EdgeInsets.all(20),
                color: const Color.fromARGB(255, 97, 147, 187),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("warning"),
                            content:
                                Text("Are you sure to you want to come back"),
                            actions: [
                              TextButton(
                                  child: Text("yes"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  }),
                              TextButton(child: Text("No"), onPressed: () {})
                            ]);
                      });
                },
                child: Text("Back")),
          )
        ],
      ),
    );
  }
}
