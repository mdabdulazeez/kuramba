import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/question.dart';

class QuestionCatalog with ChangeNotifier {
  List<QuestionPreview> _questionPreviews = [];

  Future<void> fetchQuestionPreviews() async {
    try {
      final previewDoc = await FirebaseFirestore.instance
          .collection('questions')
          .doc('previews')
          .get();

      if (previewDoc.exists) {
        _questionPreviews = [];
        final previewData = previewDoc.data();
        previewData?.forEach((key, value) {
          _questionPreviews.add(
            QuestionPreview(
              id: key,
              title: value['title'],
              category: value['category'],
            ),
          );
        });
      }
    } catch (error) {
      throw error;
    }
  }

  List<QuestionPreview> get previews => [..._questionPreviews];

  Future<Question> getQuestion(String id) async {
    try {
      final questionDoc = await FirebaseFirestore.instance
          .collection('questions')
          .doc(id)
          .get();

      if (questionDoc.exists) {
        final questionData = questionDoc.data();
        final questionTitle = questionData?['title'];
        final questionCategory = questionData?['category'];

        switch (questionData?['type']) {
          case 'number':
            return NumberQuestion(
              id: id,
              title: questionTitle!,
              category: questionCategory!,
              question: questionData?['question'],
              minValue: questionData?['minValue'] ?? 0,
              maxValue: questionData?['maxValue'] ?? 1,
            );
          case 'checkbox':
            return CheckBoxQuestion(
              id: id,
              title: questionTitle!,
              category: questionCategory!,
              question: questionData?['question'],
              answers: (questionData?['answers'] as List<dynamic>)
                  .map((answer) => Answer(
                        answer: answer['answer'],
                        points: answer['points'],
                      ))
                  .toList(),
              requiredAnswers: questionData?['requiredAnswers'] ?? 1,                  
            );
          case 'combobox':
            return ComboBoxQuestion(
              id: id,
              title: questionTitle!,
              category: questionCategory!,
              question: questionData?['question'],
              answers: (questionData?['answers'] as List<dynamic>)
                  .map((answer) => Answer(
                        answer: answer['answer'],
                        points: answer['points'],
                      ))
                  .toList(),
            );
          case 'radiobutton':
            return RadioButtonQuestion(
              id: id,
              title: questionTitle!,
              category: questionCategory!,
              question: questionData?['question'],
              answers: (questionData?['answers'] as List<dynamic>)
                  .map((answer) => Answer(
                        answer: answer['answer'],
                        points: answer['points'],
                      ))
                  .toList(),
            );
          case 'slider':
            return SliderQuestion(
              id: id,
              title: questionTitle!,
              category: questionCategory!,
              question: questionData?['question'] ?? '',
              minValue: questionData?['minValue'] ?? 0,
              maxValue: questionData?['maxValue'] ?? 1,
              divisions: questionData?['divisions'] ?? 1,
            );

          default:
            return Question(
              id: id,
              title: questionTitle!,
              category: questionCategory!,
              question: questionData?['question'],
            );
        }
      } else {
        throw StateError('Question not found.');
      }
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}
