import 'package:flutter/material.dart';
import 'package:jatayat/consumer/track_bus/map_widget.dart';
import 'package:jatayat/main.dart';

class BusList extends StatefulWidget {
  const BusList({super.key});

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Available Bus On Route'),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: (() => Navigator.push(context, MaterialPageRoute(builder: (context)=>MapWidget()))),
              shape: Border.all(color: themeColor),
              title: Text('Route-1'),
              leading: Text('8:00 am'),
            ),
            SizedBox(height: 20,),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Route-2'),
              leading: Text('8:00 am'),
            ),
            SizedBox(height: 20,),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Route-3'),
              leading: Text('8:00 am'),
            ),
            SizedBox(height: 20,),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Route-4'),
              leading: Text('8:00 am'),
            ),
          ],
        ),
      ),
    );
  }
}