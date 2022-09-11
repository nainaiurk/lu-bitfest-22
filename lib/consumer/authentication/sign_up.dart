import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/constant/dropdown.dart';
import 'package:jatayat/consumer/authentication/authetication.dart';
import 'package:jatayat/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var items = [
    'Teacher',
    'Student',
    'Staff'
  ];
  String role = 'Teacher';

  roleSelect(value){
    setState(() {
      role = value;
    });
  }

  var locationList = [
    'Ambarkhana',
    'Tilagor',
    'Kodomtoli',
    'Bondor',
  ];
  String location = 'Ambarkhana';

  locationSelect(value){
    setState(() {
      location = value;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _contactController = TextEditingController();
  final _passController = TextEditingController();

  nameValidator(value){
    if (value!.length>3 && RegExp(r'^[A-Za-z]').hasMatch(value)){
      return null;
    } else {
      return 'Enter a valid name';
    }
  }

  passValidator(value){
    if (value!.length>8){
      return null;
    } else {
      return 'Enter a valid name';
    }
  }
  
  idValidator(value){
    if (value!.length > 10 && RegExp(r'^[0-9]').hasMatch(value)){
      return null;
    } else {
      return 'Enter a valid name';
    }
  }

  contactValidator(value){
    if (value!.length > 11 && RegExp(r'^[0-9]').hasMatch(value)){
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
                        controller: _nameController, 
                        validator: nameValidator, 
                        hintText: 'Full Name',
                      ),
                      const SizedBox(height: 10,),
                      MaterialForm(
                        controller: _idController, 
                        validator: nameValidator, 
                        hintText: 'ID Number',
                      ),
                      const SizedBox(height: 10,),
                      MaterialForm(
                        controller: _contactController, 
                        validator: contactValidator, 
                        hintText: 'Contact Number',
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
                      Material(
                        elevation: 10,
                        shadowColor: Colors.cyan,
                        borderRadius:BorderRadius.circular(20) ,
                        child: DropDown(
                          itemList: locationList, 
                          select: locationSelect, 
                          labelText: 'Pickup Stoppage', 
                          prefixIcon: Icons.location_on, 
                          valuedata: location
                        ),
                      ),
                      const SizedBox(height: 10,),
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
                        onPressed: ()async{
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+8801307149228',
                             verificationCompleted: (PhoneAuthCredential credential) async {
                              // ANDROID ONLY!

                              // Sign the user in (or link) with the auto-generated credential
                              await FirebaseAuth.instance.signInWithCredential(credential);
                            },
                            verificationFailed: (FirebaseAuthException e) {},
                            codeSent: (String verificationId, int? resendToken) async {
                              // Update the UI - wait for the user to enter the SMS code
                              String smsCode = '123456';

                              // Create a PhoneAuthCredential with the code
                              PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);

                              // Sign the user in (or link) with the credential
                              await FirebaseAuth.instance.signInWithCredential(credential);
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {},
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                           fontSize: 20
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              // style: TextStyle(color: formTextColor),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Log In',
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

class MaterialForm extends StatelessWidget {
  const MaterialForm({
    Key? key,
    required this.controller, 
    required this.validator, 
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final Function validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      shadowColor: Colors.cyan,
      borderRadius:BorderRadius.circular(20) ,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          validator(value);
        },
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left:20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.cyan)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.cyan)
          ),
        ),
      ),
    );
  }
}