import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff282B30),
      appBar: AppBar(
        title: const Text("WeatherApp"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.network(
            "https://cdn4.iconfinder.com/data/icons/weather-129/64/weather-2-512.png",
            color: Colors.white,
            height: 62.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "27",
                style: TextStyle(
                  fontSize: height * 0.13,
                  color: Colors.white,
                ),
              ),
              Text(
                " °C",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Arequipa, Perú",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          TextField(
            cursorColor: Color(0xffF66C2D),
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.08),
              hintText: "Ingresa una ciudad...",
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
