import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/constant/dropdown.dart';
import 'package:jatayat/consumer/authentication/authetication.dart';
import 'package:jatayat/main.dart';

class InputDemand extends StatefulWidget {
  const InputDemand({super.key});

  @override
  State<InputDemand> createState() => _InputDemandState();
}

class _InputDemandState extends State<InputDemand> {

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
      appBar: AppBar(
        title: Text('Create transport demand'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      MaterialForm(
                        controller: _nameController, 
                        validator: nameValidator, 
                        hintText: 'Route No',
                      ),
                      const SizedBox(height: 10,),
                      MaterialForm(
                        controller: _idController, 
                        validator: nameValidator, 
                        hintText: 'Time Slot',
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
                      MaterialButton(
                        minWidth: maxWidth*0.7,
                        elevation: 30,
                        splashColor: Colors.white,
                        color: themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: ()async{
                
                        },
                        child: const Text(
                          'Submit Demand',
                          style: TextStyle(
                           fontSize: 20
                          ),
                        ),
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