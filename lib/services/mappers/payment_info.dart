import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/models/payment/payment_category.dart';
import 'package:bill_share/models/payment/payment_info.dart';
import 'package:bill_share/models/payment/payment_item.dart';
import 'package:bill_share/models/payment/payment_type.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/models/user/payment_participant.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';

import 'package:collection/collection.dart';

import '../../models/user/user_info.dart';

class PaymentInfoMapper {
  final BillShare client;

  PaymentInfoMapper({
    required this.client,
  });

  Future<PaymentInfo> forAdmin(ExpenseResponse dto) async {
    final currentUser = await client.usersMeGet();
    if (!currentUser.isSuccessful) {
      throw Exception('Current user is not authorized');
    }

    final participants = <PaymentParticipant>[];
    late String currentUserParticipantId;

    for (final participant in dto.participants!) {
      final userInfo = await client.usersUserIdGet(userId: participant.userId);
      currentUserParticipantId = participant.participantId!;

      participants.add(
        PaymentParticipant(
          info: UserInfo(
            userId: userInfo.body!.id!,
            userName: userInfo.body!.name!,
          ),
          participantId: participant.participantId!,
        ),
      );
    }

    final payment = PaymentInfo(
      id: dto.id!,
      name: dto.name!,
      currentUserParticipantInfo: PaymentParticipant(
        info: UserInfo(
          userId: currentUser.body!.id!,
          userName: currentUser.body!.name!,
        ),
        participantId: currentUserParticipantId,
      ),
      type: getPaymentType(dto.expenseType!.id!),
      category: PaymentCategory(
        id: dto.category!.id!,
        name: dto.category!.name!,
      ),
      items: dto.expenseItems!
          .map(
            (e) => PaymentItem(
              id: e.id!,
              name: e.name!,
              quantity: e.count!,
              price: e.amount!.toDouble(),
              selectedBy: e.selectedByParticipants
                      ?.map<PaymentParticipant>(
                        (e) => participants.firstWhere(
                          (element) => element.participantId == e,
                        ),
                      )
                      .toList() ??
                  [],
            ),
          )
          .toList(),
      selectedItemIds: dto.expenseItems!
          .where(
            (element) => element.selectedByParticipants!
                .contains(currentUserParticipantId),
          )
          .map<String>((e) => e.id!)
          .toList(),
      participants: participants,
      creator: FriendInfo(
        userId: dto.creatorId!,
        userName: '',
      ),
      service: (dto.multipliers
              ?.firstWhereOrNull(
                (element) => element.name == 'Service',
              )
              ?.costMultiplierPercent
              ?.toDouble() ??
          0.0),
      taxes: (dto.multipliers
              ?.firstWhereOrNull(
                (element) => element.name == 'Taxes',
              )
              ?.costMultiplierPercent
              ?.toDouble() ??
          0.0),
    );

    return payment;
  }

  Future<PaymentInfo> fromDto(ExpenseResponse dto) async {
    final currentUser = await client.usersMeGet();
    if (!currentUser.isSuccessful) {
      throw Exception('Current user is not authorized');
    }

    final participants = <PaymentParticipant>[];
    late String currentUserParticipantId;

    for (final participant in dto.participants!) {
      final userInfo = await client.usersUserIdGet(userId: participant.userId);
      if (userInfo.isSuccessful &&
          userInfo.body!.id == currentUser.body!.id &&
          userInfo.body!.id != null) {
        currentUserParticipantId = participant.participantId!;
      }
      participants.add(
        PaymentParticipant(
          info: UserInfo(
            userId: userInfo.body!.id!,
            userName: userInfo.body!.name!,
          ),
          participantId: participant.participantId!,
        ),
      );
    }

    final payment = PaymentInfo(
      id: dto.id!,
      name: dto.name!,
      currentUserParticipantInfo: PaymentParticipant(
        info: UserInfo(
          userId: currentUser.body!.id!,
          userName: currentUser.body!.name!,
        ),
        participantId: currentUserParticipantId,
      ),
      type: getPaymentType(dto.expenseType!.id!),
      category: PaymentCategory(
        id: dto.category!.id!,
        name: dto.category!.name!,
      ),
      items: dto.expenseItems!
          .map(
            (e) => PaymentItem(
              id: e.id!,
              name: e.name!,
              quantity: e.count!,
              price: e.amount!.toDouble(),
              selectedBy: e.selectedByParticipants
                      ?.map<PaymentParticipant>(
                        (e) => participants.firstWhere(
                          (element) => element.participantId == e,
                        ),
                      )
                      .toList() ??
                  [],
            ),
          )
          .toList(),
      selectedItemIds: dto.expenseItems!
          .where(
            (element) => element.selectedByParticipants!
                .contains(currentUserParticipantId),
          )
          .map<String>((e) => e.id!)
          .toList(),
      participants: participants,
      creator: FriendInfo(
        userId: dto.creatorId!,
        userName: '',
      ),
      service: (dto.multipliers
              ?.firstWhereOrNull(
                (element) => element.name == 'Service',
              )
              ?.costMultiplierPercent
              ?.toDouble() ??
          0.0),
      taxes: (dto.multipliers
              ?.firstWhereOrNull(
                (element) => element.name == 'Taxes',
              )
              ?.costMultiplierPercent
              ?.toDouble() ??
          0.0),
    );

    return payment;
  }

  PaymentType getPaymentType(ExpenseTypeId type) {
    switch (type) {
      case ExpenseTypeId.necessary:
        return PaymentType.necessary;
      case ExpenseTypeId.selfexpenses:
        return PaymentType.personal;
      case ExpenseTypeId.unexpected:
        return PaymentType.urgent;
      case ExpenseTypeId.swaggerGeneratedUnknown:
        return PaymentType.personal;
    }
  }

  static void register() {
    DependencyProvider.registerLazySingleton<PaymentInfoMapper>(
      () => PaymentInfoMapper(
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }

  Future<PaymentInfo> fetch(String id) async {
    final expense = await client.expensesExpenseIdGet(expenseId: id);
    if (!expense.isSuccessful) {
      throw Exception();
    }

    return fromDto(expense.body!);
  }
}
