///
//  Generated code. Do not modify.
//  source: data.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class ApmItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ApmItem')
    ..aOS(1, 'platform')
    ..aOS(2, 'sVer')
    ..aOS(3, 'device')
    ..aOS(4, 'version')
    ..aOS(5, 'channel')
    ..aOS(6, 'imei')
    ..aOS(7, 'uid')
    ..aOS(8, 'net')
    ..a<int>(9, 'logType', $pb.PbFieldType.O3)
    ..aOS(10, 'content')
    ..a<NetStat>(11, 'netStat', $pb.PbFieldType.OM, NetStat.getDefault, NetStat.create)
    ..hasRequiredFields = false
  ;

  ApmItem() : super();
  ApmItem.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ApmItem.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ApmItem clone() => new ApmItem()..mergeFromMessage(this);
  ApmItem copyWith(void Function(ApmItem) updates) => super.copyWith((message) => updates(message as ApmItem));
  $pb.BuilderInfo get info_ => _i;
  static ApmItem create() => new ApmItem();
  static $pb.PbList<ApmItem> createRepeated() => new $pb.PbList<ApmItem>();
  static ApmItem getDefault() => _defaultInstance ??= create()..freeze();
  static ApmItem _defaultInstance;
  static void $checkItem(ApmItem v) {
    if (v is! ApmItem) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get platform => $_getS(0, '');
  set platform(String v) { $_setString(0, v); }
  bool hasPlatform() => $_has(0);
  void clearPlatform() => clearField(1);

  String get sVer => $_getS(1, '');
  set sVer(String v) { $_setString(1, v); }
  bool hasSVer() => $_has(1);
  void clearSVer() => clearField(2);

  String get device => $_getS(2, '');
  set device(String v) { $_setString(2, v); }
  bool hasDevice() => $_has(2);
  void clearDevice() => clearField(3);

  String get version => $_getS(3, '');
  set version(String v) { $_setString(3, v); }
  bool hasVersion() => $_has(3);
  void clearVersion() => clearField(4);

  String get channel => $_getS(4, '');
  set channel(String v) { $_setString(4, v); }
  bool hasChannel() => $_has(4);
  void clearChannel() => clearField(5);

  String get imei => $_getS(5, '');
  set imei(String v) { $_setString(5, v); }
  bool hasImei() => $_has(5);
  void clearImei() => clearField(6);

  String get uid => $_getS(6, '');
  set uid(String v) { $_setString(6, v); }
  bool hasUid() => $_has(6);
  void clearUid() => clearField(7);

  String get net => $_getS(7, '');
  set net(String v) { $_setString(7, v); }
  bool hasNet() => $_has(7);
  void clearNet() => clearField(8);

  int get logType => $_get(8, 0);
  set logType(int v) { $_setSignedInt32(8, v); }
  bool hasLogType() => $_has(8);
  void clearLogType() => clearField(9);

  String get content => $_getS(9, '');
  set content(String v) { $_setString(9, v); }
  bool hasContent() => $_has(9);
  void clearContent() => clearField(10);

  NetStat get netStat => $_getN(10);
  set netStat(NetStat v) { setField(11, v); }
  bool hasNetStat() => $_has(10);
  void clearNetStat() => clearField(11);
}

class Package extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Package')
    ..pp<ApmItem>(1, 'data', $pb.PbFieldType.PM, ApmItem.$checkItem, ApmItem.create)
    ..hasRequiredFields = false
  ;

  Package() : super();
  Package.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Package.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Package clone() => new Package()..mergeFromMessage(this);
  Package copyWith(void Function(Package) updates) => super.copyWith((message) => updates(message as Package));
  $pb.BuilderInfo get info_ => _i;
  static Package create() => new Package();
  static $pb.PbList<Package> createRepeated() => new $pb.PbList<Package>();
  static Package getDefault() => _defaultInstance ??= create()..freeze();
  static Package _defaultInstance;
  static void $checkItem(Package v) {
    if (v is! Package) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<ApmItem> get data => $_getList(0);
}

class NetStat extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('NetStat')
    ..aOS(1, 'url')
    ..aInt64(2, 'start')
    ..aInt64(3, 'end')
    ..a<int>(4, 'consume', $pb.PbFieldType.O3)
    ..a<int>(5, 'code', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  NetStat() : super();
  NetStat.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  NetStat.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  NetStat clone() => new NetStat()..mergeFromMessage(this);
  NetStat copyWith(void Function(NetStat) updates) => super.copyWith((message) => updates(message as NetStat));
  $pb.BuilderInfo get info_ => _i;
  static NetStat create() => new NetStat();
  static $pb.PbList<NetStat> createRepeated() => new $pb.PbList<NetStat>();
  static NetStat getDefault() => _defaultInstance ??= create()..freeze();
  static NetStat _defaultInstance;
  static void $checkItem(NetStat v) {
    if (v is! NetStat) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get url => $_getS(0, '');
  set url(String v) { $_setString(0, v); }
  bool hasUrl() => $_has(0);
  void clearUrl() => clearField(1);

  Int64 get start => $_getI64(1);
  set start(Int64 v) { $_setInt64(1, v); }
  bool hasStart() => $_has(1);
  void clearStart() => clearField(2);

  Int64 get end => $_getI64(2);
  set end(Int64 v) { $_setInt64(2, v); }
  bool hasEnd() => $_has(2);
  void clearEnd() => clearField(3);

  int get consume => $_get(3, 0);
  set consume(int v) { $_setSignedInt32(3, v); }
  bool hasConsume() => $_has(3);
  void clearConsume() => clearField(4);

  int get code => $_get(4, 0);
  set code(int v) { $_setSignedInt32(4, v); }
  bool hasCode() => $_has(4);
  void clearCode() => clearField(5);
}

