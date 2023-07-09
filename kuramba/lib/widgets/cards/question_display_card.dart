import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'custom_card.dart';

import 'package:sustainability_network/providers/question_catalog.dart';
import 'package:sustainability_network/models/question.dart';

class QuestionDisplayCard extends StatelessWidget {
  final Widget answerType;
  final String id;

  QuestionDisplayCard({
    required this.answerType,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionCatalog>(
      create: (context) => QuestionCatalog(),
      builder: (context, _) => FutureBuilder<Question>(
        future: Provider.of<QuestionCatalog>(
          context,
          listen: false,
        ).getQuestion(id),
        builder: (context, AsyncSnapshot<Question> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final question = snapshot.data;
            return CustomCard(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        question!.title,
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    answerType,
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('No data available');
          }
        },
      ),
    );
  }
}
