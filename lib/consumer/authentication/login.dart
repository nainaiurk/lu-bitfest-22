import 'package:flutter/material.dart';
import 'package:jatayat/consumer/authentication/sign_up.dart';
import 'package:jatayat/consumer/home.dart';
import 'package:jatayat/consumer/request_seat.dart';
import 'package:jatayat/transport_dept/request_data.dart';
import '../../constant/dropdown.dart';
import '../../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  var items=[
    'Consumer',
    'Transport Dept'
  ];
  String role = 'Consumer';
  roleSelect(value){
    setState(() {
      role = value;
    });
  }
  userValidator(value){
    if (value!.length>0){
      return null;
    } else {
      return 'Enter a valid name';
    }
  }
  passValidator(value){
    if (value!.length>0){
      return null;
    } else {
      return 'Enter a valid name';
    }
  }
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Jatayat',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.cyan
                ),
              ),
              SizedBox(height: maxHeight*0.05,),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      MaterialForm(
                        controller: _userController, 
                        validator: userValidator, 
                        hintText: 'User Name or ID',
                      ),
                      const SizedBox(height: 20,),
                      Material(
                        elevation: 10,
                        shadowColor: Colors.cyan,
                        borderRadius:BorderRadius.circular(20) ,
                        child: DropDown(
                          itemList: items, 
                          select: roleSelect, 
                          labelText: 'Your Role', 
                          prefixIcon: Icons.person, 
                          valuedata: role
                        ),
                      ),
                      const SizedBox(height: 20,),
                      MaterialForm(
                        controller: _passController, 
                        validator: passValidator, 
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 20,),
                      MaterialButton(
                        minWidth: maxWidth*0.7,
                        elevation: 30,
                        splashColor: Colors.white,
                        color: themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: (){
                          role != 'Consumer'
                          ? Navigator.push(context, MaterialPageRoute(builder: (context)=>const RequestData()))
                          : Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConsumerHome()));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                           fontSize: 20
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              // style: TextStyle(color: formTextColor),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}