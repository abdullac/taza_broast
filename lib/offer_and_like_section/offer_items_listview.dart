import 'package:flutter/material.dart';

import '../my_home_page.dart';
import 'offer_section.dart';

class OfferSectionGridOfferItemsList extends StatelessWidget {
  final SectionType sectionType;
  const OfferSectionGridOfferItemsList({
    super.key,
    required this.gridviewIndex,
    required this.sectionType,
  });

  final int gridviewIndex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Center(
        child: ListView.builder(
          itemCount: sectionType == SectionType.offer
              ? bestOfferMap.values.elementAt(gridviewIndex).length
              : 0,
          shrinkWrap: true,
          itemBuilder: (context, listIndex) => Text(
            sectionType == SectionType.offer
                ? "${bestOfferMap.values.elementAt(gridviewIndex).keys.elementAt(listIndex)} : ${bestOfferMap.values.elementAt(gridviewIndex).values.elementAt(listIndex)}."
                : "",
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: 11,
              fontSize: 15,
              color: Colors.purple[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
