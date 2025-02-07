// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FAQ {
  final String id;
  final String questionText;
  final String answerText;
  final int order;
  FAQ({
    required this.id,
    required this.questionText,
    required this.answerText,
    required this.order,
  });

  FAQ copyWith({
    String? id,
    String? questionText,
    String? answerText,
    int? order,
  }) {
    return FAQ(
      id: id ?? this.id,
      questionText: questionText ?? this.questionText,
      answerText: answerText ?? this.answerText,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questionText': questionText,
      'answerText': answerText,
      'order': order,
      "id": id
    };
  }

  factory FAQ.fromMap(Map<String, dynamic> map) {
    return FAQ(
        questionText: map['questionText'] as String,
        answerText: map['answerText'] as String,
        order: map['order'] as int,
        id: map["id"] as String);
  }

  String toJson() => json.encode(toMap());

  factory FAQ.fromJson(String source) =>
      FAQ.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FAQ(questionText: $questionText, answerText: $answerText, order: $order)';

  @override
  bool operator ==(covariant FAQ other) {
    if (identical(this, other)) return true;

    return other.questionText == questionText &&
        other.answerText == answerText &&
        other.order == order;
  }

  @override
  int get hashCode =>
      questionText.hashCode ^ answerText.hashCode ^ order.hashCode;
}
