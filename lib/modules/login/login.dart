import 'package:flutter/material.dart';
import 'package:main/shaered/componets/componets.dart';
// ignore: must_be_immutable
class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

 bool IsPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  DefaultTextField(
                      controller: emailController,
                    label: 'Email Address',
                    prefix:Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email address must not be empty';
                      }
                      return ''; // عندما يكون الإدخال صالحًا
                    },

                    onChange: (String value) {
                      print(value);
                    },
                    onSubmit: (String value) {
                      print(value);
                    },

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  DefaultTextField(
                  controller: passwordController,
                    validate: (value){
                     if (value == null || value.isEmpty){
                    return 'email address must not be empty';
                      }
                      return '';
                      },
                    type: TextInputType.visiblePassword,
                     prefix :Icons.lock,
                     suffix: IsPasswordShow? Icons.visibility_off:Icons.visibility ,
                    IsPass: IsPasswordShow,
                    label: 'Password' ,
                    suffixPressed: (){
                    setState(() {
                      IsPasswordShow = !IsPasswordShow;
                    });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: (){
                      if (formkey.currentState?.validate() == true) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'login',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: defaultButton(
                      function: (){
                        print(emailController);
                        print(passwordController);
                      },
                      text: 'signup',
                      width: 200,
                      background: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child:  Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}