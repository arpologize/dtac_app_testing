import 'package:dtac_app_testing/config/themes/themes.dart';
import 'package:dtac_app_testing/view/main_view/components/person_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constant/constants.dart';
import '../../config/themes/custom_colors.dart';
import '../../shared_component/loading.dart';
import 'main_view_model.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.onBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [_buildHeader(), Expanded(child: _buildPersonList())],
          ),
        ));
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kPaddingPage, horizontal: kPaddingPage),
      child: const Text(
        'Persons',
        style: CustomTextStyles.header2,
      ),
    );
  }

  Widget _buildPersonList() {
    final viewModel = ref.watch(mainViewModelProvider);
    return viewModel.when(
      data: (personsData) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: (personsData.results ?? [])
              .asMap()
              .map((index, person) => MapEntry(
                    index,
                    PersonWidget(person: person),
                  ))
              .values
              .toList(),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Loading(),
    );
  }
}
