import 'package:flutter/material.dart';
import 'package:nac3_info_trip/model/RoboModel.dart';
import 'package:nac3_info_trip/services/RoboService.dart';

class NovoRoboScreen extends StatefulWidget {
  @override
  _NovoRoboScreenState createState() => _NovoRoboScreenState();
}

class _NovoRoboScreenState extends State<NovoRoboScreen> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RoboModel roboModel = new RoboModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 173, 207, 1),
        title: Text("Novo Robo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: <Widget>[
                    // CAMPO PARA O NOME
                    TextFormField(
                      decoration: new InputDecoration(
                        /*icon: const Icon(Icons.notification_important_rounded),*/
                        hintText: 'Digite a identificação do robo',
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite o nome do robo';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        roboModel.nome = value;
                      },
                    ),
                    //CAMPO PARA O TIPO
                    TextFormField(
                      decoration: new InputDecoration(
                        /*icon: const Icon(Icons.electrical_services),*/
                        hintText: 'Digite o tipo do Robo',
                        labelText: 'Tipo',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite o tipo do robo';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        roboModel.tipo = value.toLowerCase();
                      },
                    ),
                    //CAMPO PARA CARACTERISTICAS DO ROBO
                    TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(Icons.text_fields),
                        hintText: 'Digite o Comportamento',
                        labelText: 'Comportamento',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Digite o Comportamento do robo';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        roboModel.comportamento = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        child: Text("Salvar"),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();

                            //Instanciando a service para efetuar a inclusão

                            roboModel.dtCriacao = DateTime.now().toString();
                            roboModel.dtAtualizacao = DateTime.now().toString();
                            new RoboService().create(roboModel);

                            var mensagem =
                                roboModel.nome + ' cadastrado com sucesso!';

                            // Navigator.pop(
                            //   context,
                            //   mensagem,
                            // );

                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Robo salvo com sucesso!'),
                            ));
                          } else {
                            scaffoldKey.currentState.showSnackBar(SnackBar(
                              content:
                                  Text('Não foi possível salvar o novo rovo'),
                            ));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
