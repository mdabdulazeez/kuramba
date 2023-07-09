import 'package:flutter/material.dart';
import 'package:sustainability_network/flower_power_icon.dart';
import 'custom_card.dart';

class ContactFlowerpowerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncSnapshot userSnapshot =
        ModalRoute.of(context)!.settings.arguments as AsyncSnapshot<dynamic>;
    return CustomCard(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: userSnapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                children: [
                  Icon(
                    FlowerPowerIcon.flowerpower,
                    //Icons.filter_vintage,
                    //Icons.eco,
                    //Icons.local_florist,
                    size: 50.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 30.0),
                  Text(
                    '12345',
                    style: TextStyle(fontSize: 30.0),
                  ),
                ],
              ),
      ),
    );
  }
}
