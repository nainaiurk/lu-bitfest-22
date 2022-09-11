import 'package:date_field/date_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../constant/dropdown.dart';
import '../main.dart';

class RequestSeat extends StatefulWidget {
  const RequestSeat({super.key});

  @override
  State<RequestSeat> createState() => _RequestSeatState();
}

class _RequestSeatState extends State<RequestSeat> {
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

  AlertDialog alert = AlertDialog(
    title: const Text("Request a seat for the pickup point Ambarkhana",style:  TextStyle(fontSize: 12),),
    content: MaterialButton(
      onPressed: (){},
      color: themeColor,
      child: const Text('Request'),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropDown(
              itemList: locationList, 
              select: locationSelect,
              valuedata: location,
              labelText: 'Select pickup location', 
              prefixIcon: Icons.location_on
            ),
            const SizedBox(height: 10,),
            DateTimeFormField(
              decoration:  InputDecoration(
                hintStyle: const TextStyle(color: Colors.black45),
                errorStyle: const TextStyle(color: Colors.redAccent),
                suffixIcon: Icon(Icons.event_note,color: themeColor,),
                labelText: 'Route Date',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.cyan)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.cyan)
                ),
              ),
              mode: DateTimeFieldPickerMode.dateAndTime,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
              },
            ),
            const Divider(),
            const SizedBox(height: 10,),
            const Text('Available Bus',style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                itemCount: 5,
                itemBuilder: (context,i){
                  return Container(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context, 
                          builder: (BuildContext context){
                            return alert;
                          }
                        );
                      },
                      tileColor: Colors.cyan.withOpacity(0.1),
                      shape: Border.all(
                        color: themeColor
                      ),
                      title: const Text('Bus-1',style: TextStyle(color: Colors.amber),),
                      horizontalTitleGap: 30,
                      subtitle: const Text('Ambarkhana - SubidBazar - Modina Market - SUST Gate - Leading'),
                      leading: const Text('9:00 Am',style: TextStyle(fontWeight: FontWeight.bold),),
                      trailing: const Text('1:00 Pm',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  );
                }
              ),
            ),
            
          ],
        )
      ),
    );
  }
}