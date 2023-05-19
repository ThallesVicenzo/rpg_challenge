import 'games_content.dart';

class GamesListModel {
  List<GamesContentModel>? content;

  GamesListModel({
    this.content,
  });

  factory GamesListModel.fromJson(Map<String, dynamic> json) => GamesListModel(
        content: List<GamesContentModel>.from(
            json["content"].map((x) => GamesContentModel.fromJson(x))),
      );
}
