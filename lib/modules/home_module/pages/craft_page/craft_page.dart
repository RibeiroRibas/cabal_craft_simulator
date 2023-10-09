import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/craft_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/craft_page/craft_item_section.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/craft_page/name_and_value_section.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/craft_page/name_qtd_and_value_item.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:cabal_craft_simulator/shared/ui/modal_item_add.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CraftPage extends StatefulWidget {
  final Craft craft;

  const CraftPage({Key? key, required this.craft}) : super(key: key);

  @override
  State<CraftPage> createState() => _CraftPageState();
}

class _CraftPageState extends State<CraftPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final TextEditingController _textController;
  late final CraftController controller;
  final int qtdCraft = 0;

  @override
  void initState() {
    _textController = TextEditingController(text: qtdCraft.toString());
    controller = Modular.get<CraftController>();
    controller.resetObservables();
    super.initState();
  }

  void changeValueQtdCraft(String value) {
    controller.changeValueQtdCraft(int.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    return AppLayoutBase(
      isShowFabButton: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CraftItemSection(craft: widget.craft),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWithBorderComponent(
                text: craftSimulate,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(enterTheNumberOfAttempts),
                const SizedBox(width: 10),
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: TextFormField(
                      controller: _textController,
                      textAlign: TextAlign.center,
                      onTap: () => _textController.clear(),
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: greenTheme.primaryColor)),
                      ),
                      validator: (String? value) => value == null ||
                              value.isEmpty ||
                              value.contains(".") ||
                              value.contains(",") ||
                              value.contains("-")
                          ? justNumbers
                          : null,
                      onChanged: (String value) {
                        if (_formKey.currentState!.validate()) {
                          changeValueQtdCraft(value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: ThemeColors.division),
            Row(children: [
              const Text(enterTheCreatedNumbers),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 35,
                height: 35,
                child: FloatingActionButton(
                  child: const Text("+", style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    return showBarModalBottomSheet(
                        backgroundColor: greenTheme.scaffoldBackgroundColor,
                        context: context,
                        builder: (context) => ModalItemAdd(
                              results: widget.craft.results,
                              selectedResult: (result) =>
                                  controller.addCraftResult(result),
                            ));
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
              const Text("TOTAL \$"),
            ]),
            const Divider(color: ThemeColors.division),
            Observer(builder: (context) {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NameQtdAndValueItem(
                    item: controller.craftResult.elementAt(index).keys.first,
                    qtd: controller.craftResult.elementAt(index).values.first,
                  );
                },
                itemCount: controller.craftResult.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: ThemeColors.division);
                },
              );
            }),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => controller.craftCalculate(widget.craft,
                      controller.craftResult, controller.qtdCraft),
                  child: const Text(calculateProfitAndLoss),
                ),
                const Expanded(child: SizedBox()),
                OutlinedButton(
                  onPressed: () {
                    _textController.clear();
                    _textController.text = "0";
                    controller.resetObservables();
                  },
                  child: const Text(reset),
                )
              ],
            ),
            const SizedBox(height: 10),
            Observer(builder: (context) {
              return NameAndValueSection(
                craftCalculator: controller.craftCalculator,
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
