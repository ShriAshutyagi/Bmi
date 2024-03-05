
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MYApp());
}

class MYApp extends StatefulWidget {
  const MYApp({super.key});

  @override
  State<MYApp> createState() => _MYAppState();
}

class _MYAppState extends State<MYApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController KGcontroller = TextEditingController();
  TextEditingController Feetcontroller = TextEditingController();
  TextEditingController Inchcontroller = TextEditingController();
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'BMI CACULATOR',
                  style: TextStyle(fontFamily: 'Ashu', fontSize: 25),
                ),
                TextField(
                  controller: KGcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.calculate),
                    label: Text(
                      'Enter your weight',
                      style: TextStyle(fontSize: 17),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                ),
                TextField(
                  controller: Feetcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text(
                      'Enter your Height(Feet)',
                      style: TextStyle(fontSize: 17),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                ),
                TextField(
                  controller: Inchcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    label: Text(
                      'Enter your Height(Inch)',
                      style: TextStyle(fontSize: 17),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = KGcontroller.text;
                    var ft = Feetcontroller.text;
                    var inch = Inchcontroller.text;

                    if (wt != "" && ft != "" && inch != "") {
                      //BMI Calculator
                      var iWt = double.parse(wt);
                      var iFt = double.parse(ft);
                      var iInch = double.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overWeight!!";
                        // bgColor = Colors.red.shade200;
                      } else if (bmi < 10) {
                        msg = "You are underWeight!!";
                        // bgColor = Colors.yellow.shade300;
                      } else {
                        msg = "You are Healthy!!";
                      }

                      setState(() {
                        result =
                            "$msg\n\n Your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please Fill all the fields!!!!!";
                      });
                    }
                  },
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade200,
                    minimumSize: Size(250, 50),
                  ),
                ),
                Text(result,
                    style: TextStyle(fontFamily: 'Ashu', fontSize: 25)),
              ],
            ),
          );
        },
      ),
    );
  }
}
