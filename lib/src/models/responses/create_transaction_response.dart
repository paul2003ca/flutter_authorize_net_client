import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/response_messages.dart';
import 'transaction_response.dart';

part 'create_transaction_response.g.dart';

/// A model to represent general structure of the response for [CreateTransactionRequest]
/// request to the api
///
/// [transactionResponse] property of this model contains important data about the
/// requested transaction
///
/// [messages] contains the descriptive information of the request, i.e. info message
/// & result code
@JsonSerializable(explicitToJson: true)
class CreateTransactionResponse {
  @JsonKey(name: 'transactionResponse')
  final TransactionResponse? transactionResponse;
  @JsonKey(name: 'messages')
  final ResponseMessages? messages;

  CreateTransactionResponse(this.transactionResponse, this.messages);

  factory CreateTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionResponseFromJson(json);

  Map<String, dynamic>? toJson() =>
      removeNullsFromMap(_$CreateTransactionResponseToJson(this));

  bool get isSuccessful => verifyTransactionSuccess(this);
}

/*{
    "transactionResponse": {
        "responseCode": "1",
        "authCode": "000000",
        "avsResultCode": "P",
        "cvvResultCode": "",
        "cavvResultCode": "",
        "transId": "0",
        "refTransID": "",
        "transHash": "",
        "testRequest": "1",
        "accountNumber": "XXXX0002",
        "accountType": "AmericanExpress",
        "messages": [
            {
                "code": "1",
                "description": "This transaction has been approved."
            }
        ],
        "transHashSha2": "",
        "SupplementalDataQualificationIndicator": 0
    },
    "messages": {
        "resultCode": "Ok",
        "message": [
            {
                "code": "I00001",
                "text": "Successful."
            }
        ]
    }
}

  */
