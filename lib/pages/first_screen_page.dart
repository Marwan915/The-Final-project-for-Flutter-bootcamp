import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/data/global_data.dart';
import 'package:flutter_final_project/models/place.dart';
import 'package:flutter_final_project/pages/chat_page.dart';
import 'package:flutter_final_project/pages/map_page.dart';
import 'package:flutter_final_project/pages/profile_page.dart';
import 'package:flutter_final_project/service/api.dart';
import 'details_page.dart';

class FirstScreenPage extends StatefulWidget {
  @override
  _FirstScreenPageState createState() => _FirstScreenPageState();
}

class _FirstScreenPageState extends State<FirstScreenPage> {
  double temperature = 0.0;
  String selectedCity = 'Riyadh'; // المدينة الافتراضية
  List<Place> places = [];

  @override
  void initState() {
    super.initState();
    fetchTemperature(selectedCity); // تمرير المدينة المختارة هنا
    loadPlaces();
  }

  // جلب درجة الحرارة من API
  Future<void> fetchTemperature(String city) async {
    try {
      double temp = await Api().fetchTemperature(city: city);
      setState(() {
        temperature = temp; // تحديث درجة الحرارة
      });
    } catch (e) {
      setState(() {
        temperature = 0.0; // في حالة وجود خطأ، عرض درجة حرارة 0
      });
      print("Error fetching temperature: $e");
    }
  }

  // تحميل الأماكن بناءً على المدينة المختارة
  void loadPlaces() {
    setState(() {
      places = allplaces.where((place) => place.city == selectedCity).toList();
    });
  }

  // واجهة المستخدم
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TourKSA',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF008B49),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // عرض درجة الحرارة واختيار المدينة
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color(0xFF008B49),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thermostat, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      '$temperature°C',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: selectedCity,
                  dropdownColor: Color(0xFF008B49),
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newCity) {
                    setState(() {
                      selectedCity = newCity!;
                      fetchTemperature(
                          selectedCity); // جلب درجة الحرارة عند تغيير المدينة
                      loadPlaces(); // إعادة تحميل الأماكن بعد تغيير المدينة
                    });
                  },
                  items: <String>['Riyadh', 'Jeddah']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          // عرض قائمة الأماكن
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: places.length,
              itemBuilder: (context, index) {
                Place place = places[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(place: place),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // عرض أول صورة من قائمة الصور
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CachedNetworkImage(
                            imageUrl:
                                place.images.isNotEmpty ? place.images[0] : '',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                                child:
                                    CircularProgressIndicator()), // عرض مؤشر تحميل أثناء جلب الصورة
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/no_image.png', // عرض صورة افتراضية عند حدوث خطأ
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            place.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // if (index == 0)
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (_) => HomePage()));
          if (index == 1)
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => MapPage()));
          if (index == 2)
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ChatPage()));
          if (index == 3)
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfilePage()));
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        selectedItemColor: Color(0xFF008B49),
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}

