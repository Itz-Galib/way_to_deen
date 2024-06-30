import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'BackgroundContainer.dart';

class tazbihcounter extends StatefulWidget {
  const tazbihcounter({super.key});
  //const tazbihcounter() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class DropDownState extends State<tazbihcounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TazbihScrollable(),
    );
  }
}

class TazbihScrollable extends StatefulWidget {
  @override
  State<TazbihScrollable> createState() => TazbihScrollableState();
}

class TazbihScrollableState extends State<TazbihScrollable> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  final List<String> items = [
    'سبحان الله',
    'الْحَمْدُ لِلَّهِ',
    'لا إله إلا الله محمد رسول الله',
    'اللَّهُ أَكْبَرُ',
    'أَسْتَغْفِرُ اللّٰهَ',
    'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    'سُبْحَانَ اللَّهِ الْعَظِيمِ',
    'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلاَ إِلَهَ إِلاَّ اللَّهُ وَاللَّهُ أَكْبَرُ',
    'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
    'سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه',
    'لَآ اِلٰهَ اِلَّآ اَنتَ سُبحٰنَکَ اِنِّی کُنتُ مِنَ الظَّالِمِینَ',
    'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلاَ إِلَهَ إِلاَّ اللَّهُ وَاللَّهُ أَكْبَرُ وَلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّ',
    'لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ، لَهُ الْمُلْكُ، وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        // debugShowCheckedModeBanner: false,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Tazbih to Recite',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red.shade800,
                            ),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        //  color: Colors.red,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                            _resetCounter();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 120,
                            width: 590,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 120,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FittedBox(
                        child: Text(
                          '$_counter',
                          textScaleFactor: 6,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.redAccent,
                                  onPressed: _resetCounter,
                                  tooltip: 'Reset',
                                  child: const Icon(Icons.close),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.green,
                                  onPressed: _incrementCounter,
                                  tooltip: 'Increment',
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            )));
  }
}
