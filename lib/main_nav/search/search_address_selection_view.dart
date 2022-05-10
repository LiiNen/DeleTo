import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/kpostal_key.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kpostal/kpostal.dart';
import 'package:delito/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchAddressSelectionView extends StatefulWidget {
  final dynamic completeCallback;
  SearchAddressSelectionView({this.completeCallback});
  
  @override
  State<SearchAddressSelectionView> createState() => _SearchAddressSelectionView();
}
class _SearchAddressSelectionView extends State<SearchAddressSelectionView> {
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  bool _enabled = false;
  bool _warning = false;
  String? _address;
  var long = 0.0;
  var lat = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '주소 설정하기', back: true),
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(height: 24),
              addressTypeSelectionBox(),
              SizedBox(height: 16),
              DefaultTextField(controller: controller, enabled: _enabled, hint: '위의 버튼을 통해 주소를 입력해주세요', focusNode: focusNode,),
              warningBox(),
              Expanded(child: Container()),
              Text('아래 저장하기 버튼을 눌러야 정상적으로 반영됩니다.', style: textStyle(color: Color(0xffd1d5d9), weight: 400, size: 12.0)),
              SizedBox(height: 6),
              DefaultButton(title: '저장하기', callback: () {
                _saveAction();
              }),
              SizedBox(height: 20),
            ]
          )
        )
      )
    );
  }

  addressTypeSelectionBox() {
    return Row(
      children: [
        Expanded(child: DefaultButton(title: '주소 검색', callback: () {
          _addressNavigator();
        },)),
        SizedBox(width: 12),
        Expanded(child: DefaultButton(title: 'gps 이용', callback: () {
          _getGps();
        },))
      ]
    );
  }

  _addressNavigator() async {
    await Navigator.push(context, MaterialPageRoute(
      builder: (_) => searchAddressSelectionView(addressReturnCallback),
    ));
  }

  addressReturnCallback(Kpostal result) {
    if(result.latitude == null || result.longitude == null) {
      setState(() {
        long = 0.0;
        lat = 0.0;
        controller.text = '';
        _warning = true;
        _enabled = false;
      });
      return;
    }
    else {
      setState(() {
        long = result.longitude!;
        lat = result.latitude!;
        _warning = false;
        _enabled = true;
      });
    }
    var _result = '';
    var temp = result.address.split(' ');
    if(temp.length > 3) {
      var _length = temp.length;
      _result = '${temp[_length-3]} ${temp[_length-2]} ${temp[_length-1]}';
    }
    else {
      _result = result.address;
    }
    controller.text = _result;
  }

  _getGps() async {
    var permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied) {
      showToast('gps 권한을 확인해주세요.');
      Map<Permission, PermissionStatus> permissions = await [
        Permission.location,
      ].request();
    }
    else {
      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      ).then((Position position) async {
        gpsReturnCallback(position);
      });
    }
  }

  gpsReturnCallback(Position position) {
    setState(() {
      long = position.longitude;
      lat = position.latitude;
      _enabled = true;
      controller.text = 'gps를 이용한 위치 정보';
    });
  }

  warningBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 24,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: _enabled ? Text('위의 입력창에 주소의 별칭을 입력해주세요', style: textStyle(color: Color(0xffff7c2f), weight: 600, size: 12.0)) : (
          _warning ? Text('주소의 위치가 모호합니다. gps를 이용해주세요.', style: textStyle(color: Colors.red, weight: 600, size: 12.0)) : Container())
    );
  }

  _saveAction() async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('address', controller.text);
    pref.setDouble('lat', lat);
    pref.setDouble('long', long);
    Navigator.pop(context);
    widget.completeCallback();
  }
}

searchAddressSelectionView(dynamic callback) {
  return KpostalView(
    useLocalServer: true,
    localPort: 1024,
    kakaoKey: kpostalKey,
    callback: (Kpostal result) {
      callback(result);
    },
  );
}