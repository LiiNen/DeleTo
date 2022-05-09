import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/component/default_text_field.dart';
import 'package:delito/function.dart';
import 'package:delito/main_nav/search/kpostal_key.dart';
import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'package:delito/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchAddressSelectionView extends StatefulWidget {
  final dynamic completeCallback;
  SearchAddressSelectionView({this.completeCallback});
  
  @override
  State<SearchAddressSelectionView> createState() => _SearchAddressSelectionView();
}
class _SearchAddressSelectionView extends State<SearchAddressSelectionView> {
  TextEditingController controller = TextEditingController();
  bool _enabled = false;
  bool _warning = false;
  String? _address;
  var long = 0.0;
  var lat = 0.0;

  @override
  void initState() {
    super.initState();
    _getAddress();
  }

  _getAddress() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _address = pref.getString('address') ?? '';
      _enabled = _address != '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: DefaultAppBar(title: '주소 설정하기', back: true),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('gps'),
                addressTypeSelectionBox(),
                DefaultTextField(controller: controller, enabled: _enabled, hint: '주소', focusNode: FocusNode(),),
                warningBox(),
                DefaultButton(title: '저장하기', callback: () {
                  _saveAction();
                  Navigator.pop(context);
                  widget.completeCallback();
                }),
                Text('lat: ${lat}'),
                Text('long: ${long}'),
              ]
            )
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
        Expanded(child: DefaultButton(title: 'gps 이용', callback: () {

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
      });
      return;
    }
    else {
      setState(() {
        long = result.longitude!;
        lat = result.latitude!;
        _warning = false;
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

  warningBox() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 24,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: _warning ? Text('주소의 위치가 모호합니다. gps를 이용해주세요.', style: textStyle(color: Colors.red, weight: 600, size: 12.0)) : Container()
    );
  }

  _saveAction() {

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