import 'package:args/command_runner.dart';
import 'package:dialog_launcher/dialog_launcher.dart';

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
