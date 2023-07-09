import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'custom_card.dart';
import '../../views/contact_profile_view.dart';

class UserCard extends StatelessWidget {
  final String userID;

  UserCard(this.userID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: FirebaseFirestore.instance.collection('users').doc(userID).get(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (userSnapshot.hasError) {
          return Text('Error: ${userSnapshot.error}');
        } else if (!userSnapshot.hasData) {
          return Text('No user data available');
        }

        final userData = userSnapshot.data!.data();
        final imageUrl = userData?['image_url'];
        final username = userData?['username'];

        return CustomCard(
          onTap: () {
            Navigator.of(context).pushNamed(
              ContactProfileView.routeName,
              arguments: userSnapshot,
            );
          },
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: imageUrl == null
                      ? Image.asset(
                          'assets/images/blank_profile_picture.png',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor.withOpacity(0.8),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: Text(
                      '$username',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
