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
  //glacierDio.interceptors.add(LogInterceptor(responseBody: false));

  // First accsee URL, get pd, token, Tt from server
  try {
    Response response = await glacierDio.get('/tcgindex?a=published');
    /*
    print(response.headers['set-cookie']);
    print(response.headers['set-cookie'].runtimeType);
    if (response.headers['set-cookie'] != null) {
      for (var cookieStr in response.headers['set-cookie']) {
        // if cookie name is pd, it should be like this 'pd=4029fa87fda17467; Path=/; HttpOnly'
        if (cookieStr.startsWith('pd=')) {
          // 'pd=' is first 3 chars, so startIndex is 3 to get the value.
          int startIndex = 3;
          int endIndex = cookieStr.indexOf(';');
          String currentPD = cookieStr.substring(startIndex, endIndex);
          print('current pd is:' + currentPD);
        }
      }
    }
*/
    var cookies =
        cj.loadForRequest(Uri.parse(baseUrl + '/tcgindex?a=published'));
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

  print('pd: ' + pd + ', ' + 'token: ' + token + ', ' + 'tt: ' + tt + '\n');

  /*
  var newCookies = [
    Cookie('pd', pd),
    Cookie('token', token),
    Cookie('Tt', tt)
  ];
*/

  var dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 5000, // 5s
  ));


  dio.interceptors.add(InterceptorsWrapper(onRequest: (Options options) async {
    print('-----begin check current pd in server -----');
    dio.interceptors.requestLock.lock();
    // use a new Dio(to avoid dead lock) instance to check server pd.
    var tempDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
    ));
    var tempCookies = [
      Cookie('pd', pd),
      Cookie('token', token),
      Cookie('Tt', tt)
    ];
    var tempCJ = CookieJar();
    tempCJ.saveFromResponse(Uri.parse(baseUrl + '/tcgindex?a=published'), tempCookies);
    tempDio.interceptors.add(CookieManager(tempCJ));
    tempDio.interceptors.add(LogInterceptor(responseBody: false));
    Response res = await tempDio.get("/tcgindex?a=published");


    if (res.headers['set-cookie'] != null) {
      for (var cookieStr in res.headers['set-cookie']) {
        // if cookie name is pd, it should be like this 'pd=4029fa87fda17467; Path=/; HttpOnly'
        if (cookieStr.startsWith('pd=')) {
          // 'pd=' is first 3 chars, so startIndex is 3 to get the value.
          int startIndex = 3;
          int endIndex = cookieStr.indexOf(';');
          String currentPD = cookieStr.substring(startIndex, endIndex);
          print('current pd is:' + currentPD);
          // use current pd replace old pd



          pd = currentPD;
        }
      }
    }

    var newCookies = [
      Cookie('pd', pd),
      Cookie('token', token),
      Cookie('Tt', tt)
    ];
    cj.saveFromResponse(Uri.parse(baseUrl + '/tcgindex?a=published'), newCookies);
    dio.interceptors.requestLock.unlock();
    print('-----complete check current pd in server -----');
    print('\n');
    print('\n');
    return options; //continue
  }));
  //cj.saveFromResponse(Uri.parse(baseUrl + '/tcgindex?a=published'), newCookies);
  dio.interceptors.add(CookieManager(cj));
  dio.interceptors.add(LogInterceptor(responseBody: false));


/*
  var newCookies = [
  Cookie('pd', p),
  Cookie('token', token),
  Cookie('Tt', tt)
  ];
  cj.saveFromResponse(Uri.parse(baseUrl + '/tcgindex?a=published'), newCookies);
  dio.interceptors.add(CookieManager(cj));
  dio.interceptors.add(LogInterceptor(responseBody: false));
*/
  try {

    var res = await dio.get('/scenic?a=defs&name=%E6%99%AF%E5%B1%B1%E5%85%AC%E5%9B%AD');
    // print(newCJ.loadForRequest((Uri.parse(baseUrl + '/tcgindex?a=published'))));

    print('begin to sleep 30s');
    await sleep(Duration(seconds: 30));
    print('sleep 30s complete...');
    res = await dio.get('/scenic?a=defs&name=%E6%99%AF%E5%B1%B1%E5%85%AC%E5%9B%AD');

    print('begin to sleep 100s');
    await sleep(Duration(seconds: 100));
    print('sleep 100s complete...');
    res = await dio.get('/scenic?a=defs&name=%E6%99%AF%E5%B1%B1%E5%85%AC%E5%9B%AD');

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
