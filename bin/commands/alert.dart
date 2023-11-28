import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

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
