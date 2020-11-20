import 'dart:convert';

class RoboModel {
  int id;
  String nome;
  String tipo;
  String status;
  String dtCriacao;
  String dtAtualizacao;
  String imagePath;
  String comportamento;

  RoboModel({
    this.id,
    this.nome = '',
    this.tipo = '',
    this.status = '',
    this.dtCriacao = '',
    this.dtAtualizacao = '',
    this.imagePath = '',
    this.comportamento = '',
  });

  factory RoboModel.fromJson(String str) => RoboModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoboModel.fromMap(Map<String, dynamic> json) => RoboModel(
        id: (json["id"] is int) ? json["id"] : int.parse(json["id"]),
        nome: json["nome"],
        tipo: json["tipo"],
        status: json["status"],
        dtCriacao: json["dt_criacao"],
        dtAtualizacao: json["dt_atualizacao"],
        imagePath: json["imagePath"],
        comportamento: json["comportamento"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "tipo": tipo,
        "status": status,
        "dt_criacao": dtCriacao,
        "dt_atualizacao": dtAtualizacao,
        "imagePath": imagePath,
        "comportamento": comportamento,
      };
}
