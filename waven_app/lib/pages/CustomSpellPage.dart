import 'package:flutter/material.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostCard.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellCostSlider.dart';
import 'package:waven_app/SpellBuilderWidgets/SpellNameCard.dart';
import 'package:waven_app/util/EnsureVisibleWhenFocused.dart';
import 'package:waven_app/util/widget_utils.dart' show screenAwareSize;
import 'package:waven_app/widgets/NumberPicker.dart';

class CustomSpellPage extends StatefulWidget {
  final int initialSpellCost;

  const CustomSpellPage({Key key, this.initialSpellCost}) : super(key: key);

  @override
  _CustomSpellPageState createState() => new _CustomSpellPageState();
}

class _CustomSpellPageState extends State<CustomSpellPage> {
  FocusNode _focusNodeSpellName = new FocusNode();

  int spellCostValue;

  @override
  void initState() {
    super.initState();
    spellCostValue = widget.initialSpellCost ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[buildSpellNameField(), buildSpellCostField()],
        ),
      ),
    );
  }

  Widget buildSpellCostField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,bottom: 16.0),
      child: Row(
        children: <Widget>[
          Text("Spell Cost : "),
          Expanded(

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpellCostBackground(
                child: LayoutBuilder(
                  builder: (context, constraints) => SpellCostSlider(
                        minValue: 0,
                        maxValue: 12,
                        value: spellCostValue,
                        onChanged: (val) => setState(() => spellCostValue = val),
                        width: constraints.maxWidth,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  EnsureVisibleWhenFocused buildSpellNameField() {
    return new EnsureVisibleWhenFocused(
      focusNode: _focusNodeSpellName,
      child: new TextField(
        decoration: const InputDecoration(
          border: const UnderlineInputBorder(),
          filled: true,
          icon: const Icon(Icons.chat),
          hintText: 'Enter Spell Name',
          labelText: 'Nom du sort',
        ),
        onChanged: (String value) {
          print(value);
        },
        focusNode: _focusNodeSpellName,
      ),
    );
  }

  Widget _buildCards(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.0,
        right: 14.0,
        top: screenAwareSize(32.0, context),
      ),
      child: Column(
        children: <Widget>[
          SpellNameField,
          Expanded(child: SpellCostCard()),
        ],
      ),
    );
  }

  final TitlePage = Padding(
    padding: EdgeInsets.only(
      left: 24.0,
      top: 20.0,
    ),
    child: Text(
      "Spell Builder 0.1",
      style: new TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
    ),
  );

  final SpellNameField = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'alucard@gmail.com',
    decoration: InputDecoration(
      hintText: 'Email',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
  );

  Widget _tempCard(String label) {
    return Card(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Text(label),
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return new InkWell(
      onTap: _onTapNext(),
      child: new Container(
          height: screenAwareSize(40.0, context),
          width: screenAwareSize(120.0, context),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
              color: Colors.grey,
              borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
              border: new Border.all(
                color: const Color.fromRGBO(221, 221, 221, 1.0),
                width: 1.0,
              )),
          child: Text(
            "Suivant",
            style: TextStyle(fontSize: 22.0),
          )),
    );
  }

  _onTapNext() {}
}
