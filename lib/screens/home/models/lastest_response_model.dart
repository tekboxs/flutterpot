import 'dart:convert';

class LastestResultsModel {
  final String loteria;
  final String nome;
  final int concurso;
  final String data;
  final String local;
  final List dezenas;
  final String acumuladaProxConcurso;
  final String dataProxConcurso;
  final bool acumulou;

  LastestResultsModel({
    required this.acumulou,
    required this.loteria,
    required this.nome,
    required this.concurso,
    required this.data,
    required this.local,
    required this.dezenas,
    required this.acumuladaProxConcurso,
    required this.dataProxConcurso,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loteria': loteria,
      'nome': nome,
      'concurso': concurso,
      'data': data,
      'local': local,
      'dezenas': dezenas,
      'acumuladaProxConcurso': acumuladaProxConcurso,
      'dataProxConcurso': dataProxConcurso,
    };
  }

  factory LastestResultsModel.fromMap(Map<String, dynamic> map) {
    return LastestResultsModel(
      loteria: map['loteria'] as String,
      nome: map['nome'] as String,
      concurso: map['concurso'] as int,
      data: map['data'] as String,
      local: map['local'] as String,
      dezenas: map['dezenas'] as List,
      acumulou: map['acumulou'] as bool,
      acumuladaProxConcurso: map['acumuladaProxConcurso'] as String,
      dataProxConcurso: map['dataProxConcurso'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LastestResultsModel.fromJson(String source) =>
      LastestResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
