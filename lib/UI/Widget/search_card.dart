import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        color: Colors.white,
        child: Text(
          title,
          style: const TextStyle(
            color: AppConstants.clrBlueTint,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
