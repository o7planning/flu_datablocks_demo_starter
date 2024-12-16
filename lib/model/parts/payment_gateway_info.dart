part of '../model.dart';

@jsonSerializable
class PaymentGatewayInfo {
  @JsonProperty(name: 'id')
  late String id;

  @JsonProperty(name: 'name')
  late String name;

  @JsonProperty(name: 'active')
  late bool active;

  PaymentGatewayInfo({
    required this.id,
    required this.name,
    required this.active,
  });

  PaymentGatewayInfo.empty()
      : id = '',
        name = '',
        active = false;
}
