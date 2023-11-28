import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

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

class AlertCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "alert";
  @override
  final description = "Alert";

  AlertCommand(this.dialogLauncher) {
    argParser
      ..addOption('title', abbr: 't', help: 'Título do diálogo')
      ..addOption('message', abbr: 'm', help: 'Mensagem do diálogo')
      ..addOption('okButtonText', abbr: 'b', help: 'Texto do botão OK para alertas');
  }

  // [run] may also return a Future.
  @override
  Future<void>? run() async {
    final response = await dialogLauncher.alertDialog(
      argResults?['title'] ?? 'Alert',
      argResults?['message'] ?? '',
      okButtonText: argResults?['okButtonText'] ?? 'OK',
    );
    print(response);
  }
}

class ConfirmCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "confirm";
  @override
  final description = "Confirm Dialog";

  ConfirmCommand(this.dialogLauncher) {
    argParser
      ..addOption('title', abbr: 't', help: 'Título do diálogo')
      ..addOption('message', abbr: 'm', help: 'Mensagem do diálogo')
      ..addOption('yes', abbr: 'y', help: 'Texto para botão SIM em confirmações')
      ..addOption('no', abbr: 'n', help: 'Texto para botão NÃO em confirmações');
  }

  @override
  Future<void>? run() async {
    final response = await dialogLauncher.confirmDialog(
      argResults?['title'] ?? 'Alert',
      argResults?['message'] ?? '',
      yesText: argResults?['yes'] ?? 'Yes',
      noText: argResults?['no'] ?? 'No',
    );
    print(response);
  }
}

class OptionsCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "options";
  @override
  final description = "Options Dialog";

  OptionsCommand(this.dialogLauncher) {
    argParser
      ..addOption('title', abbr: 't', help: 'Título do diálogo')
      ..addOption('message', abbr: 'm', help: 'Mensagem do diálogo')
      ..addMultiOption('item', abbr: 'i', help: 'Opções do diálogo');
  }

  @override
  Future<void>? run() async {
    final response = await dialogLauncher.multiSelectDialog(
      argResults?['title'] ?? 'Alert',
      argResults?['message'] ?? '',
      argResults?['item'] ?? [],
    );
    print(response);
  }
}

class FileCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "file";
  @override
  final description = "Select a file";

  FileCommand(this.dialogLauncher) {
    argParser.addOption('title', abbr: 't', help: 'Título do diálogo');
  }

  @override
  Future<void>? run() async {
    final response = await dialogLauncher.selectFileDialog(
      argResults?['title'] ?? 'Select a file',
    );
    print(response);
  }
}

class FolderCommand extends Command {
  final DialogLauncher dialogLauncher;

  @override
  final name = "folder";
  @override
  final description = "Select a folder";

  FolderCommand(this.dialogLauncher) {
    argParser.addOption('title', abbr: 't', help: 'Título do diálogo');
  }

  @override
  Future<void>? run() async {
    final response = await dialogLauncher.selectFileDialog(
      argResults?['title'] ?? 'Select a folder',
    );
    print(response);
  }
}
