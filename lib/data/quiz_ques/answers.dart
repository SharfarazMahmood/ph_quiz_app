class Answers {
	String? a;
	String? b;
	String? c;
	String? d;

	Answers({this.a, this.b, this.c, this.d});

	@override
	String toString() => 'Answers(a: $a, b: $b, c: $c, d: $d)';

	factory Answers.fromJson(Map<String, dynamic> json) => Answers(
				a: json['A'] as String?,
				b: json['B'] as String?,
				c: json['C'] as String?,
				d: json['D'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'A': a,
				'B': b,
				'C': c,
				'D': d,
			};

	Answers copyWith({
		String? a,
		String? b,
		String? c,
		String? d,
	}) {
		return Answers(
			a: a ?? this.a,
			b: b ?? this.b,
			c: c ?? this.c,
			d: d ?? this.d,
		);
	}
}
