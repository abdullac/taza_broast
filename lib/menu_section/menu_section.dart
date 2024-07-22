import 'package:flutter/material.dart';

import '../container_with_properties.dart';
import 'menu_by_catogory_page/menu_by_catogory_page.dart';
class MenuSection extends StatelessWidget {
  const MenuSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWithProperties(
      child: Column(
        children: [
          const MenuTitle(),
          const CatogoriesGridView(),
          makeCatogoryWithGridItem(),
          // MenuCatogoryWithItems(),
        ],
      ),
    );
  }
}

class MenuTitle extends StatelessWidget {
  const MenuTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "MENU",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.w900,
          fontSize: 21,
        ),
      ),
    );
  }
}

class CatogoriesGridView extends StatelessWidget {
  const CatogoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (menuSnacksListByCatogoriesOfMap.length +
          menuDrinksListByCatogoriesOfMap.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) => CatogoriesGridItem(
        itemIndex: index,
      ),
    );
  }
}

class CatogoriesGridItem extends StatelessWidget {
  final int itemIndex;
  const CatogoriesGridItem({
    super.key,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<String> allCatogoriesTitleList = createAllCatogoryTitleList();
    Map<String, List<String>> catogoriesListOfMap = {};
    catogoriesListOfMap.addAll(menuSnacksListByCatogoriesOfMap);
    catogoriesListOfMap.addAll(menuDrinksListByCatogoriesOfMap);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MenuByCatogoryPage(
                  catogoryTitle:
                      catogoriesListOfMap.entries.elementAt(itemIndex).key,
                  itemsByCatogory:
                      catogoriesListOfMap.entries.elementAt(itemIndex).value,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.red.withAlpha(100),
          ),
        ),
        child: Center(
          child: Text(
            allCatogoriesTitleList[itemIndex],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class MenuCatogoryWithItems extends StatelessWidget {
  final int catogoryTitleCount;
  final List<String> catogoryTitleList;
  final List<List<String>> catogoryItemsList;
  const MenuCatogoryWithItems({
    super.key,
    required this.catogoryTitleCount,
    required this.catogoryTitleList,
    required this.catogoryItemsList,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWithProperties(
      customeColor: Colors.red[200],
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: catogoryTitleCount,
        itemBuilder: (context, index) => ItemsListView(
          catogoryIndex: index,
          catogoryTitleList: catogoryTitleList,
          catogoryItemsList: catogoryItemsList,
        ),
      ),
    );
  }
}

class ItemsListView extends StatelessWidget {
  final int catogoryIndex;
  final List<String> catogoryTitleList;
  final List<List<String>> catogoryItemsList;
  const ItemsListView({
    super.key,
    required this.catogoryIndex,
    required this.catogoryTitleList,
    required this.catogoryItemsList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWithProperties(
          customeColor: Colors.red[300],
          child: Text(
            catogoryTitleList[catogoryIndex],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        ListView.builder(
          itemCount: catogoryItemsList[catogoryIndex].length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => ItemsByCatogory(
            catogoryIndex: catogoryIndex,
            itemsIndex: index,
            itemsList: catogoryItemsList[catogoryIndex],
          ),
        )
      ],
    );
  }
}

class ItemsByCatogory extends StatelessWidget {
  final int catogoryIndex;
  final int itemsIndex;
  final List<String> itemsList;
  const ItemsByCatogory({
    super.key,
    required this.catogoryIndex,
    required this.itemsIndex,
    required this.itemsList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          itemsList[itemsIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}

Widget makeCatogoryWithGridItem() {
  List<String> catogoryTypes = [
    "snacks",
    "drinks",
  ];
  List<String> snacksTitleList = [];
  List<List<String>> snacksItemsList = [];
  List<String> drinksTitleList = [];
  List<List<String>> drinksItemsList = [];

  for (int index = 0; index < menuSnacksListByCatogoriesOfMap.length; index++) {
    snacksTitleList
        .add(menuSnacksListByCatogoriesOfMap.entries.elementAt(index).key);
    snacksItemsList
        .add(menuSnacksListByCatogoriesOfMap.entries.elementAt(index).value);
  }

  for (int index = 0; index < menuDrinksListByCatogoriesOfMap.length; index++) {
    drinksTitleList
        .add(menuDrinksListByCatogoriesOfMap.entries.elementAt(index).key);
    drinksItemsList
        .add(menuDrinksListByCatogoriesOfMap.entries.elementAt(index).value);
  }

  List<Widget> widgetList = [];
  for (int index = 0; index < catogoryTypes.length; index++) {
    if (catogoryTypes[index] == "snacks") {
      widgetList.add(MenuCatogoryWithItems(
        catogoryTitleCount: menuSnacksListByCatogoriesOfMap.length,
        catogoryTitleList: snacksTitleList,
        catogoryItemsList: snacksItemsList,
      ));
    } else if (catogoryTypes[index] == "drinks") {
      widgetList.add(MenuCatogoryWithItems(
        catogoryTitleCount: menuDrinksListByCatogoriesOfMap.length,
        catogoryTitleList: drinksTitleList,
        catogoryItemsList: drinksItemsList,
      ));
    }
  }
  return Column(
    children: widgetList,
  );
}

List<String> createAllCatogoryTitleList() {
  List<String> catogoriesTitleList = [];
  for (var element in menuSnacksListByCatogoriesOfMap.keys) {
    catogoriesTitleList.add(element);
  }
  for (var element in menuDrinksListByCatogoriesOfMap.keys) {
    catogoriesTitleList.add(element);
  }
  return catogoriesTitleList;
}

Map<String, List<String>> menuSnacksListByCatogoriesOfMap = {
  "SHAWARMA": [
    "Plate Shawarma",
    "Roll Shawarma",
    // "SP Plate Shawarma",
    // "SP Roll Shawarma"
  ],
  "BURGER": [
    "Zinger Burger",
    "Zinger Cheese Burger",
    "Chicken Burger",
    "Chicken Cheese Burger",
    "Veg Burger",
    "Veg Cheese Burger"
  ],
  "SANDWICH": [
    // "SP Sandwich",
    // "Spanish Sandwich",
    "Chicken Sandwich",
    "Veg Sandwich"
  ],
  // "PUFFS": ["Chicken Puffs", "Egg Puffs", "Veg Puffs"],
  // "OTHER SNACKS": [
  //   "Chicken Roll",
  //   "Chicken Samoosa",
  //   "Veg Samoosa",
  //   "Chicken Cutlet",
  //   "Veg Cutlet"
  // ],
  "BROAST": ["FULL BROAST", "HALF BROAST", "6 PCS", "2 PCS"],
  "CHILLI BROAST": ["CHILLI BROAST 20 PCS", "CHILLI BROAST 15 PCS"],
};

Map<String, List<String>> menuDrinksListByCatogoriesOfMap = {
  // "FALOODA": ["SP Falooda", "Nuts Falooda", "Normal Falooda"],
  // "SALAD": ["SP Fruit Salad", "Normal Fruit Salad"],
  // "AVIL MILK": ["SP Avil Milk", "Normal Avil Milk"],
  // "ICE CREAM": [
  //   "Butter Scoch Scoop",
  //   "Chocolate Scoop",
  //   "Strawberry Scoop",
  //   "Pista Scoop",
  //   "Vanilla Scoop"
  // ],
  // "SPECIAL MILK SHAKE": [
  //   // "Kashmeeri Milk Shake",
  //   // "Black Berry Milk Shake",
  //   // "Almond Milk Shake",
  //   // "Cashew Milk Shake",
  //   // "Dark Fantasy Milk Shake",
  //   // "KitKat Milk Shake",
  //   // "Galexy Milk Shake",
  //   // "Snickers Milk Shake",
  //   // "Tender Coconut Milk Shake",
  // ],
  // "MILK SHAKE": [
  //   // "Butter Scoch Milk Shake",
  //   // "Strawberry Milk Shake",
  //   // "Chocolate Milk Shake",
  //   // "Pista Milk Shake",
  //   // "Vanilla Milk Shake",
  //   // "Badam Mix Milk Shake",
  //   // "Orio Milk Shake",
  //   // "Cool CoffeeMilk Shake",
  //   // "Avocado Milk Shake",
  //   // "Dates Milk Shake",
  //   // "Pappaya Milk Shake",
  //   // "Anar Milk Shake",
  //   // "Apple Milk Shake",
  //   // "Mango Milk Shake",
  //   // "Chikku Milk Shake",
  //   // "Sharjah Milk Shake",
  // ],
  // "FRESH JUICE": [
  //   // // "Grape Juice",
  //   // "Mussambi Juice",
  //   // // "Mango Juice",
  //   // "Pineapple Juice",
  //   // "Orange Juice",
  //   // "Apple Juice",
  //   // "Pappaya Juice",
  //   // "Shamam Juice",
  //   // "Carrot Juice",
  //   // "Badam Juice"
  // ],
  "JUICE":[],
  "LIME JUICE": [
    "Fresh Lime",
    "Pineapple Lime",
    "Mint Lime",
    // "Ginger Lime",
    // "Grape Lime",
  ],
  "HOT DRINKS": [
    "Boost",
    "Horlicks",
    // "Badam Milk",
    "Bru Coffee",
    "Black Tea",
    "Tea",
  ],
};
