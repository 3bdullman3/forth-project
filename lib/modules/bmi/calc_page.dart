import 'dart:math';

import 'package:flutter/material.dart';
import 'package:main/modules/bmi_result/bmi_result_page.dart';

class CalcPage extends StatefulWidget {
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  bool isMale = true;
  Color color = Colors.grey;
  double height = 120.0;
  int age = 20;
  int weight = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isMale ? Colors.blue : Colors.grey[300],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/fmale.png'),
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: !isMale ? Colors.blue : Colors.grey[300],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/male.png'),
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 200.0,
                        min: 0.0,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'age-decrement',
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'age-increment',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  heroTag: 'weight-decrement',
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: 'weight-increment',
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  double result = weight / pow(height / 100, 2);
                  print(result.toStringAsFixed(1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResult(
                        age: age,
                        isMale: isMale,
                        result: result.round(),
                        weight: weight,
                      ),
                    ),
                  );
                },
                height: 50,
                child: const Text(
                  'Calculate BMI',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
