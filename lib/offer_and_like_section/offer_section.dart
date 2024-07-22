import 'package:flutter/material.dart';

import '../container_with_properties.dart';
import '../my_home_page.dart';
import 'offer_and_like_section_bottom.dart';
import 'offer_and_like_section_gridview.dart';
import 'offer_and_like_section_title.dart';

ValueNotifier<bool> isExpandedOffersSectionNotifier = ValueNotifier(false);
ValueNotifier<bool> isExpandedLikeIyemSectionNotifier = ValueNotifier(false);

bool a = true;

class OfferSection extends StatelessWidget {
  const OfferSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWithProperties(
      child: ValueListenableBuilder(
        valueListenable: isExpandedOffersSectionNotifier,
        builder: (context, value, child) => Column(
          children: [
            const OfferAndLikeSectionTitle(title: "Best Offers for You"),
            OfferAndLikeSectionGridview(
              sectionType: SectionType.offer,
              isExpanded: isExpandedOffersSectionNotifier.value,
            ),
            const OfferAndLikeSectionBottom(
              seeMoreText: "Offers",
              sectionType: SectionType.offer,
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, Map<String, String>> bestOfferMap = {
  "Today Offer": todayOfferItems,
  "Special Offer": specialOfferItems,
  // "Today Offer": todayOfferItems,
  // "Special Offer": specialOfferItems,
  // "Combo Offer": comboOfferItems,
  // "Student Offer": studentOfferItems,
  // "Weak End Offer": weakEndOfferItems,
  // "Custome Offer": customeOfferItems,
};

Map<String, String> todayOfferItems = {
  "fULL BROAST": " ONLY RS 400",
  // "Shawarma": "5% Discount",
  // "Snickers Shake": "Rs 60",
  // "Hot Boost": "Rs 4 Discound",
};

Map<String, String> specialOfferItems = {
  "CHILLI BROAST": "ONLY RS 410"
  // "Shawarma Plate": "6% Discount",
  // "AvilMilk Special": "Rs 10 Discount",
  // "Hot Horliks": "Rs 20",
  // "Chicken Sandwich": "5% Discount"
};

Map<String, String> comboOfferItems = {
  "item1": "Shawarma Roll",
  "item2": "Orio Shake",
  "item3": "7up 700ml",
  "price": "150",
  "offerPrice": "130",
  "offerPercentage": "5.0"
};

Map<String, String> studentOfferItems = {
  "Shawarma Roll": "Rs 68",
  "All Milk Shakes": "Rs 10 Discount",
  "All Juices": "Rs 5 Discount",
  "Lime Juice": "Rs 15",
  "Tea": "Rs 10",
  "Egg Puffs": "Rs 18"
};

Map<String, String> weakEndOfferItems = {
  "Shawarma Roll": "Free 1 Mint Lime Juice",
  "Sharjah Milk Shakes": "Free 1 Chicken Samoosa",
  "Grape Lime Juice": "rs 10 Discount on Chicken Sandwich",
  "Coffee": "5% Discount on Any 1 Snack",
  "Chicken Burger": "Free Pineapple Lime Juice"
};

Map<String, String> customeOfferItems = {
  "Your Favourite Drink": "Select One Any Milk Shake",
  "Your Favourite Snack": "Select One Any Snack",
  "Additional Items": "Select One Ore More Items",
};
