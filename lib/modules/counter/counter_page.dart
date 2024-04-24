import 'package:flutter/material.dart';

class counter_page extends StatefulWidget {
  @override
  State<counter_page> createState() => _counter_pageState();
}

class _counter_pageState extends State<counter_page> {
  int counter = 1;
@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'cuonter page',
        ),

    ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              print(counter);
              counter --;
              setState(() {
              });
            },
                child:Text(''
                    'minus',
                  style: TextStyle(
                    color: Colors.red,
                    backgroundColor: Colors.black,
                    fontSize: 20,
                  ),
                )
            ),
             Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                '$counter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            TextButton(onPressed: (){
              counter ++;
              print(counter);
              setState(() {
              });
            },
                child:Text(''
                    'plus',
                  style: TextStyle(
                    color: Colors.green,
                    backgroundColor: Colors.black,
                    fontSize: 20,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
