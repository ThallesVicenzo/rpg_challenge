import 'dart:convert';

class GamesDetailsModel {
  String nome;
  String descricao;
  int minimoJogadores;
  int maximoJogadores;
  dynamic duracaoMedia;
  int ano;
  String urlCapa;
  bool expansao;
  List<Caracteristica> caracteristicas;

  GamesDetailsModel({
    required this.nome,
    required this.descricao,
    required this.minimoJogadores,
    required this.maximoJogadores,
    required this.caracteristicas,
    this.duracaoMedia,
    required this.ano,
    required this.urlCapa,
    required this.expansao,
  });

  factory GamesDetailsModel.fromRawJson(String str) =>
      GamesDetailsModel.fromJson(json.decode(str));

  factory GamesDetailsModel.fromJson(Map<String, dynamic> json) =>
      GamesDetailsModel(
        nome: json["nome"],
        descricao: json["descricao"],
        minimoJogadores: json["minimoJogadores"],
        maximoJogadores: json["maximoJogadores"],
        duracaoMedia: json["duracaoMedia"],
        ano: json["ano"],
        urlCapa: json["urlCapa"],
        expansao: json["expansao"],
        caracteristicas: List<Caracteristica>.from(json["caracteristicas"].map(
          (x) => Caracteristica.fromJson(x),
        )),
      );
}

class Caracteristica {
  String descricao;

  Caracteristica({
    required this.descricao,
  });

  factory Caracteristica.fromRawJson(String str) =>
      Caracteristica.fromJson(json.decode(str));

  factory Caracteristica.fromJson(Map<String, dynamic> json) => Caracteristica(
        descricao: json["descricao"],
      );
}
