import 'package:flutter/material.dart';

class DisplayWeatherCard extends StatelessWidget {
  const DisplayWeatherCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.imgPath,
  });

  final String title, subtitle, value, imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 190,
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Image.asset(
                imgPath,
                height: 39,
                width: 39,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
