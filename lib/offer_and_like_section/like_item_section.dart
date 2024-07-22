import 'package:flutter/material.dart';

import '../container_with_properties.dart';
import '../my_home_page.dart';
import 'offer_and_like_section_bottom.dart';
import 'offer_and_like_section_gridview.dart';
import 'offer_and_like_section_title.dart';
import 'offer_section.dart';
class LikeItemSection extends StatelessWidget {
  const LikeItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWithProperties(
      child: ValueListenableBuilder(
        valueListenable: isExpandedLikeIyemSectionNotifier,
        builder: (context, value, child) => Column(
          children: [
            const OfferAndLikeSectionTitle(
              title: "You May Like",
            ),
            OfferAndLikeSectionGridview(
              sectionType: SectionType.likeItem,
              isExpanded: isExpandedLikeIyemSectionNotifier.value,
            ),
            const OfferAndLikeSectionBottom(
              seeMoreText: "Items",
              sectionType: SectionType.likeItem,
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, String> likeItemMap = {
  "Shawarma": "Delesious Tasty Shawaram.\nPlate Shawarma\nRoll Shawarma",
  "Hot Boost": "Get More Energy.",
  "Burger": "Eat with Big Bite this Burger",
  "Falooda": "Available More Flavoured Faloodas",
  "Sandwich": "Eat Sandwich with Any Drinks",
  "Sp Avil Milk": "You Can Taste Avil Milk with Icecream",
};
