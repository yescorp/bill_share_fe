import 'dart:convert';

import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen.dart';
import 'package:bill_share/mobile/pages/create_payment/view/create_payment_screen_params.dart';
import 'package:bill_share/mobile/pages/qr_scanner/view/qr_scanner_state.dart';
import 'package:bill_share/models/payment/parsed_payment.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart';
import 'package:mobile_scanner/src/objects/barcode_capture.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../models/payment/payment_item.dart';

class QrScannerCubit extends BlocBase<QrScannerState> {
  final NavigationProvider navigationProvider;
  bool isReceiptHandled = false;

  QrScannerCubit(
    super.state, {
    required this.navigationProvider,
  });

  void onBackButtonPressed() {
    navigationProvider.pop();
  }

  void onModeChange() {}

  onFlashToggle(bool value) {}

  Future<void> onDetected(BarcodeCapture barcodes) async {
    final receiptWebPage = barcodes.barcodes.first.displayValue;
    if (receiptWebPage == null) {
      return;
    }

    final uri = Uri.parse(receiptWebPage);
    print('Query Params: ${uri.queryParameters.keys}');

    if (!uri.host.contains('consumer.oofd.kz')) {
      return;
    }

    isReceiptHandled = true;

    try {
      final request1 = Request('GET', uri)..followRedirects = false;
      final result1 = await request1.send();
      final location1 = result1.headers['location'];
      if (location1 == null) {
        return;
      }

      final request2 = Request('GET', Uri.parse(location1))
        ..followRedirects = false;
      final result2 = await request2.send();
      final body = await result2.stream.bytesToString();
      final location2 = result2.headers['location'];
      if (location2 == null) {
        return;
      }

      final request3 = Request(
        'GET',
        Uri.parse(
          'https://consumer.oofd.kz/api/tickets$location2',
        ),
      );
      final result3 = await request3.send();
      final ticket = await result3.stream.bytesToString();
      final json = jsonDecode(ticket);
      print(json);

      final items = <PaymentItem>[];

      for (final item in json['ticket']['items']) {
        final temp = item['commodity'];
        final quantity = temp['quantity'];
        final price = quantity is double ? temp['sum'] : temp['price'];
        final finalQuantity = quantity is double ? 1 : quantity;

        final name = temp['name'] as String? ?? '';

        items.add(
          PaymentItem(
            id: '',
            name: name,
            quantity: finalQuantity,
            price: price is double
                ? price
                : price is int
                    ? price.toDouble()
                    : 0,
          ),
        );
      }

      var taxes = false;

      if (json['taxes'] is List && json['taxes'].isNotEmpty) {
        taxes = true;
      }

      final params = CreatePaymentParams(
        initialPaymentInfo: ParsedPayment(
          sellerName: json['orgTitle'],
          items: items,
          taxes: taxes,
        ),
      );

      await navigationProvider.replaceCurrent<CreatePaymentScreen>(
          params: params);
    } on Exception catch (e, _) {
      print(e);
      isReceiptHandled = false;
    }
  }
}
