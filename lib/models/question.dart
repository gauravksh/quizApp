class Question {
  int id;
  String q;
  Map<String, bool> op;

  Question({
    required this.id,
    required this.q,
    required this.op,
  });

  @override
  String toString() {
    return "Question(id: $id, q: $q, op: $op)";
  }
}
