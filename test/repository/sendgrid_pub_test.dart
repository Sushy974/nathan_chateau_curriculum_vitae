import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:nathan_chateau_curriculum_vitae/repository/sendgrid_pub.dart';

void main() {
  group('SengridPub', () {
    test('Envoi mail', () async {
      await SendgridPub(
              client: Client(),
              contente: 'a',
              entreprise: 'e',
              nomExpediteur: 'n',
              prenomExpediteur: 'p')
          .sendEmail(email: Email());
    });
  });
}
