import 'package:adaptive_responsive/models/hotel.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet.dart';

class ListviewLayout extends StatefulWidget {
  final HotelPreview hotelInfo;

  const ListviewLayout({Key? key, required this.hotelInfo}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListviewLayoutState();
}

class _ListviewLayoutState extends State<ListviewLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GestureDetector(
        onTap: () => {
          showModalBottomSheet(
            context: context,
            builder: toggleBottomSheet,
          )
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.lightBlue, borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/' + widget.hotelInfo.poster,
                fit: BoxFit.fill,
              ),
              Center(
                child: Text(
                  widget.hotelInfo.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
