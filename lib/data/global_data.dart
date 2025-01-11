// import 'package:flutter_final_project/models/place.dart';

// List<Place> allplaces = [];

import 'package:flutter_final_project/models/place.dart';
import 'package:flutter_final_project/data/places_list.dart';

List<Place> allplaces =
    placesList.map((placeData) => Place.fromJson(placeData)).toList();
