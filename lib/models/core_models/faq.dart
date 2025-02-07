// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FAQ {
  final String id;
  final String questionTextInEnglish;
  final String answerTextInEnglish;
  final String questionTextInArabic;
  final String answerTextInArabic;
  final int order;
  FAQ({
    required this.id,
    required this.questionTextInEnglish,
    required this.answerTextInEnglish,
    required this.order,
    required this.questionTextInArabic,
    required this.answerTextInArabic,
  });

  FAQ copyWith({
    String? id,
    String? questionTextInEnglish,
    String? answerTextInEnglish,
    int? order,
    String? questionTextInArabic,
    String? answerTextInArabic,
  }) {
    return FAQ(
      id: id ?? this.id,
      questionTextInEnglish:
          questionTextInEnglish ?? this.questionTextInEnglish,
      answerTextInEnglish: answerTextInEnglish ?? this.answerTextInEnglish,
      order: order ?? this.order,
      questionTextInArabic: questionTextInArabic ?? this.questionTextInArabic,
      answerTextInArabic: answerTextInArabic ?? this.answerTextInArabic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionTextInEnglish': questionTextInEnglish,
      'answerTextInEnglish': answerTextInEnglish,
      'order': order,
      "id": id
    };
  }

  factory FAQ.fromMap(Map<String, dynamic> map) {
    return FAQ(
        questionTextInEnglish: map['questionTextInEnglish'] as String,
        answerTextInEnglish: map['answerTextInEnglish'] as String,
        order: map['order'] as int,
        id: map["id"] as String,
        questionTextInArabic: map['questionTextInArabic'] as String,
        answerTextInArabic: map['answerTextInArabic'] as String);
  }

  String toJson() => json.encode(toMap());

  factory FAQ.fromJson(String source) =>
      FAQ.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FAQ(questionTextInEnglish: $questionTextInEnglish, answerTextInEnglish: $answerTextInEnglish, order: $order)';

  @override
  bool operator ==(covariant FAQ other) {
    if (identical(this, other)) return true;

    return other.questionTextInEnglish == questionTextInEnglish &&
        other.answerTextInEnglish == answerTextInEnglish &&
        other.order == order;
  }

  @override
  int get hashCode =>
      questionTextInEnglish.hashCode ^
      answerTextInEnglish.hashCode ^
      order.hashCode;
}
