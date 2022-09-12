
import 'package:flutter/material.dart';
import 'package:jatayat/main.dart';

class UpdateBus extends StatefulWidget {
  const UpdateBus({super.key});

  @override
  State<UpdateBus> createState() => _UpdateBusState();
}

class _UpdateBusState extends State<UpdateBus> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Bus Inventory'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 10,
              shadowColor: Colors.cyan,
              borderRadius:BorderRadius.circular(20) ,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.bookmark),
                  hintText: 'License Number',
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
            ),
            const SizedBox(height: 20,),
            Material(
              elevation: 10,
              shadowColor: Colors.cyan,
              borderRadius:BorderRadius.circular(20) ,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.code),
                  hintText: 'Code Name',
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
            ),
            const SizedBox(height: 20,),
            Material(
              elevation: 10,
              shadowColor: Colors.cyan,
              borderRadius:BorderRadius.circular(20) ,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.reduce_capacity),
                  hintText: 'Capacity',
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
            ),
            const SizedBox(height: 20,),
            const Text('Driver Info:'),
            const SizedBox(height: 10,),
            Material(
              elevation: 10,
              shadowColor: Colors.cyan,
              borderRadius:BorderRadius.circular(20) ,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_add),
                  hintText: 'Full Name',
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
            ),
            const SizedBox(height: 20,),
            Material(
              elevation: 10,
              shadowColor: Colors.cyan,
              borderRadius:BorderRadius.circular(20) ,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.contact_mail),
                  hintText: 'Contact',
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
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Is Active?',
                    style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 17
                  ),
                ),
                const SizedBox(width: 30,),
                Container(
                  width: 40,
                  child: Checkbox(
                    side: const BorderSide(color: Colors.cyan),
                    activeColor: Colors.cyan,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              onPressed: (){},
              minWidth: 300,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: themeColor,
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}