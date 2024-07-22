import 'package:flutter/material.dart';

import '../my_home_page.dart';
import 'like_item_section.dart';
import 'offer_and_like_section_grid_item.dart';
import 'offer_section.dart';

class OfferAndLikeSectionGridview extends StatelessWidget {
  final SectionType sectionType;
  final bool isExpanded;
  const OfferAndLikeSectionGridview({
    super.key,
    required this.sectionType,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 8,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: isExpanded == false
          ? 2
          : sectionType == SectionType.offer
              ? bestOfferMap.length
              : sectionType == SectionType.likeItem
                  ? likeItemMap.length
                  : 0,
      shrinkWrap: true,
      itemBuilder: (context, index) => OfferAndLikeSectionGridItem(
        sectionType: sectionType,
        gridviewIndex: index,
      ),
    );
  }
}
