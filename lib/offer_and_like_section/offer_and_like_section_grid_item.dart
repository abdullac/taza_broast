
import 'package:flutter/material.dart';

import '../my_home_page.dart';
import 'like_item_section.dart';
import 'offer_and_like_section_gridItem_title.dart';
import 'offer_items_listview.dart';

class OfferAndLikeSectionGridItem extends StatelessWidget {
  final int gridviewIndex;
  final SectionType sectionType;
  const OfferAndLikeSectionGridItem({
    super.key,
    required this.gridviewIndex,
    required this.sectionType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.red[300], borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          OfferAndLikeSectionGridItemTitle(
            gridviewIndex: gridviewIndex,
            sectionType: sectionType,
          ),
          const Divider(
            color: Colors.red,
            height: 1,
          ),
          sectionType == SectionType.offer
              ? OfferSectionGridOfferItemsList(
                  gridviewIndex: gridviewIndex,
                  sectionType: sectionType,
                )
              : sectionType == SectionType.likeItem
                  ? Flexible(
                      child: Center(
                        child: Text(
                          likeItemMap.values.elementAt(gridviewIndex),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.pink[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
