
import 'package:flutter/material.dart';

import '../my_home_page.dart';
import 'like_item_section.dart';
import 'offer_section.dart';

class OfferAndLikeSectionGridItemTitle extends StatelessWidget {
  final SectionType sectionType;
  const OfferAndLikeSectionGridItemTitle({
    super.key,
    required this.gridviewIndex,
    required this.sectionType,
  });

  final int gridviewIndex;

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionType == SectionType.offer
          ? bestOfferMap.keys.elementAt(gridviewIndex)
          : sectionType == SectionType.likeItem
              ? likeItemMap.keys.elementAt(gridviewIndex)
              : "",
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}