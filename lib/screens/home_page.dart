import 'package:c2btechweatherapidemo/data_model/weather_data_pojo.dart';
import 'package:flutter/material.dart';
import 'package:c2btechweatherapidemo/services/current_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:c2btechweatherapidemo/services/weather_data.dart';
import 'package:c2btechweatherapidemo/sub_widgets/card_view.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CurrentLocation _currentLocation = new CurrentLocation();
  Weather _weather = new Weather();
  WeatherData _weatherData = new WeatherData();

  String currentCity = 'Mumbai';
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Home'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: loading == true
                  ? Center(child: CupertinoActivityIndicator())
                  : CardView(
                      name: _weather.name,
                      country: _weather.country,
                      temperature: _weather.temperature,
                      weatherIcon: _weather.weatherIcon,
                      weatherDescription: _weather.weatherDescription,
                    ),
            ),
            Expanded(
              child: DropdownButton(
                iconSize: 40.0,
                items: _weatherData.getDropDownMenuItem(),
                value: currentCity,
                onChanged: (value) {
                  setState(() {
                    currentCity = value;
                    getWeatherData(currentCity);
                  });
                },
              ),
            )
          ],
        ));
  }

  void getCurrentLocation() async {
    Position _position = await _currentLocation.getLocation();
    String city =
        ("${_position.latitude.toString()},${_position.longitude.toString()}")
            .trim();
    getWeatherData(city);
  }

  void getWeatherData(String city) async {
    Weather weather = await _weatherData.getLocationWeather(city);
    setState(() {
      _weather = weather;
      loading = false;
    });
  }
}
