import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

import 'commands/alert.dart';
import 'commands/confirm.dart';
import 'commands/file.dart';
import 'commands/folder.dart';
import 'commands/options.dart';

Future<void> main(List<String> arguments) async {
  var dialogLauncher = DialogLauncher.byPlatform();

  final runner = CommandRunner('dl', 'Dialog Launcher') //
    ..addCommand(AlertCommand(dialogLauncher))
    ..addCommand(ConfirmCommand(dialogLauncher))
    ..addCommand(OptionsCommand(dialogLauncher))
    ..addCommand(FileCommand(dialogLauncher))
    ..addCommand(FolderCommand(dialogLauncher));

  await runner.run(arguments);
}
