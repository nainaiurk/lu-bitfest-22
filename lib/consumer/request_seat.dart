
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:jatayat/constant/gsheet.dart';
import '../constant/dropdown.dart';
import '../main.dart';

class RequestSeat extends StatefulWidget {
  const RequestSeat({super.key});

  @override
  State<RequestSeat> createState() => _RequestSeatState();
}

class _RequestSeatState extends State<RequestSeat> {
   
  late Future<List<List<String>>> _future;
  var locationList = [
    'Ambarkhana',
    'Tilagor',
    'Kodomtoli',
    'Bondor',
  ];
  String location = 'Ambarkhana';

  List route1 = [
    'Tilagor'
    'Baluchar'
    'TB gate'
    'Eidgah'
    'Electric Supply'
    'Amberkhana'
    'Dorshondewry'
    'Subidbazar'
    'Londony Road'
    'Pathantula'
    'Modina Market'
    'Akhalaia Mosque'
    'Surmagate'
    'Sust Gate'
    'Temukhi bridge'
    'Rail crossing  Ragib nagar'
  ];
 
  @override
  void initState() {
    _future = gsheetsRows(100, 'Bus Schedule');
    super.initState();
  }
  locationSelect(value){
    setState(() {
      location = value;
    });
  }

  AlertDialog alert = AlertDialog(
    title: const Text("Request a seat for the pickup point Ambarkhana",style:  TextStyle(fontSize: 12),),
    content: Expanded(
      // height: 500,
      child: Column(
        children: [
          FutureBuilder(
            future: gsheetsRows(100, 'Routes'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              var len = data?.length;
              return Container(
                height: 400,
                width: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 6/2,
                  ),
                  itemCount: len-1,
                  itemBuilder: (BuildContext context, int i) {
                    return Text(data[i+1][0]+' -',style: const TextStyle(fontSize: 12),);
                  }, 
                ),
              );
            },
          ),
          const SizedBox(height: 30,),
          MaterialButton(color: Colors.cyan,height: 50,onPressed: (){},child: const Text('Request'),)
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: SizedBox(
        height: 500,
        width: 300,
        child: Drawer(
          child: Column(
            children: [
              Column(
                children: const [
                  DrawerHeader(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:NetworkImage('https://scontent.fdac27-2.fna.fbcdn.net/v/t39.30808-6/262031786_442991463952359_6663480343389569365_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEuhSrSjCvPnoMZx-2-lxSXE1HMgcZEb0MTUcyBxkRvQxae1tvCFzKzTsZv_cVtg6oiGplQ9YwTtc4ucNk5cXdO&_nc_ohc=bfzKTaSdFvAAX-T0urI&_nc_ht=scontent.fdac27-2.fna&oh=00_AT99tOMdSb88L2nhSigvgulEBZcHYLZz05cYH_XQKrsnqQ&oe=63226741') 
                    ),
                  ),
                  Text('Nahian Beente Firuj')
                ],
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('My Profile')
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.bus_alert),
                title: Text('Bus Schedule'),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
              ),

            ],
          ),
        ),
      ),
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
              child: FutureBuilder<List>(
                future: _future,
                builder: (context,AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: Colors.cyan,));
                  } 
                  else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('Something is wrong',style: TextStyle(color: Colors.white),));
                    } 
                    else if (snapshot.hasData || !snapshot.hasError) {
                      var data = snapshot.data;
                      var len = data?.length;
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        itemCount: len-4,
                        itemBuilder: (context,i){
                          return Container(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: ListTile(
                              onTap: () {
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context){
                                    return Container(
                                      height: 500,
                                      child: alert
                                    );
                                  }
                                );
                              },
                              tileColor: Colors.cyan.withOpacity(0.1),
                              shape: Border.all(
                                color: themeColor
                              ),
                              title: Text('Starting Point-${data[i+4][1]}',style: const TextStyle(color: Colors.amber),),
                              horizontalTitleGap: 30,
                              leading: Text(data[i+4][2],style: const TextStyle(fontWeight: FontWeight.bold),),
                              trailing: Text('Bus ${data[i+4][3]}',style: const TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          );
                        }
                      );
                    } 
                    else {
                      return const Center(child: Text('Empty data',style: TextStyle(color: Colors.white),));
                    }
                  } 
                  else {
                    return Center(child: Text('State: ${snapshot.connectionState}',style: const TextStyle(color: Colors.white),));
                  }
                  
                }
              ),
            ),
            
          ],
        )
      ),
    );
  }
}