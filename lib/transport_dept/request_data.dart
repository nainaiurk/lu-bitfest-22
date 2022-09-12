
import 'package:flutter/material.dart';
import 'package:jatayat/main.dart';
import 'package:jatayat/transport_dept/stuffs_request.dart';
import 'package:jatayat/transport_dept/teachers_request.dart';

import 'students_request.dart';

class RequestData extends StatefulWidget {
  const RequestData({super.key});

  @override
  State<RequestData> createState() => _RequestDataState();
}

class _RequestDataState extends State<RequestData> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  late String appbar;

  @override
  Widget build(BuildContext context) {
    if(_selectedIndex == 0){
      appbar = 'Students Request Data';
    }
    else if(_selectedIndex == 1){
      appbar = 'Teachers Request Data';
    }
    else if(_selectedIndex == 2){
      appbar = 'Stuffs Request Data';
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people),label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: 'Teachers'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Stuffs'),
        ],
        selectedItemColor: Colors.cyan[800],
        onTap: _onItemTapped,
      ),
      appBar: AppBar(title: Text(appbar),),
      body: data.elementAt(_selectedIndex),
    );
  }

  List<Widget> data = [ 
    const StudentsRequest(),
    const TeachersRequest(),
    const StuffsRequest()
  ];
}