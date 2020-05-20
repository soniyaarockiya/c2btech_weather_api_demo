import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:c2btechweatherapidemo/constants/ui_constants.dart';

class CardView extends StatelessWidget {
  final String name;
  final String country;
  final String temperature;
  final String weatherIcon;
  final String weatherDescription;

  CardView(
      {this.name,
      this.country,
      this.temperature,
      this.weatherIcon,
      this.weatherDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.grey[400],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(weatherIcon),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Text('$temperature-$country'),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: kTextFieldStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      //TODO: 2 Edit style as constant
                      //TODO: 3 Text widgets are repeated
                      weatherDescription,
                      textAlign: TextAlign.center,
                      style: kTextFieldStyle.copyWith(
                          fontSize: 15.0, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
