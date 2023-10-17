class CEPSBack4AppModel {
  List<CEPBack4AppModel> ceps = [];

  CEPSBack4AppModel(this.ceps);

  CEPSBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <CEPBack4AppModel>[];
      json['results'].forEach((v) {
        ceps.add(CEPBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = ceps.map((v) => v.toJson()).toList();
    return data;
  }
}
class CEPBack4AppModel {
  String? _objectId;
  String? _cep;
  String? _logradouro;
  String? _bairro;
  String? _complemento;
  String? _uf;
  String? _createdAt;
  String? _updatedAt;

  CEPBack4AppModel(this._objectId, this._cep, this._logradouro, this._bairro,
      this._complemento, this._uf, this._createdAt, this._updatedAt);

  CEPBack4AppModel.criar(this._cep, this._logradouro, this._bairro, this._complemento, this._uf);

  String? get objectId => _objectId;
  String? get cep => _cep;
  String? get logradouro => _logradouro;
  String? get bairro => _bairro;
  String? get complemento => _complemento;
  String? get uf => _uf;

  CEPBack4AppModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _bairro = json['bairro'];
    _complemento = json['complemento'];
    _uf = json['uf'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['bairro'] = _bairro;
    data['complemento'] = _complemento;
    data['uf'] = _uf;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['bairro'] = _bairro;
    data['complemento'] = _complemento;
    data['uf'] = _uf;
    return data;
  }
}