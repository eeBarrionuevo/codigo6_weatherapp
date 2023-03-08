import 'package:codigo6_weatherapp/models/location_weather_model.dart';
import 'package:codigo6_weatherapp/services/api_service.dart';
import 'package:codigo6_weatherapp/widgets/item_forecast_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationWeatherModel? locationWeatherModel;
  final TextEditingController _cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData("Lima");
  }

  getData(String cityName) async {
    ApiService apiService = ApiService();
    isLoading = true;
    setState(() {});
    locationWeatherModel = await apiService.getWeatherData(cityName);
    if (locationWeatherModel != null) {
      isLoading = false;
      setState(() {});
    }
  }

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
      body: !isLoading && locationWeatherModel != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
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
                            locationWeatherModel!.current.tempC.toString(),
                            // "${locationWeatherModel!.current.tempC}",
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
                            "${locationWeatherModel!.location.name}, ${locationWeatherModel!.location.country}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _cityController,
                        cursorColor: const Color(0xffF66C2D),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.08),
                          hintText: "Ingresa una ciudad...",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "El campo es obligatorio";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              String cityName = _cityController.text;
                              getData(cityName);
                            }
                          },
                          child: Text(
                            "Buscar",
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF66C2D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: const [
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                            ItemForecastWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xffF66C2D),
                  strokeWidth: 2,
                ),
              ),
            ),
    );
  }
}
