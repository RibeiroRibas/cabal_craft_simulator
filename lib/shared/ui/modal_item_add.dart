import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/home_rote_navigator.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModalItemAdd extends StatefulWidget {
  final List<Item> results;
  final Function(Map<Item, int>) selectedResult;

  const ModalItemAdd(
      {Key? key, required this.results, required this.selectedResult})
      : super(key: key);

  @override
  State<ModalItemAdd> createState() => _ModalItemAddState();
}

class _ModalItemAddState extends State<ModalItemAdd> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final TextEditingController _textController;
  late final HomeRouteNavigator navigator;
  String qtd = "1";
  Item? _selectedItem;
  int? _selectedIndex;
  bool isItemNotSelected = false;

  @override
  void initState() {
    _textController = TextEditingController(text: qtd);
    navigator = Modular.get<HomeRouteNavigator>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                selectACreatedItemAndEnterWithAmount,
                textAlign: TextAlign.center,
                style: greenTheme.textTheme.displayMedium,
              ),
              const SizedBox(height: 10),
              isItemNotSelected
                  ? const Text(
                      selectAnItemInTheListAbove,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: ThemeColors.red),
                    )
                  : const SizedBox(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      widget.results.elementAt(index).buildItemName(),
                      style: greenTheme.textTheme.displaySmall,
                    ),
                    tileColor: _selectedIndex != null && _selectedIndex == index
                        ? ThemeColors.gray
                        : null,
                    onTap: () => setState(() {
                      _selectedItem = widget.results.elementAt(index);
                      _selectedIndex = index;
                    }),
                  );
                },
                itemCount: widget.results.length,
              ),
              Row(
                children: [
                  const Text(amount),
                  const SizedBox(width: 10),
                  Form(
                    key: _formKey,
                    child: Expanded(
                      child: TextFormField(
                        controller: _textController,
                        textAlign: TextAlign.center,
                        onTap: () {
                          _textController.clear();
                          qtd = "";
                        },
                        focusNode: _focusNode,
                        onChanged: (text) {
                          if (_formKey.currentState!.validate()) {
                            qtd = text;
                          }
                        },
                        keyboardType: TextInputType.number,
                        validator: (String? value) => value == null ||
                                value.isEmpty ||
                                value.contains(".") ||
                                value.contains(",") ||
                                value.contains("-")
                            ? justNumbers
                            : null,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: greenTheme.primaryColor)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: FloatingActionButton(
                      child: const Text("OK", style: TextStyle(fontSize: 20)),
                      onPressed: () async {
                        if (_selectedItem != null) {
                          if (_formKey.currentState!.validate()) {
                            widget.selectedResult({
                              _selectedItem!: int.parse(qtd),
                            });
                            navigator.pop();
                          }
                        } else {
                          setState(() {
                            isItemNotSelected = true;
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
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
