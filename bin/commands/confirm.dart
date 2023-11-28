import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

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
