import 'package:adaptive_responsive/models/hotel.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'bottom_sheet.dart';

class GridviewLayout extends StatefulWidget {
  final HotelPreview hotelInfo;

  const GridviewLayout({Key? key, required this.hotelInfo}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridviewLayoutState();
}

class _GridviewLayoutState extends State<GridviewLayout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          transitionDuration: const Duration(milliseconds: 150),
          bodyBuilder: (context) => toggleBottomSheet(context),
          direction: PopoverDirection.bottom,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(15)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/' + widget.hotelInfo.poster,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                widget.hotelInfo.name,
                textAlign: TextAlign.center,
              )
            ]),
      ),
    );
  }
}
