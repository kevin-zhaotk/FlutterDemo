import 'package:flutter/material.dart';
import 'Builder/ListBuilderItem.dart';
import 'Builder/ListBuilderModel.dart';

class CustomList extends StatefulWidget {

final String json = '{"tips":"短期理财更灵活，每日加息天天发放","description":"预期七日年化收益率6.35%", "titleIcon":"https://jianlc-static.oss-cn-beijing.aliyuncs.com/img/plan/1512541550110.png", "cIcon":"https://jianlc-static.oss-cn-beijing.aliyuncs.com/img/plan/1513253701714.png","subTitle":"短期理财，天天加息"}';
final String jsonRate = '{"tips":"最高加息2%（年化），期限任选","description":"1-12月期任意选，最高加息2%", "cIcon":"https://jianlc-static.oss-cn-beijing.aliyuncs.com/img/plan/8413238473.png", "titleIcon":"https://jianlc-static.oss-cn-beijing.aliyuncs.com/img/plan/1512712737390.png", "subTitle":"1000元起投"}';
final String jsonTen = '{"cIcon":"https://jianlc-static.oss-cn-beijing.aliyuncs.com/img/plan/ico_licai_huojibao@2x.png", "subTitle":"灵活存取，超低投资门槛", "description":"预期七日年化收益率3.00%", "titleIcon":"https://jianlc-static.oss-cn-beijing.aliyuncs.com/img/plan/ico_licai_hjb@2x.png", "tips":"100元起投，随存随取"}';


  List<ListBuilderModel> models = [];
  //CustomList({this.models});
  createState() => new _State();

}

class _State extends State<CustomList> {

  @override
  void initState() {
    append10People();
    super.initState();
  }

  void append10People() {
    widget.models.add(new ListBuilderModel(widget.json));
    widget.models.add(new ListBuilderModel(widget.json));
    widget.models.add(new ListBuilderModel(widget.jsonRate));
    widget.models.add(new ListBuilderModel(widget.jsonTen));
  }
  
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: new ListView.custom(
          childrenDelegate: new CustomSliverChildBuilderDelegate(
            (context, index) {
              print('custom builder index: $index');
              return new ListBuilderItem(model: widget.models.elementAt(index),);
            },
            childCount: widget.models.length,
          ),
        ),
      );
    }
}

class CustomSliverChildBuilderDelegate extends SliverChildBuilderDelegate {

  CustomSliverChildBuilderDelegate( Widget Function(BuildContext, int) builder, {
    int childCount, 
    bool addAutomaticKeepAlives = true, 
    bool addRepaintBoundaries = true}) : super(builder, 
      childCount: childCount,
      addAutomaticKeepAlives:addAutomaticKeepAlives, 
      addRepaintBoundaries:addRepaintBoundaries,);

    @override
      void didFinishLayout(int firstIndex, int lastIndex) {
        print('-->firstIndex: $firstIndex  lastIndex: $lastIndex');        
      }
}