import 'package:flutter/material.dart';

class ConnectWithUs extends StatelessWidget {
  const ConnectWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> connectUsTexts = [
      "96##**##**##",
      "shopName@gmail.com",
      "shopName/whatsapp",
      "shopName/facebook",
      "shopName/instagram",
      "shopName/youtube",
    ];

    return Column(
      children: [
        const Text(
          "CONNECT WITH US",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 16, color: Colors.red),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: connectUsTexts.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Text(
              connectUsTexts[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red[400],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
