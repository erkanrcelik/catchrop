import 'package:flutter/material.dart';

import '../../../product/init/theme/color/colors.dart';

class SearchCard extends StatefulWidget {
  SearchCard({Key? key, this.onChanged, required this.text}) : super(key: key);
  final Function(String)? onChanged;
  final String text;

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.text,
        hintStyle: TextStyle(
            color: ProductColorsTheme().searchTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search_outlined,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
