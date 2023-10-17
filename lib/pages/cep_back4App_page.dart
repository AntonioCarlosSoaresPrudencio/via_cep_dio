import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:via_cep/model/cep_back4App_model.dart';

import '../repositories/tarefas_back4app_repository.dart';


class CepBack4App extends StatefulWidget {
  const CepBack4App ({Key? key}) : super(key: key);

  @override
  State<CepBack4App> createState () => _CepBack4App();

}
class _CepBack4App extends State<CepBack4App> {
  CepBack4AppRepository cepBack4AppRepository = CepBack4AppRepository();
  var ceps =  <CEPBack4AppModel>[];
  var _ceps = CEPSBack4AppModel([]);
  TextEditingController _numericController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obterCEPCadastrados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Posts"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Ação a ser executada quando o botão é pressionado.
              print('Botão pressionado');
              _showNumberInputDialog(context);
            },
            child: Text('Consultar CEP'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _ceps.ceps.length,
              itemBuilder: (context, index) {
                final cep = _ceps.ceps[index];
                return InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => CommentPage(postId: cep.id!)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(cep.cep ?? ""),
                      subtitle: Text(cep.logradouro ?? ""),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showNumberInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Um CEP'),
          content: TextField(
            controller: _numericController,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                int? inputCEP = int.tryParse(_numericController.text);
                if (inputCEP != null && inputCEP.toString().length >= 8) {
                  pesquisaCEP(inputCEP.toString());
                  print('CEP digitado: $inputCEP');
                } else {
                  print('CEP inválido');
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void obterCEPCadastrados() async {
    // _ceps = await cepBack4AppRepository.obterCEPS();
    setState(() {});
  }

  void pesquisaCEP(String inputCEP) async {
    var _cep = await cepBack4AppRepository.obterCEP(inputCEP);
    if(_cep.ceps.isEmpty){
      cadastrarCEP(inputCEP);
    }else{
    _ceps.ceps.add(_cep.ceps.first);
    }
    setState(() {});
  }

  void cadastrarCEP(String inputCEP) async {
    CEPBack4AppModel cepParaCadastrar = CEPBack4AppModel("_objectId", inputCEP, "_logradouro", "_bairro", "_complemento", "_uf", "_createdAt", "_updatedAt");
    await cepBack4AppRepository.criar(cepParaCadastrar);
    pesquisaCEP(inputCEP);
    setState(() {});
  }
}