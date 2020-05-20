import 'package:c2btechweatherapidemo/data_model/weather_data_pojo.dart';
import 'package:c2btechweatherapidemo/services/network_service.dart';
import 'package:flutter/material.dart';

//This will deal with anything and everything related to weather,
// the network class gives the input to this class.

const apiKey = "e8602e0331bd3ab56fbaf6b3e237f16b";
const List<String> cityNames = [
  'Mumbai',
  'Pune',
  'Chennai',
  'Bangalore',
  'Hyderabad'
];

class WeatherData {
  Networking _networking = Networking();

  String name;
  String country;
  String temperature;
  String weatherIcon;
  String weatherDescription;

  Future<Weather> getLocationWeather(String city) async {
    String url =
        "http://api.weatherstack.com/current?access_key=$apiKey&query=$city";

    dynamic response = await _networking.getData(url);
    name = (response['location']['name']).toString();
    country = (response['location']['country']).toString();
    temperature = (response['current']['temperature']).toString();
    weatherIcon = response['current']['weather_icons'][0];
    weatherDescription =
        (response['current']['weather_descriptions'][0]).toString();
    Weather weather = new Weather(
        name: name,
        country: country,
        temperature: temperature,
        weatherIcon: weatherIcon,
        weatherDescription: weatherDescription);

    return weather;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItem() {
    List<DropdownMenuItem<String>> dropDownItemList = [];

    for (String city in cityNames) {
      print(city);

      var newItem = DropdownMenuItem(
        child: Text(city),
        value: city,
      );
      dropDownItemList.add(newItem);
    }

    return dropDownItemList;
  }
}