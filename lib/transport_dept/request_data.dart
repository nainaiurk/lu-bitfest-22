
import 'package:flutter/material.dart';
import 'package:jatayat/main.dart';
import 'package:jatayat/transport_dept/input_transport_demand.dart';
import 'package:jatayat/transport_dept/stuffs_request.dart';
import 'package:jatayat/transport_dept/teachers_request.dart';
import 'package:jatayat/transport_dept/update_bus_inventory.dart';
import 'package:jatayat/welcome_page.dart';

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
      drawer: Container(
        height: 500,
        child: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 50,
                      foregroundColor: Colors.green,
                    ),
                    Text('Nafi Ullah'),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 10,),
              ListTile(
                onTap: () {
                  
                },
                title: const Text('Your Profile'),
                leading: const Icon(Icons.person),
              ),
              const SizedBox(height: 10,),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateBus()));
                },
                title: const Text('Update Bus Inventory'),
                leading: const Icon(Icons.bus_alert),
              ),
              const SizedBox(height: 10,),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const InputDemand()));
                },
                title: const Text('Demand For Transport'),
                leading: const Icon(Icons.bus_alert),
              ),
              const SizedBox(height: 10,),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                },
                title: const Text('Log Out'),
                leading: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people),label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: 'Teachers'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Stuffs'),
        ],
        selectedItemColor: Colors.cyan[800],
        elevation: 20,
        currentIndex: _selectedIndex,
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