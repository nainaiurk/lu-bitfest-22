import 'package:flutter/material.dart';

import '../main.dart';

class TeachersRequest extends StatelessWidget {
  const TeachersRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children:  [
          const Text('8:00 Am',style: TextStyle(color: Colors.cyan),),
          const SizedBox(height: 10,),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('Route - 1',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor         '),
            trailing: const Text('Requested - 23'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('Route - 2',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('SurmaTower'),
            trailing: const Text('Requested - 25'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('     Route - 3',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Lakkatura'),
            trailing: const Text('Requested - 12'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('       Route - 4',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor'),
            trailing: const Text('Requested - 22'),
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),

          const Text('9:00 Am',style: TextStyle(color: Colors.cyan),),
          const SizedBox(height: 10,),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('Route - 1',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor         '),
            trailing: const Text('Requested - 33'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('Route - 2',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('SurmaTower'),
            trailing: const Text('Requested - 26'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('     Route - 3',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Lakkatura'),
            trailing: const Text('Requested - 33'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('       Route - 4',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor'),
            trailing: const Text('Requested - 15'),
          ),
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),

          const Text('10:00 Am',style: TextStyle(color: Colors.cyan),),
          const SizedBox(height: 10,),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('Route - 1',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor         '),
            trailing: const Text('Requested - 23'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('Route - 2',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('SurmaTower'),
            trailing: const Text('Requested - 19'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('     Route - 3',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Lakkatura'),
            trailing: const Text('Requested - 5'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('       Route - 4',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor'),
            trailing: const Text('Requested - 9'),
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}