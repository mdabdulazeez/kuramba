import 'package:flutter/material.dart';
import '../widgets/cards/contact_flowerpower_card.dart';
import '../widgets/cards/contact_data_card.dart';

class ContactProfileView extends StatelessWidget {
  static const routeName = '/contact_profile_view';

  @override
  Widget build(BuildContext context) {
    final AsyncSnapshot<dynamic> userSnapshot =
        ModalRoute.of(context)!.settings.arguments as AsyncSnapshot<dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          userSnapshot.connectionState == ConnectionState.waiting
              ? 'Contact'
              : userSnapshot.data['username'],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          ContactDataCard(),
          const SizedBox(height: 25.0),
          ContactFlowerpowerCard(),
        ],
      ),
    );
  }
}
