import 'answers.dart';

class Question {
	String? question;
	Answers? answers;
	dynamic questionImageUrl;
	String? correctAnswer;
	int? score;

	Question({
		this.question, 
		this.answers, 
		this.questionImageUrl, 
		this.correctAnswer, 
		this.score, 
	});

	@override
	String toString() {
		return 'Question(question: $question, answers: $answers, questionImageUrl: $questionImageUrl, correctAnswer: $correctAnswer, score: $score)';
	}

	factory Question.fromJson(Map<String, dynamic> json) => Question(
				question: json['question'] as String?,
				answers: json['answers'] == null
						? null
						: Answers.fromJson(json['answers'] as Map<String, dynamic>),
				questionImageUrl: json['questionImageUrl'] as dynamic,
				correctAnswer: json['correctAnswer'] as String?,
				score: json['score'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'question': question,
				'answers': answers?.toJson(),
				'questionImageUrl': questionImageUrl,
				'correctAnswer': correctAnswer,
				'score': score,
			};

	Question copyWith({
		String? question,
		Answers? answers,
		dynamic questionImageUrl,
		String? correctAnswer,
		int? score,
	}) {
		return Question(
			question: question ?? this.question,
			answers: answers ?? this.answers,
			questionImageUrl: questionImageUrl ?? this.questionImageUrl,
			correctAnswer: correctAnswer ?? this.correctAnswer,
			score: score ?? this.score,
		);
	}
}
