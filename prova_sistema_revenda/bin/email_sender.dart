import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

Future<void> enviarEmail(String conteudoJson) async {
  final smtpServer = gmail('ana.menezes62@aluno.ifce.edu.br', 'yqpl vbsc lrml hdbe');

  final message = Message()
    ..from = Address('ana.menezes62@aluno.ifce.edu.br', 'Ana Beatriz')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'Prova Prática - 01'
    ..text = 'Segue abaixo o JSON do pedido:\n\n$conteudoJson';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com sucesso: $sendReport');
  } on MailerException catch (e) {
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}


