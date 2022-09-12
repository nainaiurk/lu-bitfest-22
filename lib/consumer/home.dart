import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jatayat/consumer/request_seat.dart';
import 'package:jatayat/consumer/track_bus/bus_list.dart';

class ConsumerHome extends StatefulWidget {
  const ConsumerHome({super.key});

  @override
  State<ConsumerHome> createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book),label: 'RequestSeat',),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined),label: 'Track Bus'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.cyan[800],
      ),
      body: list.elementAt(_selectedIndex),
    );
  }

  List<Widget> list =[
    RequestSeat(),
    BusList()
  ];
}