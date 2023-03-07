import 'package:flutter/material.dart';

class ItemForecastWidget extends StatelessWidget {
  const ItemForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 13.0),
      margin: const EdgeInsets.only(right: 14.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Column(
        children: [
          Text(
            "12 AM",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Icon(
            Icons.cloud_queue,
            size: 26.0,
            color: Colors.white,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            "23ºC",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );
  }
}
