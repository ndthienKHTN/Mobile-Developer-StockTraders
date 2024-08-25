// search_bar.dart
import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;

  SearchBarCustom({required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          ),
          onChanged: (query) {
            onSearchChanged(query);
          },
        )
    );
  }
}
