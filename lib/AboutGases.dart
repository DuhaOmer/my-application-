import 'package:flutter/material.dart';
//page 2

void main() {
  runApp(const AboutGases());
}

class AboutGases extends StatefulWidget {
  const AboutGases({super.key});
  @override
  _AboutGasestState createState() => _AboutGasestState();
}

class _AboutGasestState extends State<AboutGases> {
  //String? PM1, O3, VOC, Temp, Humidity, CH2O, NO2, TVOC, CO, CO2, PM25, PM10;

  //GlobalKey<FormState> formstate1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("About Gases "),
          backgroundColor: Colors.purple[200]),
      body: SizedBox(
        height: double.infinity,
        child: PageView(children: [
          Container(
              padding: const EdgeInsets.all(10.2),
              //page 1
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                            //  fit: BoxFit.fill,
                            "images/Carbon Dioxide Molecule_1041722966.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text("Carbon Dioxide"),
                    subtitle: Text("CO2"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300, // 300 not 500
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ A colorless, odorless gas that naturally occurs in the atmosphere."),
                        Text(
                            " ~Produced by respiration and the burning of fossil fuels like coal and oil."),
                        Text(
                            " ~High concentrations can cause fatigue, headaches, and difficulty concentrating."),
                        Text(
                            " ~Accumulates in poorly ventilated indoor spaces, increasing health risks.."),
                        Text(
                            " ~It plays a crucial role in the Earth's carbon cycle and is absorbed by plants during photosynthesis."),
                        Text(
                            "CO2 is a greenhouse gas, trapping heat in the atmosphere and contributing to the greenhouse effect.")
                      ]))
                ],
              )),
          //page2

          Container(
            padding: const EdgeInsets.all(10.2),
            //page 1
            child: ListView(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(70)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                          //    fit: BoxFit.fill,
                          "images/PM gases.webp")),
                ),
                const Card(
                    child: ListTile(
                  title: Text("Particulate Matter 2.5."),
                  subtitle: Text("PM2.5"),
                )),
                Container(
                    padding: const EdgeInsets.all(10.2),
                    height: 300,
                    width: 400,
                    color: Colors.grey,
                    child: ListView(children: const [
                      Text(
                          " ~ Definition: PM2.5 refers to particulate matter with a diameter of 2.5 micrometers or smaller."),
                      Text(
                          " ~Common sources of PM2.5 include the combustion of fossil fuels, vehicle emissions, industrial processes, waste burning, and natural sources like dust and smoke."),
                      Text(
                          " ~PM2.5 can cause serious health issues, including:."),
                      Text(" *Heart diseases.."),
                      Text("*Negative respiratory effects, like bronchitis."),
                      Text(
                          "*Worsening of pre-existing health conditions, such as allergies.")
                    ]))
              ],
            ),
          )

          //at end page2 ,
          //page 3
          ,
          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                            //  fit: BoxFit.fill,
                            "images/PM gases.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text("Particulate Matter 1.0"),
                    subtitle: Text("PM1.0"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300,
                      width: 400,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Definition: PM1.0 refers to particulate matter that is 1.0 micrometer or smaller in diameter."),
                        Text(
                            " ~Sources: Common sources of PM1.0 include combustion processes (such as vehicle emissions and industrial activities), secondary formation from chemical reactions in the atmosphere, and biological sources like pollen and spores"),
                        Text(
                            " ~Health Impact: PM1.0 particles can penetrate deep into the lungs and enter the bloodstream, potentially causing respiratory and cardiovascular issues, as well as other health problems."),
                        Text(
                            " ~Environmental Effects: High concentrations of PM1.0 can contribute to reduced visibility, acid rain, and adverse effects on ecosystems."),
                        Text(
                            " ~Common in Urban Areas: PM1.0 levels tend to be higher in urban environments due to increased traffic, industrial activity, and construction."),
                        Text(
                            "Seasonal Variation: PM1.0 concentrations can vary by season, often increasing in winter due to heating and temperature inversions that trap pollutants close to the ground")
                      ]))
                ],
              )),
          //page 4
          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                            //  fit: BoxFit.fill,
                            "images/PM gases.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text("Particulate Matter 10"),
                    subtitle: Text("PM10"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300, // 300
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Definition: PM10 refers to particulate matter that is 10 micrometers or smaller in diameter. These particles can be inhaled and may cause health problems."),
                        Text(
                            "Sources:PM10 is often produced by various sources, including vehicle emissions, industrial processes, construction activities, and natural sources like dust storms and wildfires."),
                        Text(
                            "Common sources also include combustion processes, such as burning fossil fuels, wood, and agricultural waste."),
                        Text(
                            " ~Prevention:Reducing PM10 emissions can be achieved through cleaner combustion technologies, dust control measures, and promoting the use of public transportation and electric vehicles."),
                        Text(
                            "~Environmental Impact:PM10 can contribute to environmental issues, including poor air quality and visibility reduction"),
                        Text(
                            "Regulations:Many countries have established air quality standards and guidelines to limit PM10 concentrations in the atmosphere to protect public health."),
                      ]))
                ],
              )),
          //page 5 CH2O
          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                            fit: BoxFit.fill, "images/CH2O image2.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text(" Methanal"),
                    subtitle: Text("CH2O"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300, // 300
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Chemical Formula: CH₂O is the chemical formula for formaldehyde, consisting of one carbon atom, two hydrogen atoms, and one oxygen atom.."),
                        Text(
                            " ~Physical State: Formaldehyde is a colorless gas with a strong, pungent odor. It can also exist in liquid form when cooled."),
                        Text(
                            " ~Health Risks: It can be an irritant to the skin, eyes, and respiratory system and is considered a potential carcinogen."),
                        Text(
                            " ~Natural Occurrence: Produced naturally during the metabolism of certain living organisms and can be present in the environment from the combustion of organic materials"),
                        Text("~Uses:"),
                        Text(
                            "*Used in the production of chemical products and industrial materials, such as resins."),
                        Text(
                            "*Employed as a disinfectant and preservative in tissue laboratories."),
                      ]))
                ],
              )),
