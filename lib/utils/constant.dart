// import 'package:logger/logger.dart';

const String BASE_URL = "http://fimihub.herokuapp.com/api/";

/*var logger = Logger(
  printer: PrettyPrinter(),
);*/
Map<int,String> orderStatus={
  1:'Failed',
  2:'User Cancelled',
  3:'Pending',
  4:'Restro Cancelled',
  5:'Placed',
  6:'Packed',
  7:'Picked',
  8:'Rider Cancel',
  9:'Received',
  10:'Refunded'

};
Map<int,String> paymentType={
  1:'Stripe',
  2:'Paypal',
  3:'COD'
};
Map<int,String> paymentStatus={
  1:'Pending',
  2:'Success',
  4:'Failed'
};
Map<int,String> statusUpdate={
 2: "Arrived at store " ,
 3: "Order Picked Up  " ,
 4: "On the way       " ,
 5: "Delivered        "
};

class OrderStatus{
  int orderId;
  String value;

  OrderStatus({this.orderId, this.value});
}
var statusList=[
  OrderStatus(orderId: 1, value: "Arriving to store") ,
  OrderStatus(orderId: 2, value: "Arrived at store") ,
  OrderStatus(orderId: 3, value: "Order Picked Up") ,
  OrderStatus(orderId: 4, value: "On the way") ,
  OrderStatus(orderId: 5, value: "Delivered") ,
  // OrderStatus(orderId: 6, value: "Rejected") ,
];

List<String> phraseList = [
  "And", "Ah", "But", "Like", "Repeat", "So", "You know", "Well", "Hmm"
];