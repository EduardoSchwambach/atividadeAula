import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nota1 = TextEditingController();
  TextEditingController nota2 = TextEditingController();
  TextEditingController numeroFaltas = TextEditingController();
  TextEditingController cargaHoraria = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText =
      "Digite as notas o numero de faltas e carga horária da disciplina";

  void _resetField() {
    nota1.text = "";
    nota2.text = "";
    numeroFaltas.text = "";
    cargaHoraria.text = "";
    /*setState(() {
      _infoText = "TESTEEEE2";
    });*/
  }

  void _verificaAprovacao() {
    setState(() {
      double primeiraNota = double.parse(nota1.text);
      double segundaNota = double.parse(nota2.text);
      int faltas = int.parse(numeroFaltas.text);
      int carga = int.parse(cargaHoraria.text);
      double totalAulas = carga / 2;
      double aulasFrequentadas = totalAulas - faltas;
      double media = (primeiraNota + segundaNota) / 2;
      double frequencia = (aulasFrequentadas / totalAulas) * 100;

      if (media >= 6 && frequencia > 75) {
        _infoText =
            "Sua média final é: $media, sua frequencia é: $frequencia% e sua situação é aprovado!";
      } else {
        _infoText =
            "Sua média final é: $media, sua frequencia é: $frequencia% e sua situação é reprovado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lançar Notas"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(onPressed: _resetField, icon: const Icon(Icons.refresh))
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.person_outlined,
                    size: 120.0,
                    color: Colors.green,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Primeira nota",
                          hintText: "Digite a primeira nota",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25)),
                      controller: nota1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite um valor numérico válido";
                        } else if (double.tryParse(value) == null) {
                          return "Digite um valoor numérico válido";
                        }
                        return null;
                      }),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Segunda nota",
                          hintText: "Digite a segunda nota",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25)),
                      controller: nota2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite um valor numérico válido";
                        } else if (double.tryParse(value) == null) {
                          return "Digite um valor numérico válido";
                        }
                        return null;
                      }),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Numero de faltas",
                          hintText: "Digite o numero de faltas",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25)),
                      controller: numeroFaltas,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite um valor numérico válido";
                        } else if (double.tryParse(value) == null) {
                          return "Digite um valor numérico válido";
                        }
                        return null;
                      }),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Carga horária da disciplina",
                          hintText: "Digite a carga horária da disciplina",
                          labelStyle:
                              TextStyle(color: Colors.green, fontSize: 25)),
                      controller: cargaHoraria,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite um valor numérico válido";
                        } else if (double.tryParse(value) == null) {
                          return "Digite um valor numérico válido";
                        }
                        return null;
                      }),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _verificaAprovacao();
                      }
                    },
                    child: const Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.green, fontSize: 25),
                  )
                ],
              )),
        ));
  }
}
