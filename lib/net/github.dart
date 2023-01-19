import 'package:http/http.dart';

class Github {
  static const api = 'https://api.github.com';
  static const v3ApiMineType = 'application/vnd.github.v3 + json';

  final String token;
  final Client client = Client();

  Github(this.token);

  Future<Response> request(String method,String path,{
    Map<String,dynamic>? params,
    dynamic body,
  })async{
    var headers = {
      'authorization':'token $token'
    };

    var queryString = '';

    if(params != null){
      queryString = _buildQueryString(params);
    }

    final url = Github.api + path + queryString;
    print('request::: $url');
    final request = Request(method, Uri.parse(url));
    request.headers.addAll(headers);
    if(body!=null){
      if(body is List<int>){
        request.bodyBytes = body;
      }else{
       request.body = body.toString();
      }
    }

    final streamResponse = await client.send(request);
    return await Response.fromStream(streamResponse);
  }

  String _buildQueryString(Map<String, dynamic> params) {
    final queryString = StringBuffer();

    if(params.isNotEmpty && !params.values.every((element) => element == null)){
      queryString.write('?');
    }
    var i = 0;
    for(final key in params.keys){
      i++;
      if(params[key] == null){
        continue;
      }
      queryString.write(
        '$key=${Uri.encodeComponent(params[key].toString())}'
      );
      if(i != params.keys.length){
        queryString.write('&');
      }
    }
    return queryString.toString();
  }

  void dispose(){
    client.close();
  }
}
