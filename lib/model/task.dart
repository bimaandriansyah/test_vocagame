class Task {
  Task({
    this.id,
    this.title,
    this.date,
    this.times,
    this.type,
  });

  String? id;
  String? title;
  String? date;
  String? times;
  String? type;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        times: json["times"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": date,
        "times": times,
        "type": type,
      };
}