//page NO2

          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child:
                            Image.asset(fit: BoxFit.fill, "images/NO2.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text("Nitrogen dioxide "),
                    subtitle: Text("NO2"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300, //300
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Chemical Structure: Nitrogen dioxide is a reddish-brown gas with the chemical formula NO2, consisting of one nitrogen atom and two oxygen atoms."),
                        Text("~ Sources:"),
                        Text(
                            "*Primarily produced from the combustion of fossil fuels in vehicles, power plants, and industrial processes.."),
                        Text(
                            "Can also be formed from the oxidation of nitric oxide (NO) in the atmosphere."),
                        Text(" ~Regulatory Standards:"),
                        Text(
                            "*Many countries have set air quality standards for NO2 to protect public health and the environment"),
                        Text(
                            "*The United States Environmental Protection Agency (EPA) has established National Ambient Air Quality Standards (NAAQS) for nitrogen dioxide."),
                      ]))
                ],
              )),
          //page 5 CO
          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child:
                            Image.asset(fit: BoxFit.fill, "images/CO to.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text(" Carbon Monoxide "),
                    subtitle: Text("CO"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300, //300
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Carbon Monoxide (CO) is a colorless, odorless, and tasteless gas that is produced by the incomplete combustion of carbon-containing materials such as gasoline, wood, coal, or propane."),
                        Text(
                            " ~It is highly toxic to humans and animals because it interferes with the body's ability to transport oxygen in the bloodstream."),
                        Text(
                            " ~Sources of CO include vehicle exhaust, gas-powered appliances, and open fires."),
                        Text(
                            " ~Exposure to high levels of CO can lead to symptoms such as headaches, dizziness, confusion, and in extreme cases, death."),
                        Text("~Uses:"),
                        Text(
                            "~Prevention: To prevent CO poisoning, ensure proper ventilation, install CO detectors in homes, and regularly maintain fuel-burning appliances."),
                        Text(
                            "~Environmental Impact: While CO does not directly cause climate change, it contributes to the formation of ground-level ozone (smog), which can have negative environmental and health impacts."),
                      ]))
                ],
              )),
          //page O3
          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                            fit: BoxFit.fill, "images/ozone image edit2.png")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text(" Ozone  "),
                    subtitle: Text("O3"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300,
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Chemical Structure: Ozone is a triatomic molecule consisting of three oxygen atoms (O3)."),
                        Text(
                            " ~Occurrence: Ozone is found in two layers of the Earth's atmosphere:"),
                        Text(
                            " *Stratosphere: Forms the ozone layer, which absorbs the majority of the sun's harmful ultraviolet (UV) radiation."),
                        Text(
                            " *Troposphere: Found closer to the Earth's surface, where it is a harmful pollutant."),
                        Text(
                            "~Formation: Ozone is created naturally through the reaction of ultraviolet (UV) light with molecular oxygen (O2). It can also be formed by chemical reactions involving volatile organic compounds (VOCs) and nitrogen oxides (NOx) in the presence of sunlight."),
                        Text(
                            "Environmental Impact: Ozone can damage crops, other vegetation, and materials such as rubber and plastic"),
                        Text(
                            " ~Uses: Ozone is used for water purification, disinfecting surfaces, and in some industrial processes."),
                        Text(
                            " ~Health Risks: High levels of ozone in the lower atmosphere can irritate the respiratory system, causing issues like coughing, throat irritation, and exacerbation of asthma or other lung diseases"),
                        Text(
                            " ~Production: Ozone is naturally produced by the reaction between oxygen and ultraviolet (UV) light or through lightning strikes, but can also be generated by human activities like vehicle emissions and industrial processes"),
                        Text(
                            "~Environmental Impact: Tropospheric ozone is a major component of smog and contributes to environmental issues like the greenhouse effect and global warming."),
                        Text("Forms of Ozone:"),
                      ]))
                ],
              )),
          // TVOC
          Container(
              padding: const EdgeInsets.all(10.2),
              child: ListView(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(60)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child:
                            Image.asset(fit: BoxFit.fill, "images/TVOC.webp")),
                  ),
                  const Card(
                      child: ListTile(
                    title: Text(" Total Volatile Organic Compounds "),
                    subtitle: Text("TVOC"),
                  )),
                  Container(
                      padding: const EdgeInsets.all(10.2),
                      height: 300,
                      width: 200,
                      color: Colors.grey,
                      child: ListView(children: const [
                        Text(
                            " ~ Definition: Total Volatile Organic Compounds (TVOC) refers to a group of chemical compounds that evaporate into the air at room temperature. This group includes a variety of chemicals such as aldehydes, alcohols, and ketones."),
                        Text(
                            " ~Sources: TVOC sources can include indoor factors such as paints, solvents, cleaning agents, and air fresheners, as well as outdoor sources like vehicle exhaust, factory emissions, and gases released from plants."),
                        Text(
                            " ~Health Effects: Exposure to high levels of TVOC can lead to a range of health effects, including headaches, dizziness, eye and skin irritation, and respiratory issues. Some compounds can also cause long-term health effects."),
                        Text(
                            " ~Measurement: TVOC levels are typically measured using specialized sensors that detect concentrations in the air. Monitoring TVOC levels is an important part of assessing air quality, helping to identify pollution and improve living conditions."),
                        Text(
                            "~Prevention: To reduce exposure to TVOC, it is advisable to ensure good ventilation in indoor spaces, use products with low levels of volatile organic compounds, and minimize the use of evaporative chemical substances."),
                      ]))
                ],
              )),
        ]),
      ),
    );
  }
}
