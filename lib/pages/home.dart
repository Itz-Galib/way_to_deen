import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:waytodeen2/pages/BackgroundContainer.dart';

class City {
  final String name;
  final double latitude;
  final double longitude;

  City(this.name, this.latitude, this.longitude);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyScrollableBox(),
    );
  }
}

class MyScrollableBox extends StatefulWidget {
  @override
  State<MyScrollableBox> createState() => _MyScrollableBoxState();
}

class _MyScrollableBoxState extends State<MyScrollableBox> {
  late PrayerTimes prayerTimes;
  late DateTime date;
  late Coordinates coordinates;
  late CalculationParameters params;
  late City selectedCity;

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
  ];

  @override
  void initState() {
    super.initState();
    selectedCity = cities.first;
    coordinates = Coordinates(selectedCity.latitude, selectedCity.longitude);
    date = DateTime.now();
    params = CalculationMethod.Karachi();
    prayerTimes = PrayerTimes(coordinates, date, params, precision: true);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    width: 2000,
                    height: 200,
                    child: Image.asset(
                      'assets/dome.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  DropdownButton<City>(
                    value: selectedCity,
                    onChanged: (City? city) {
                      setState(() {
                        selectedCity = city!;
                        coordinates = Coordinates(
                            selectedCity.latitude, selectedCity.longitude);
                        prayerTimes = PrayerTimes(coordinates, date, params,
                            precision: true);
                      });
                    },
                    items: cities.map<DropdownMenuItem<City>>((City city) {
                      return DropdownMenuItem<City>(
                        value: city,
                        child: Text(city.name),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  PrayerTimeCard(
                    prayerName: "Fajr",
                    time: prayerTimes.fajr!,
                  ),
                  SizedBox(height: 20),
                  PrayerTimeCard(
                    prayerName: "Sunrise",
                    time: prayerTimes.sunrise!,
                  ),
                  SizedBox(height: 20),
                  PrayerTimeCard(
                    prayerName: "Dhuhr",
                    time: prayerTimes.dhuhr!,
                  ),
                  SizedBox(height: 20),
                  PrayerTimeCard(
                    prayerName: "Asr",
                    time: prayerTimes.asr!,
                  ),
                  SizedBox(height: 20),
                  PrayerTimeCard(
                    prayerName: "Maghrib",
                    time: prayerTimes.maghrib!,
                  ),
                  SizedBox(height: 20),
                  PrayerTimeCard(
                    prayerName: "Isha",
                    time: prayerTimes.isha!,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrayerTimeCard extends StatelessWidget {
  final String prayerName;
  final DateTime time;

  const PrayerTimeCard({
    Key? key,
    required this.prayerName,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 200,
      child: Text(
        "$prayerName :${time.toLocal().hour}:${time.toLocal().minute}",
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(5, 5),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -3),
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
