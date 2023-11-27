import 'package:process_run/cmd_run.dart';

extension CmdLineExtension on String {
  ProcessCmd toCmdLine() {
    var regex = RegExp('(?:[^s"\']+|"[^"]*"|\'[^\']*\')+', multiLine: true);
    final args = regex.allMatches(this).map((m) => m.group(0)!.replaceAll(RegExp(r'^"|"$'), '')).toList();

    return ProcessCmd(
      args[0],
      args.sublist(1),
    );
  }
}
