import 'package:delito/component/default_app_bar.dart';
import 'package:delito/component/default_button.dart';
import 'package:delito/object/store.dart';
import 'package:delito/store/store_item_container.dart';
import 'package:flutter/material.dart';

class GatherView extends StatefulWidget {
  final dynamic mainCallback;
  GatherView({required this.mainCallback});
  @override
  State<GatherView> createState() => _GatherView();
}
class _GatherView extends State<GatherView> {

  bool isLoaded = false;
  bool hasParty = false;

  @override
  void initState() {
    super.initState();

    // todo: load data with api
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: '내 모집 현황'),
      backgroundColor: Colors.white,
      body: isLoaded ? (
        hasParty ? SingleChildScrollView(
          child: Column(
            children: List.generate(testStoreList.length*10, (index) {
              return StoreItemContainer(store: testStoreList[index%5],);
            })
          )
        ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('참여 중인 파티가 없습니다.'),
              SizedBox(height: 14),
              DefaultButton(title: '찾으러 가기', callback: widget.mainCallback)
            ]
          )
        )
      ) : Center(
       child: CircularProgressIndicator()
      )
    );
  }
}