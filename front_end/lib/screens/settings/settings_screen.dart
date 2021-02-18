import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/components/layout/layout.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/screens/settings/settings_viewmodel.dart';
import 'package:redux/redux.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  Widget content(SettingsViewmodel vm) {
    return Layout(
      child: SettingsList(
        backgroundColor: Colors.transparent,
        sections:[
          SettingsSection(
            tiles: [
              SettingsTile.switchTile(title: "Switch theme", onToggle: vm.toggleTheme, switchValue: vm.isLightTheme)
            ]
          ),
          SettingsSection(
            tiles: [
              SettingsTile(
                title: "Log out",
                onPressed: vm.logout,
              )
            ],
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => SettingsViewmodel.fromStore(store),
      builder: (context, vm) => content(vm),
    );
  }
}