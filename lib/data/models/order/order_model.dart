class OrderModel {
  final int count;
  final int totalPrice;
  final String orderId;
  final String productId;
  final String userId;
  final String orderStatus;
  final String createdAt;
  final String productName;

  OrderModel({
    required this.count,
    required this.totalPrice,
    required this.orderId,
    required this.productId,
    required this.userId,
    required this.orderStatus,
    required this.createdAt,
    required this.productName,
  });
}
