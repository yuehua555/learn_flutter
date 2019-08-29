import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';

// 如果在公司有代理去访问，有问题！
// DioError [DioErrorType.DEFAULT]: SocketException: OS Error: Operation timed out, errno = 60, address = test001.btylx.com, port = 56668
void main() async {

  String baseUrl = 'https://glacier.btylx.com:6687';
  String pd = '';
  String token = '';
  String tt = '';
  //List<Cookie> cookies = null;

  var glacierDio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000, // 5s
  ));
  // add cookie manager
  var cj = CookieJar();
  glacierDio.interceptors.add(CookieManager(cj));
  glacierDio.interceptors.add(LogInterceptor(responseBody: false));


  try {
    Response response = await glacierDio.get('/tcgindex?a=published')
        .whenComplete(() {
          print('First dio request finish');
        });

    var cookies = cj.loadForRequest(
        Uri.parse(baseUrl + '/tcgindex?a=published'));
    //cookies.forEach((element) => print(element));
    for (var cookie in cookies) {
      //print(cookie.name +":" + cookie.value);
      switch (cookie.name) {
        case 'pd':
          pd = cookie.value;
          break;
        case 'token':
          token = cookie.value;
          break;
        case 'Tt':
          tt = cookie.value;
          break;
      }
    }
    ;
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.request.uri);
      print(e.toString());
    }
  }

  print('pd: ' + pd + ', ' + 'token: ' + token + ', ' + 'tt: ' + tt +'\n');


  var dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000, // 5s
  ));
  // construct cookie and send request
  List<Cookie> newCookies = [
    Cookie('pd', pd),
    Cookie('token', token),
    Cookie('Tt', tt)
  ];
  //dio.options.cookies = newCookies;
  final httpHeaders= {
    'Accept': 'application/json, text/plain, */*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Connection': 'keep-alive',
    'Content-Type': 'application/json',
    'Cookie': 'pd=$pd; token=$token; Tt=$tt',
  };
  var newCJ = CookieJar();
  //newCJ.saveFromResponse((Uri.parse(baseUrl + '/tcgindex?a=published')), newCookies);

  //dio.interceptors.add(CookieManager(newCJ));
  dio.options.headers = httpHeaders;
  //dio.options.method = 'POST';
  dio.interceptors.add(InterceptorsWrapper(
    onResponse: (Response response) {
      print(response.statusCode);
      print(response.headers);
      return response;
    }
  ));
  dio.interceptors.add(LogInterceptor(responseBody: false));
  try {

    //print('Begin to sleep 100s');
   //await sleep(Duration(seconds: 100));
   // print('Sleep finish');

    var res = Response();
    res = await dio.post('/tcgindex?a=published');
   // print(newCJ.loadForRequest((Uri.parse(baseUrl + '/tcgindex?a=published'))));
    /*
    print('begin to sleep...');
    await sleep(Duration(seconds: 60));
    print('sleep complete...');
    */
    //print('1:');
   // print(dio.options.headers.toString());
    //print(res.headers.toString());

    //await sleep(Duration(seconds: 100));
    //res = await dio.get('/tcgindex?a=published');
    //print('2' );
    //print(dio.options.headers.toString());
    //print(res.headers.toString());


    //response = await dio.get('/tcgindex?a=published');
    //print('3' + response.headers.toString());


    //response = await dio.get('/tcgindex?a=published');
    //print('4' + response.headers.toString());

    //response = await dio.get('/tcgindex?a=published');
    //print('5' + response.headers.toString());

  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      print(e.request.uri);
      print(e.toString());
    }
  }
}



