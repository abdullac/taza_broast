import 'package:flutter/material.dart';

class MenuByCatogoryPage extends StatelessWidget {
  final String catogoryTitle;
  final List<String> itemsByCatogory;
  const MenuByCatogoryPage({
    super.key,
    required this.catogoryTitle,
    required this.itemsByCatogory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  catogoryTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: itemsByCatogory.length,
                itemBuilder: (context, index) => Text(
                  itemsByCatogory[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
