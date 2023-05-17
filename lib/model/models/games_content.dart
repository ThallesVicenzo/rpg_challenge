class GamesContentModel {
  String nome;
  String ano;
  String urlCapa;
  int id;

  GamesContentModel({
    required this.nome,
    required this.ano,
    required this.urlCapa,
    required this.id,
  });

  factory GamesContentModel.fromJson(Map<String, dynamic> json) =>
      GamesContentModel(
        nome: json["nome"].toString(),
        ano: json["ano"].toString(),
        urlCapa: json["urlCapa"].toString(),
        id: json["id"],
      );
}
