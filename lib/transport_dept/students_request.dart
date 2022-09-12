import 'package:flutter/material.dart';

import '../main.dart';

class StudentsRequest extends StatelessWidget {
  const StudentsRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children:  [
          Row(
            children: [
              Text('8:00 Am',style: TextStyle(color: Colors.cyan),),
              TextButton(
                onPressed: (){}, 
                child: Text('Get Suggestion',style: TextStyle(color: Colors.orange),),
              )
              
            ],
          ),
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
            trailing: const Text('Requested - 59'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('     Route - 3',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Lakkatura'),
            trailing: const Text('Requested - 69'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('       Route - 4',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor'),
            trailing: const Text('Requested - 42'),
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
            trailing: const Text('Requested - 45'),
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
            trailing: const Text('Requested - 56'),
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
            trailing: const Text('Requested - 59'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('     Route - 3',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Lakkatura'),
            trailing: const Text('Requested - 69'),
          ),
          ListTile(
            shape: Border.all(color: themeColor),
            title: const Text('       Route - 4',style: TextStyle(fontWeight: FontWeight.bold),),
            leading: const Text('Tilaghor'),
            trailing: const Text('Requested - 42'),
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}