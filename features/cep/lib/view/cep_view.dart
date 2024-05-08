import 'package:cep/repository/adapter/cep_adapter.dart';
import 'package:cep/viewmodel/cep_viewmodel.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'cep_state.dart';

class CepView extends StatefulWidget {
  final CepViewModel cepViewModel;

  const CepView({super.key, required this.cepViewModel});

  @override
  State<CepView> createState() => _CepViewState();
}

class _CepViewState extends State<CepView> {
  final textEditingController = TextEditingController(text: '01001000');

  @override
  void initState() {
    super.initState();

    widget.cepViewModel.addListener(() {
      if (widget.cepViewModel.value is SucessCepState) {
        final result = widget.cepViewModel.value as SucessCepState;

        final args = CepAdapter.toMap(result.cep);

        context.go(
          '/details',
          extra: args,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        widget.cepViewModel.getCep(cep: textEditingController.text);
      }),
      body: Column(
        children: [
          TextFormField(
            controller: textEditingController,
          ),
          ValueListenableBuilder(
              valueListenable: widget.cepViewModel,
              builder: (context, state, chil) {
                if (state is LoadingCepState) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Container();
              }),
        ],
      ),
    );
  }
}
