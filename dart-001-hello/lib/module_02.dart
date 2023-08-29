String sayHello(String? name, int? age, String? nation) =>
    "안녕 $name, 당신의 나이는 $age 이고, $nation";

String sayHelloNameParams({String? name, int? age, String? nation}) =>
    "안녕 $name, 당신의 나이는 $age 이고, $nation";

/// <Span name ="홍길동", age=33, nation="대한민국"/>
/// const name = ({name, nation age}) => {return <></>}