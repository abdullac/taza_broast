import 'package:flutter/material.dart';

import '../my_home_page.dart';
import 'offer_section.dart';

class OfferAndLikeSectionBottom extends StatelessWidget {
  final String seeMoreText;
  final SectionType sectionType;
  const OfferAndLikeSectionBottom({
    super.key,
    required this.seeMoreText,
    required this.sectionType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "T&C Apply",
          style: TextStyle(
            fontSize: 7,
          ),
        ),
        InkWell(
          onTap: () {
            sectionType == SectionType.offer
                ? isExpandedOffersSectionNotifier.value =
                    isExpandedOffersSectionNotifier.value == false
                        ? true
                        : false
                : sectionType == SectionType.likeItem
                    ? isExpandedLikeIyemSectionNotifier.value =
                        isExpandedLikeIyemSectionNotifier.value == false
                            ? true
                            : false
                    : null;
          },
          child: ValueListenableBuilder(
            valueListenable: sectionType == SectionType.offer
                ? isExpandedOffersSectionNotifier
                : sectionType == SectionType.likeItem
                    ? isExpandedLikeIyemSectionNotifier
                    : isExpandedLikeIyemSectionNotifier, //temporary
            builder: (context, value, child) => Text(
              sectionType == SectionType.offer
                  ? isExpandedOffersSectionNotifier.value == false
                      ? "See More $seeMoreText >>"
                      : "<< See Less "
                  : sectionType == SectionType.likeItem
                      ? isExpandedLikeIyemSectionNotifier.value == false
                          ? "See More $seeMoreText >>"
                          : "<< See More "
                      : "",
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
