import 'package:flutter/material.dart';

import 'menu_section/menu_section.dart';
import 'offer_and_like_section/offer_section.dart';
import 'title_section.dart';

enum SectionType {
  offer,
  likeItem,
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(),
              OfferSection(),
              // LikeItemSection(),
              MenuSection(),
              // ConnectWithUs(),
            ],
          ),
        ),
      ),
    );
  }
}
