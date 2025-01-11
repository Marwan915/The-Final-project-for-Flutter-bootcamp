import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/models/place.dart';

class DetailsPage extends StatelessWidget {
  final Place place;

  DetailsPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        backgroundColor: Color(0xFF008B49),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عرض الصور بشكل أفقي
            Container(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: place.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: place.images[index],
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Image.asset(
                            'assets/no_image.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                },
              ),
            ),

            // عرض الاسم والسعر والتقييم
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF008B49),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Color(0xFF008B49)),
                      SizedBox(width: 5),
                      Text(
                        '${place.price} SAR / day',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(
                        '${place.rating}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // وصف المكان في بطاقة
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // زيادة المسافة الجانبية
              child: Card(
                elevation: 10, //  الظل
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // جعل الحواف أكثر انحناء
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.all(24.0), // زيادة المسافة داخل البطاقة
                  child: Text(
                    place.description,
                    style: TextStyle(
                      fontSize: 22, // زيادة حجم النص
                      height: 1.6, // زيادة المسافة بين السطور
                      color: Colors.grey[850], // استخدام لون داكن أكثر
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
