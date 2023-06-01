import 'package:bill_share/models/user/user_info.dart';

class PaymentParticipant {
  final UserInfo info;
  final String participantId;

  PaymentParticipant({
    required this.info,
    required this.participantId,
  });
}
