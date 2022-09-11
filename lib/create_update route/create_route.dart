import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/main.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  var routeNo = [
    'Route-1',
    'Route-2',
    'Route-3',
    'Route-4',
  ];
  String route = 'Route-1';

  var locationList = [
    'Ambarkhana',
    'Tilagor',
    'Kodomtoli',
    'Bondor',
  ];
  String location = 'Ambarkhana';
  var stopPoint =[
    'Ambarkhana',
    'Tilagor',
    'Kodomtoli',
    'Bondor',
  ];
  var selectedStopPoint =[];

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Route'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField2(
              alignment: Alignment.center,
              hint: const Text(
                'Route No.',
                style: TextStyle(color: Colors.cyan),
              ),
              items: routeNo.map((item) => 
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ).toList(), 
              value: route,
              onChanged: (value){
                setState(() {
                  route = value!;
                });;
              },
              itemPadding: const EdgeInsets.only(left: 30),
              icon: const Icon(Icons.keyboard_arrow_down),
              selectedItemHighlightColor: Colors.cyan,
              focusColor: Colors.cyan,
              iconEnabledColor: Colors.cyan,
              decoration: InputDecoration(
                labelText:'Select Route' ,
                prefixIcon: Icon(Icons.route,color: themeColor,),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.cyan)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.cyan)
                ),
              ),
            ),
            const SizedBox(height: 20,),

            DropdownButtonFormField2(
              alignment: Alignment.center,
              hint: const Text(
                'Start Location',
                style: TextStyle(color: Colors.cyan),
              ),
              items: locationList.map((item) => 
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ).toList(), 
              value: location,
              onChanged: (value){
                setState(() {
                  location = value!;
                });
              },
              itemPadding: const EdgeInsets.only(left: 30),
              icon: const Icon(Icons.keyboard_arrow_down),
              selectedItemHighlightColor: Colors.cyan,
              focusColor: Colors.cyan,
              iconEnabledColor: Colors.cyan,
              decoration: InputDecoration(
                labelText:'Start Location' ,
                prefixIcon: Icon(Icons.location_on,color: themeColor),
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
            const SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left:20),                 
                hintText: 'Start Time',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.cyan)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.cyan)
                ),
                suffixIcon: Icon(Icons.watch_later_outlined,color: Colors.cyan,)
              ),
            ),
            const SizedBox(height: 20,),
            DropdownButtonFormField2(
              alignment: Alignment.center,
              hint: const Text(
                'Stop Point',
                style: TextStyle(color: Colors.cyan),
              ),
              items: stopPoint.map((item) => 
                DropdownMenuItem<String>(
                  value: item,
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final _isSelected = selectedStopPoint.contains(item);
                      return InkWell(
                        onTap: () {
                          _isSelected
                            ? selectedStopPoint.remove(item)
                            : selectedStopPoint.add(item);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              _isSelected
                                      ? const Icon(Icons.check_box_outlined)
                                      : const Icon(Icons.check_box_outline_blank),
                              const SizedBox(width: 16),
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ).toList(), 
              value: location,
              onChanged: (value){
                setState(() {
                  location = value!;
                });
              },
              itemPadding: const EdgeInsets.only(left: 30),
              icon: const Icon(Icons.keyboard_arrow_down),
              selectedItemHighlightColor: Colors.cyan,
              focusColor: Colors.cyan,
              iconEnabledColor: Colors.cyan,
              decoration: InputDecoration(
                labelText:'Stoppages' ,
                prefixIcon: Icon(Icons.location_on,color: themeColor),
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
            const SizedBox(height: 20,),
            MaterialButton(
              shape: Border.all(
                color: themeColor
              ),
              onPressed: (){},
              child: const Text(
                'Create Route'
              ) ,
            )
          ],
        ),
      ),
    );
  }
}