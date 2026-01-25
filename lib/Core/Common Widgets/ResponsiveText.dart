import 'package:flutter/cupertino.dart';
double getResponsiveText(BuildContext context,{required double fontsize}){
  double Scalefactor= getResponsiveText(context, fontsize: fontsize);
  double responsivetext=fontsize*Scalefactor;
  double Lowerlimit=fontsize*0.8;
  double upperlimit=fontsize*1.2;
  return responsivetext.clamp(Lowerlimit, upperlimit);
}