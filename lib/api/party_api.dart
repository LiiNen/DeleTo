import 'dart:convert';
import 'package:delito/api/api_config.dart';
import 'package:delito/api/user_api.dart';
import 'package:delito/object/party_user.dart';
import 'package:delito/object/user.dart';
import 'package:http/http.dart' as http;

getPartyList({required int boardId}) async {
  var response = await http.get(Uri.parse('$requestUrl$pathParty$pathBoard?post_id=$boardId'));
  print('$requestUrl$pathParty$pathBoard?post_id=$boardId');

  if(response.statusCode == 200) {
    var responseBody = json.decode(response.body);
    if(responseBody.length == 0) {
      return <PartyUser>[];
    }
    else {
      return List.generate(responseBody.length, (index) {
        var _temp = responseBody[index];
        return PartyUser(
          id: _temp['user_id'],
          name: _temp['name'],
          content: _temp['content'],
          isChecked: _temp['is_checked'],
          point: _temp['transaction_point'],
          partyId: _temp['id']
        );
      });
    }
  }
  return null;
}

joinParty({required int boardId, required String content, required String point}) async {
  var requestBody = Map();
  requestBody['user_id'] = userInfo.id.toString();
  requestBody['post_id'] = boardId.toString();
  requestBody['transaction_point'] = point;
  requestBody['content'] = content;

  var requestBodyJson = json.encode(requestBody);
  var response = await http.post(Uri.parse('$requestUrl$pathParty$pathJoin'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );

  return response.statusCode;
}

acceptParty({required int partyId}) async {
  var requestBody = Map();
  requestBody['party_id'] = partyId;
  var requestBodyJson = json.encode(requestBody);
  var response = await http.post(Uri.parse('$requestUrl$pathParty/accept'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );

  if(response.statusCode == 200) {
    return true;
  }
  else {
    return false;
  }
}

rejectParty({required int partyId}) async {
  var requestBody = Map();
  requestBody['party_id'] = partyId;
  var requestBodyJson = json.encode(requestBody);
  var response = await http.delete(Uri.parse('$requestUrl$pathParty/reject'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );

  if(response.statusCode == 200) {
    return true;
  }
  else {
    return false;
  }
}

completeParty({required int boardId}) async {
  var requestBody = Map();
  requestBody['post_id'] = boardId;
  var requestBodyJson = json.encode(requestBody);
  var response = await http.post(Uri.parse('$requestUrl$pathParty/complete'),
    body: requestBodyJson,
    headers: {"Content-Type": "application/json"}
  );

  if(response.statusCode == 200) {
    return true;
  }
  else {
    return false;
  }
}