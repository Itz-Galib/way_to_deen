//import 'package:flutter/cupertino.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';

import 'package:waytodeen2/themes/theme_provider.dart';
//import 'package:waytodeen/dua.dart';

// ekhan theke suru
class City {
  final String name;
  final double latitude;
  final double longitude;

  City(this.name, this.latitude, this.longitude);
}

class home extends StatefulWidget {
  //const home({super.key});
  ///importing er jonno likhte hoy eta ja mainly bin folder er wayto deen .dart file e ache 
  ///no api is used only packages from flutter package:adhan_dart
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: MyScrollableBox() ,
    );
  }
}
class MyScrollableBox extends StatefulWidget {
  @override
  State<MyScrollableBox> createState() => _MyScrollableBoxState();
}

class _MyScrollableBoxState extends State<MyScrollableBox> {
  /*ekhane
  List<Cities>_cities=Cities.getCities();
  late List<DropdownMenuItem<Cities>>_dropdownMenuItems;
  late Cities _selectedCity;
   */   


  late PrayerTimes prayerTimes;
  late DateTime date;
  late  Coordinates coordinates;
  late CalculationParameters params;
      late City selectedCity;
  
   //list newly added
    final List<City> cities = [
   
City('Dhaka', 23.8103, 90.4125),
City('Chittagong', 22.3569, 91.7832),
City('Khulna', 22.8456, 89.5403),
City('Rajshahi', 24.3745, 88.6042),
City('Sylhet', 24.8949, 91.8687),
City('Barisal', 22.7056, 90.3700),
City('Comilla', 23.4682, 91.1786),
City('Narayanganj', 23.6238, 90.4965),
City('Dinajpur', 25.6217, 88.6356),
City('Jessore', 23.1697, 89.2137),
City('Mymensingh', 24.7460, 90.4179),
City('Netrokona', 24.8821, 90.7231),


City('Riyadh', 24.7136, 46.6753),
City('Tehran', 35.6895, 51.3890),

City('Cairo', 30.0444, 31.2357),


City('Istanbul', 28.9784, 41.0082),

City('Dubai', 25.2769, 55.2962),

City('Jerusalem', 31.7683, 35.2137),
City('Baghdad', 33.3152, 44.3661),
City('Amman', 31.9454, 35.9284),
City('Doha', 25.2769, 51.5200),
City('Beirut', 33.8938, 35.5018),



    //
    
    
  ];


   @override
  void initState() {
    super.initState();
    // Set default city
    selectedCity = cities.first;
    // Initialize prayer times
    coordinates = Coordinates(selectedCity.latitude, selectedCity.longitude);
    date = DateTime.now();
    params = CalculationMethod.Karachi();
    prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
  }
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                
              SizedBox(
                width: 2000, // Define the desired width
                height: 200, // Define the desired height
                child: Image.asset('assets/dome.png',fit: BoxFit.cover,),
                ),
               // Image.asset('assets/dome.png',),
                //SizedBox(height: 20,),
                // Dropdown to select city
                DropdownButton<City>(
                  dropdownColor: Colors.grey.shade300,
                
                  value: selectedCity,
                  onChanged: (City? city) {
                    setState(() {
                      selectedCity = city!;
                      coordinates =
                          Coordinates(selectedCity.latitude, selectedCity.longitude);
                      prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
                    });
                  },
                  items: cities.map<DropdownMenuItem<City>>((City city) {
                    return DropdownMenuItem<City>(
                      value: city,
                      child: Text(city.name),
                    );
                  }).toList(),
                ), 
        
               // SizedBox(height: 20,),
                Container(
                  height: 25,
                  width: 200,
                  
                  child: Text("Fajar :${prayerTimes.fajr!.toLocal().hour}:${prayerTimes.fajr!.toLocal().minute}",
                    style: TextStyle(color:Colors.black,fontSize: 20 ),
                    textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                          
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(5,5),
                        
                        blurRadius: 5
                      ),
                          
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3,-3),
                        blurRadius: 5
                      )
                    ]
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 25,
                  width: 200,
        
                  child: Text("Sunrise :${prayerTimes.sunrise!.toLocal().hour}:${prayerTimes.sunrise!.toLocal().minute}",
                    style: TextStyle(color:Colors.black,fontSize: 20 ),
                    textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                    color: Colors.grey[300], borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(5,5),
                            blurRadius: 5
                        ),
        
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3,-3),
                            blurRadius: 5
                        )
                      ]
        
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 25,
                  width: 200,
                 
                  child: Text("Dhuhr :${prayerTimes.dhuhr!.toLocal().hour}:${prayerTimes.dhuhr!.toLocal().minute}",
                    style: TextStyle(color:Colors.black,fontSize: 20 ),
                    textAlign: TextAlign.center,),
                     decoration: BoxDecoration(
                       color: Colors.grey[300],
                         borderRadius: BorderRadius.circular(15),
                         boxShadow: [
                           BoxShadow(
                               color: Colors.grey.shade500,
                               offset: Offset(5,5),
                               blurRadius: 5
                           ),
        
                           BoxShadow(
                               color: Colors.white,
                               offset: Offset(-3,-3),
                               blurRadius: 5
                           )
                         ]
        
                     ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 25,
                  width: 200,
                 
                  child:  Text("Asr :${prayerTimes.asr!.toLocal().hour}:${prayerTimes.asr!.toLocal().minute}",
                    style: TextStyle(color:Colors.black,fontSize: 20 ),
                    textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(5,5),
                            blurRadius: 5
                        ),
        
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3,-3),
                            blurRadius: 5
                        )
                      ]
                  ),
        
                ),
                SizedBox(height: 20,),
                Container(
                  height: 25,
                  width: 200,
                  
                  child: Text("Maghrib :${prayerTimes.maghrib!.toLocal().hour}:${prayerTimes.maghrib!.toLocal().minute}",
                    style: TextStyle(color:Colors.black,fontSize: 20 ),
                    textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(5,5),
                            blurRadius: 5
                        ),
        
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3,-3),
                            blurRadius: 5
                        )
                      ]
                  ),
        
                ),
                SizedBox(height: 20,),
                Container(
                  height: 25,
                  width: 200,
                  
                  child: Text("Isha :${prayerTimes.isha!.toLocal().hour}:${prayerTimes.isha!.toLocal().minute}",
                    style: TextStyle(color:Colors.black,fontSize: 20 ),
                    textAlign: TextAlign.center,),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: Offset(5,5),
                            blurRadius: 5
                        ),
        
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset(-3,-3),
                            blurRadius: 5
                        )
                      ]
                  ),
        
                ),
        
        
              ],
            ),
            // Add more Text widgets as needed
          ],
        ),
      ),
     // backgroundColor: Colors.grey[250],
    );
  }
}
