import 'package:flutter/material.dart';
import 'package:main/models/user/user.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
class users extends StatelessWidget {
  List<UserModal> usersList = [
    UserModal(
      id:1,
      name: "man3",
      number: '0550822598',
    ),
    UserModal(
      id:2,
      name: 'ahmed',
      number: '056545598',
    ),
    UserModal(
      id:3,
      name: 'm6mayaz',
      number: '0545654654',
    ),
    UserModal(
      id:4,
      name: 'momm',
      number: '65464654',
    ),
    UserModal(
      id:1,
      name: "man3",
      number: '0550822598',
    ),
    UserModal(
      id:2,
      name: 'ahmed',
      number: '056545598',
    ),
    UserModal(
      id:3,
      name: 'm6mayaz',
      number: '0545654654',
    ),
    UserModal(
      id:4,
      name: 'momm',
      number: '65464654',
    ),
    UserModal(
      id:1,
      name: "man3",
      number: '0550822598',
    ),
    UserModal(
      id:2,
      name: 'ahmed',
      number: '056545598',
    ),
    UserModal(
      id:3,
      name: 'm6mayaz',
      number: '0545654654',
    ),
    UserModal(
      id:4,
      name: 'momm',
      number: '65464654',
    ),
  ];

  users({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUseritem(usersList[index]),
          separatorBuilder:(context, index) => Container(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
            ),
            width: double.infinity,
            height: 1.00,
            color: Colors.grey[300],
          ),
          itemCount:usersList.length,
      ),
    );
  }
  Widget  buildUseritem(UserModal user) => Padding(
    padding:  const EdgeInsets.all(25.0),
    child:  Row(
      children: [
        CircleAvatar(
          backgroundColor:Colors.black54,
          radius: 30,
          child: Text(
            '${user.id}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 20,

        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.number}',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    )
  );

}
