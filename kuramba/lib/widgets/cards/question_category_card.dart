import 'package:flutter/material.dart';

import 'question_card.dart';

import '../../models/question.dart';

class QuestionCategoryCard extends StatelessWidget {
  final Color color;
  final String category;
  final List<QuestionPreview> previews;

  QuestionCategoryCard({
    required this.previews,
    required this.color,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ExpansionTile(
        collapsedBackgroundColor: color,
        backgroundColor: color,
        collapsedTextColor: Theme.of(context).textTheme.bodyText2!.color,
        textColor: Theme.of(context).textTheme.bodyText2!.color,
        iconColor: Theme.of(context).textTheme.bodyText2!.color,
        title: Text(
          category,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        children: previews.map((preview) {
          return QuestionCard(
            preview: preview,
            color: color,
          );
        }).toList(),
      ),
    );
  }
}
