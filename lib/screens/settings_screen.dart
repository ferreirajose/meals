import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChange,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subTitle),
        value: value,
        onChanged: (value) {
          onChange(value);
          widget.onSettingsChanged(this.settings);
        });
  }

  /**
   * @TODO refatora método para modificar o estado do filtro selecionado de acordo com filtro informado.
   */
  _switchSettings(value) {
    setState(() {
      settings.isGlutenFree = value;
      settings.isLactoseFree = value;
      settings.isVegan = value;
      settings.isVegetarian = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // se estiver trabalhando com multiplas em algumas cenarios sera necessario ter um Scaffold para cada tela
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem glúten!',
                    settings.isGlutenFree,
                    (value) {
                      setState(() {
                        settings.isGlutenFree = value;
                      });
                    },
                  ),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    settings.isLactoseFree,
                    (value) {
                      setState(() {
                        settings.isLactoseFree = value;
                      });
                    },
                  ),
                  _createSwitch(
                    'Vegana',
                    'Só exibe refeições Vegana',
                    settings.isVegan,
                    (value) {
                      setState(() {
                        settings.isVegan = value;
                      });
                    },
                  ),
                  _createSwitch(
                    'Vegetaria',
                    'Só exibe refeições Vegetaria',
                    settings.isVegetarian,
                    (value) {
                      setState(() {
                        settings.isVegetarian = value;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
