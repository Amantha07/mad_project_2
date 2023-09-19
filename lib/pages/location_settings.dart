
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mad_project/components/back_dots.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LocationSettings extends StatefulWidget {
  const LocationSettings({Key? key});

  @override
  State<LocationSettings> createState() => _LocationSettingsState();
}

class _LocationSettingsState extends State<LocationSettings> {
  bool allowLocation = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: BackDots(
        title: "Location",
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.06,
                top: size.width * 0.025,
                right: size.width * 0.06,
              ),
              child: Container(
                height: size.height * 0.10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: HexColor("#EAFEED"),
                ),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    location(size, "Location", allowLocation),
                    SizedBox(height: 10.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 11),
                      child: Text(
                        "Turn on location for personalized campus navigation",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row location(Size size, String name, bool available) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.03),
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(right: size.width * 0.03),
            child: FlutterSwitch(
              width: 50.0,
              height: 25.0,
              activeColor: HexColor("#2A9A5C"),
              activeText: "ON",
              inactiveText: "OFF",
              value: available,
              onToggle: (value) {
                setState(() {
                  allowLocation = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}