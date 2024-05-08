import 'package:cep/repository/cep_repository.dart';
import 'package:cep/repository/datasource/cep_datasource.dart';
import 'package:cep/view/cep_view.dart';
import 'package:cep/viewmodel/cep_viewmodel.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CepModule extends StatefulWidget {
  const CepModule({super.key});

  @override
  State<CepModule> createState() => _CepModuleState();
}

class _CepModuleState extends State<CepModule> {
  late CepDatasource cepDatasource;
  late CepRepository cepRepository;
  late CepViewModel cepViewModel;
  late Dio http;

  @override
  void initState() {
    super.initState();

    http = Dio();
    cepDatasource = CepDatasource(http: http);
    cepRepository = CepRepository(datasource: cepDatasource);
    cepViewModel = CepViewModel(repository: cepRepository);
  }

  @override
  Widget build(BuildContext context) {
    return CepView(
      cepViewModel: cepViewModel,
    );
  }
}
