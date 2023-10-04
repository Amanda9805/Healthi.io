class TestObject {

  final String msg;

  const TestObject({
    required this.msg,
  });

  factory TestObject.fromJson(Map<String, dynamic>json){
    return TestObject(
        msg: json['msg']
    );
  }
}
