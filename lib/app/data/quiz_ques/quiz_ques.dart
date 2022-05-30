import 'question.dart';

class QuizQues {
	List<Question>? questions;

	QuizQues({this.questions});

	@override
	String toString() => 'QuizQues(questions: $questions)';

	factory QuizQues.fromJson(Map<String, dynamic> json) => QuizQues(
				questions: (json['questions'] as List<dynamic>?)
						?.map((e) => Question.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'questions': questions?.map((e) => e.toJson()).toList(),
			};

	QuizQues copyWith({
		List<Question>? questions,
	}) {
		return QuizQues(
			questions: questions ?? this.questions,
		);
	}
}
