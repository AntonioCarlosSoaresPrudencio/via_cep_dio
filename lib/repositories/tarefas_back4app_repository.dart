import '../model/cep_back4App_model.dart';
import 'back4app_custon_dio.dart';

class CepBack4AppRepository {
  final _custonDio = Back4AppCustonDio();

  CepBack4AppRepository();

  Future<CEPSBack4AppModel> obterCEPS() async {
    var url = "/CEP";
    var result = await _custonDio.dio.get(url);
    return CEPSBack4AppModel.fromJson(result.data);
  }

  Future<CEPSBack4AppModel> obterCEP(String inputCEP) async {

   var url = '''/CEP?where={"cep":"$inputCEP"}''';
    var result = await _custonDio.dio.get(url.toString());
    return CEPSBack4AppModel.fromJson(result.data);
  }

  Future<void> criar(CEPBack4AppModel cepBack4AppModel) async {
    try {
      await _custonDio.dio
          .post("/CEP", data: cepBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizar(CEPBack4AppModel cepBack4AppModel) async {
    try {
      var response = await _custonDio.dio.put(
          "/CEP/${cepBack4AppModel.objectId}",
          data: cepBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      var response = await _custonDio.dio.delete(
        "/CEP/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}
