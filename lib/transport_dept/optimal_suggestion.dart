import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/main.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestions'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children:  [
            const Text('8:00 Am',style: TextStyle(color: Colors.cyan),),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Bus 5'),
              subtitle: Text("Capacity - 50"),
              leading:  Text('Route 1',style: TextStyle(color: Colors.blue),),
              trailing: Text('QTY : 01'),
            ),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Bus 1'),
              subtitle: Text("Capacity - 60"),
              leading:  Text('Route 2',style: TextStyle(color: Colors.blue),),
              trailing: Text('QTY : 01'),
            ),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Bus 2'),
              subtitle: Text("Capacity - 50"),
              leading:  Text('Route 3',style: TextStyle(color: Colors.blue),),
              trailing: Text('QTY : 02'),
            ),
            ListTile(
              shape: Border.all(color: themeColor),
              title: Text('Bus 3'),
              subtitle: Text("Capacity - 50"),
              leading:  Text('Route 4',style: TextStyle(color: Colors.blue),),
              trailing: Text('QTY : 01'),
            ),
            const SizedBox(height: 10,),
            MaterialButton(
              minWidth: 200,
              color: themeColor,
              onPressed: (){},
              child: const Text(
                'Demand'
              ),
            )
          ],
        ),
      ),
    );
  }
}