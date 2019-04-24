import 'package:secozy/resources/colors.dart';
import 'package:secozy/resources/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ProgressIndicatorBuilder{
  static Widget getCenterCircularProgressIndicator(){
    return Center(child: CircularProgressIndicator(key : new Key(StringConstant.CIRCULARPROGRESSINDICATOR),valueColor: const AlwaysStoppedAnimation<Color>(colorAccent),),);
  }
  static Widget getLinearCircularProgressIndicator(){
    return LinearProgressIndicator(valueColor: const AlwaysStoppedAnimation<Color>(colorAccent), backgroundColor: colorAlmostWhite,);
  }

  static Widget loadingWidget(BuildContext context){
    return new Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ProgressIndicatorBuilder
            .getCenterCircularProgressIndicator()
    );
  }
  static Widget shimmerProgressIndicator(){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          width: double.infinity,
//          height: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget shimmerProgressIndicatorCustomWidth(double customWidth){
    return Container(
      width:customWidth,
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          width: customWidth,
          height: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }
}