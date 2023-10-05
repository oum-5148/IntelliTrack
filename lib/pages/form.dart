import 'package:IT/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const MainView(),
    );
  }
}

List<String> options = ['option 1', 'option 2'];


class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Map> categories = [
    {"name": "Electrical Issues", "isChecked": false},
    {"name": "Mechanical Problems", "isChecked": false},
    {"name": "Software and Firmware", "isChecked": false},
    {"name": "Calibration and Accuracy", "isChecked": false},
    {"name": "Network and Connectivity", "isChecked": false},
  ];
  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Add the SVG image to the left of the title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/Arrow - Left 2.svg',
                height: 20,
                width: 20,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment
                    .center, // Center-align both text widgets vertically
                child: Column(
                  children: const [
                    Text('reference'),
                    Text(
                      'MEQ2108',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Reverse the order of the widgets
              // First, display the radio buttons
              radio_button(context),

              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              const Text("Please state the type of problem:",
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Column(
                children: categories.map((favorite) {
                  return CheckboxListTile(
                    activeColor: Color.fromARGB(255, 23, 80, 165),
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    value: favorite["isChecked"],
                    title: Text(favorite["name"]),
                    onChanged: (val) {
                      setState(() {
                        favorite["isChecked"] = val;
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              // Then, display the text area
              text_area(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget radio_button(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Please Choose the state of equipement:",
          style: TextStyle(fontSize: 16),
        ),
        ListTile(
          title: const Text('Functional'),
          leading: Radio(
            activeColor: Color.fromARGB(255, 23, 80, 165),
            value: options[0],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Non-functional'),
          leading: Radio(
            activeColor: Color.fromARGB(255, 23, 80, 165),
            value: options[1],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = value.toString();
              });
            },
          ),
        )
      ],
    );
  }

  Widget text_area(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Please provide more details:",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        TextField(
          minLines: 1,
          maxLines: 10,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(height: 15),
        Center(
          child: GestureDetector(
            onTap: () {
              // Handle the click event here
            },
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF6AB4CF), // Background color
              ),
              onPressed: () {
                // This onPressed callback is optional since we're using onTap
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage(stat: false);
                }),
              );
              },
              child: const Text(
                "Send",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
