
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {

  final int result;
  final bool isMale;
  final int age;
  final int weight;
  BMIResult({
    required this.result,
    required this.age,
    required this.weight,
    required this.isMale,
  })  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(

               isMale ?  'Gender : female' : 'Gender :male ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'result : $result',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'age : $age',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
