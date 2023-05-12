// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class TextBoxControl  {
//   double min;
//   double max;
//   double stepAmt = 10;
//   int maxLength;
//   // TextInputControlFormatter textInputFormatter;
//   TextInputFormatter textInputFormatter2;
//   TextCapitalization textCapitalization;
//   bool obscureText = false;
//
//   TextBoxControl subControl;
//
//   TextBoxControl({
//     Key key,
//     String id,
//     String hint,
//     String label,
//     String? value,
//     String? subLabel,
//     BaseControlBloc? currentBloc,
//     List<BaseControlBloc>? relatedBlocs,
//     TextEditingController? controller,
//     ControllerListener? controllerListener,
//     FocusNode? focus,
//     FocusListener? focusListener,
//     IconData? icon,
//     Function? widget,
//     Function? subWidget,
//     TextInputType? inputType,
//     bool enabled = true,
//     Function? validator,
//     TextStyle? labelStyle,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     int? spacerFlex,
//     bool userInteraction = false,
//     this.maxLength,
//     this.min,
//     this.max,
//     this.stepAmt,
//     this.textInputFormatter,
//     this.textInputFormatter2,
//     this.textCapitalization,
//     Widget? prefixIcon,
//     bool? suffixClearText = true,
//     Widget? suffixAddOn,
//     this.obscureText = false,
//     TextAlign textAlign = TextAlign.start,
//     InputBorder? errorBorder,
//     InputBorder? focusedBorder,
//     InputBorder? focusedErrorBorder,
//     InputBorder? disabledBorder,
//     InputBorder? enabledBorder,
//     this.subControl,
//     bool autofocus = false,
//     String valueSuffixTxt = '',
//     bool isMoneyStr = true,
//     String curCode = "MNT",
//     bool isDoubleValue = true,
//     String prefixText = '',
//     bool? readOnly,
//     Function? onTap,
//     bool hasSymbol = false,
//     String? symbol,
//     EdgeInsetsGeometry? margin,
//     Color? fillColor,
//     Color? hoverColor,
//     ValueChanged<String>? onFieldSubmitted,
//     EdgeInsetsGeometry? contentPadding,
//   }) : super(
//     key: key,
//     id: id,
//     value: value,
//     hint: hint,
//     label: label,
//     subLabel: subLabel,
//     currentBloc: currentBloc,
//     relatedBlocs: relatedBlocs,
//     controller: controller,
//     controllerListener: controllerListener,
//     focus: focus,
//     focusListener: focusListener,
//     icon: icon,
//     widget: widget,
//     subWidget: subWidget,
//     enabled: enabled,
//     inputType: inputType,
//     validator: validator,
//     labelStyle: labelStyle,
//     textStyle: textStyle,
//     hintStyle: hintStyle,
//     spacerFlex: spacerFlex,
//     userInteraction: userInteraction,
//     prefixIcon: prefixIcon,
//     suffixClearText: suffixClearText,
//     suffixAddOn: suffixAddOn,
//     textAlign: textAlign,
//     errorBorder: errorBorder,
//     focusedBorder: focusedBorder,
//     focusedErrorBorder: focusedErrorBorder,
//     disabledBorder: disabledBorder,
//     enabledBorder: enabledBorder,
//     autofocus: autofocus,
//     valueSuffixTxt: valueSuffixTxt,
//     isMoneyStr: isMoneyStr,
//     curCode: curCode,
//     isDoubleValue: isDoubleValue,
//     prefixText: prefixText,
//     readOnly: readOnly,
//     onTap: onTap,
//     hasSymbol: hasSymbol,
//     symbol: symbol,
//     margin: margin,
//     fillColor: fillColor,
//     onFieldSubmitted: onFieldSubmitted,
//     contentPadding: contentPadding,
//     hoverColor: hoverColor,
//   ) {
//     super.currentBloc = currentBloc ?? TextBoxBloc();
//   }
//
//   /// зөвхөн Мостын дүн авах дэлгэцдээр ашиглаган
//   factory TextBoxControl.amountMost({
//     Key? key,
//     String? id,
//     String? hint,
//     String? label,
//     String? value,
//     BaseControlBloc? currentBloc,
//     List<BaseControlBloc>? relatedBlocs,
//     TextEditingController? controller,
//     ControllerListener? controllerListener,
//     FocusNode? focus,
//     FocusListener? focusListener,
//     IconData? icon,
//     Function? widget,
//     Function? subWidget,
//     TextInputType? inputType,
//     bool? enabled,
//     Function? validator,
//     TextStyle? labelStyle,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     int? maxLength,
//     double? min,
//     double? max,
//     double? stepAmt,
//     TextInputControlFormatter? textInputFormatter,
//     TextInputFormatter? textInputFormatter2,
//     TextCapitalization? textCapitalization,
//     int? spacerFlex,
//     bool? userInteraction,
//     Widget? prefixIcon,
//     bool? suffixClearText,
//     Widget? suffixAddOn,
//     TextAlign? textAlign,
//     InputBorder? errorBorder,
//     InputBorder? focusedBorder,
//     InputBorder? focusedErrorBorder,
//     InputBorder? disabledBorder,
//     InputBorder? enabledBorder,
//     TextBoxControl? subControl,
//     bool autofocus = false,
//     bool? readOnly,
//     Function? onTap,
//     bool hasSymbol = false,
//     String? symbol,
//     EdgeInsetsGeometry? margin,
//     Color? fillColor,
//     ValueChanged<String>? onFieldSubmitted,
//     EdgeInsetsGeometry? contentPadding,
//     Color? hoverColor,
//   }) {
//     return TextBoxControl(
//       key: key,
//       id: id,
//       value: value,
//       hint: hint ?? '0',
//       label: label,
//       currentBloc: currentBloc,
//       relatedBlocs: relatedBlocs,
//       controller: controller,
//       controllerListener: controllerListener,
//       focus: focus,
//       focusListener: focusListener,
//       //?? amountTextBoxFocus,
//       icon: icon,
//       widget: widget,
//       subWidget: subWidget,
//       enabled: enabled ?? true,
//       inputType: inputType ?? TextInputType.numberWithOptions(signed: false, decimal: true),
//       validator: validator,
//       labelStyle: labelStyle,
//       textStyle: textStyle,
//       hintStyle: hintStyle,
//       spacerFlex: spacerFlex,
//       userInteraction: userInteraction ?? false,
//       maxLength: maxLength ?? 14,
//       min: min,
//       max: max,
//       stepAmt: stepAmt,
//       textInputFormatter: textInputFormatter ??
//           MoneyMaskTextInputFormatter(
//             precision: 0,
//             min: 0,
//             max: 99999999999,
//             initialValue: 0,
//             maxLength: maxLength ?? 14,
//           ),
//       textInputFormatter2: textInputFormatter2,
//       textCapitalization: textCapitalization,
//       prefixIcon: prefixIcon,
//       suffixClearText: suffixClearText,
//       suffixAddOn: suffixAddOn,
//       textAlign: textAlign ?? TextAlign.right,
//       errorBorder: errorBorder,
//       focusedBorder: focusedBorder,
//       focusedErrorBorder: focusedErrorBorder,
//       disabledBorder: disabledBorder,
//       enabledBorder: enabledBorder,
//       subControl: subControl,
//       autofocus: autofocus,
//       readOnly: readOnly,
//       onTap: onTap,
//       hasSymbol: hasSymbol,
//       symbol: symbol,
//       margin: margin,
//       fillColor: fillColor,
//       onFieldSubmitted: onFieldSubmitted,
//       contentPadding: contentPadding,
//       hoverColor: hoverColor,
//     );
//   }
//
//   /// бутархайтай мөнгөн дүн авах
//   factory TextBoxControl.amount({
//     Key? key,
//     String? id,
//     String? hint,
//     String? label,
//     String? value,
//     BaseControlBloc? currentBloc,
//     List<BaseControlBloc>? relatedBlocs,
//     TextEditingController? controller,
//     ControllerListener? controllerListener,
//     FocusNode? focus,
//     FocusListener? focusListener,
//     IconData? icon,
//     Function? widget,
//     Function? subWidget,
//     TextInputType? inputType,
//     bool? enabled,
//     Function? validator,
//     TextStyle? labelStyle,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     int? maxLength,
//     double? min,
//     double? max,
//     double? stepAmt,
//     TextInputControlFormatter? textInputFormatter,
//     TextInputFormatter? textInputFormatter2,
//     TextCapitalization? textCapitalization,
//     int? spacerFlex,
//     bool? userInteraction,
//     Widget? prefixIcon,
//     bool? suffixClearText,
//     Widget? suffixAddOn,
//     TextAlign? textAlign,
//     InputBorder? errorBorder,
//     InputBorder? focusedBorder,
//     InputBorder? focusedErrorBorder,
//     InputBorder? disabledBorder,
//     InputBorder? enabledBorder,
//     TextBoxControl? subControl,
//     bool autofocus = false,
//     bool? readOnly,
//     Function? onTap,
//     bool hasSymbol = false,
//     String? symbol,
//     EdgeInsetsGeometry? margin,
//     Color? fillColor,
//     ValueChanged<String>? onFieldSubmitted,
//     EdgeInsetsGeometry? contentPadding,
//     Color? hoverColor,
//   }) {
//     return TextBoxControl(
//       key: key,
//       id: id,
//       value: value,
//       hint: hint ?? '0.00',
//       label: label,
//       currentBloc: currentBloc,
//       relatedBlocs: relatedBlocs,
//       controller: controller,
//       controllerListener: controllerListener,
//       focus: focus,
//       focusListener: focusListener,
//       //?? amountTextBoxFocus,
//       icon: icon,
//       widget: widget,
//       subWidget: subWidget,
//       enabled: enabled ?? true,
//       inputType: inputType ?? TextInputType.numberWithOptions(signed: false, decimal: true),
//       validator: validator,
//       labelStyle: labelStyle,
//       textStyle: textStyle,
//       hintStyle: hintStyle,
//       spacerFlex: spacerFlex,
//       userInteraction: userInteraction ?? false,
//       maxLength: maxLength ?? 18,
//       min: min,
//       max: max,
//       stepAmt: stepAmt,
//       textInputFormatter: textInputFormatter ??
//           MoneyMaskTextInputFormatter(
//             precision: 2,
//             min: 0,
//             max: 99999999999,
//             initialValue: 0,
//             maxLength: maxLength ?? 18,
//           ),
//       textInputFormatter2: textInputFormatter2,
//       textCapitalization: textCapitalization,
//       prefixIcon: prefixIcon,
//       suffixClearText: suffixClearText,
//       suffixAddOn: suffixAddOn,
//       textAlign: textAlign ?? TextAlign.right,
//       errorBorder: errorBorder,
//       focusedBorder: focusedBorder,
//       focusedErrorBorder: focusedErrorBorder,
//       disabledBorder: disabledBorder,
//       enabledBorder: enabledBorder,
//       subControl: subControl,
//       autofocus: autofocus,
//       readOnly: readOnly,
//       onTap: onTap,
//       hasSymbol: hasSymbol,
//       symbol: symbol,
//       margin: margin,
//       fillColor: fillColor,
//       onFieldSubmitted: onFieldSubmitted,
//       contentPadding: contentPadding,
//       hoverColor: hoverColor,
//     );
//   }
//
//   factory TextBoxControl.amountPrecisionMost({
//     Key? key,
//     String? id,
//     String? hint,
//     String? label,
//     String? value,
//     BaseControlBloc? currentBloc,
//     List<BaseControlBloc>? relatedBlocs,
//     TextEditingController? controller,
//     ControllerListener? controllerListener,
//     FocusNode? focus,
//     FocusListener? focusListener,
//     IconData? icon,
//     Function? widget,
//     Function? subWidget,
//     TextInputType? inputType,
//     bool enabled = true,
//     Function? validator,
//     TextStyle? labelStyle,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     int? maxLength,
//     double? min,
//     double? max,
//     double? stepAmt,
//     TextInputControlFormatter? textInputFormatter,
//     TextInputFormatter? textInputFormatter2,
//     TextCapitalization? textCapitalization,
//     int? spacerFlex,
//     bool? userInteraction,
//     Widget? prefixIcon,
//     bool? suffixClearText,
//     Widget? suffixAddOn,
//     TextAlign? textAlign,
//     InputBorder? errorBorder,
//     InputBorder? focusedBorder,
//     InputBorder? focusedErrorBorder,
//     InputBorder? disabledBorder,
//     InputBorder? enabledBorder,
//     TextBoxControl? subControl,
//     bool autofocus = false,
//     bool? readOnly,
//     Function? onTap,
//     bool hasSymbol = false,
//     String? symbol,
//     EdgeInsetsGeometry? margin,
//     Color? fillColor,
//     ValueChanged<String>? onFieldSubmitted,
//     EdgeInsetsGeometry? contentPadding,
//     Color? hoverColor,
//   }) {
//     return TextBoxControl(
//       key: key,
//       id: id,
//       value: value,
//       hint: hint ?? '00',
//       label: label,
//       currentBloc: currentBloc,
//       relatedBlocs: relatedBlocs,
//       controller: controller,
//       controllerListener: controllerListener,
//       focus: focus,
//       focusListener: focusListener,
//       //?? amountTextBoxFocus,
//       icon: icon,
//       widget: widget,
//       subWidget: subWidget,
//       enabled: enabled,
//       inputType: inputType ?? TextInputType.numberWithOptions(signed: false, decimal: false),
//       validator: validator,
//       labelStyle: labelStyle,
//       textStyle: textStyle,
//       hintStyle: hintStyle,
//       spacerFlex: spacerFlex,
//       userInteraction: userInteraction ?? false,
//       maxLength: maxLength ?? 2,
//       min: min ?? 0,
//       max: max ?? 99,
//       stepAmt: stepAmt,
//       textInputFormatter: textInputFormatter,
//       textInputFormatter2: textInputFormatter2 ?? FilteringTextInputFormatter.digitsOnly,
//       textCapitalization: textCapitalization,
//       prefixIcon: prefixIcon,
//       suffixClearText: suffixClearText,
//       suffixAddOn: suffixAddOn,
//       textAlign: textAlign ?? TextAlign.left,
//       errorBorder: errorBorder,
//       focusedBorder: focusedBorder,
//       focusedErrorBorder: focusedErrorBorder,
//       disabledBorder: disabledBorder,
//       enabledBorder: enabledBorder,
//       subControl: subControl,
//       autofocus: autofocus,
//       readOnly: readOnly,
//       onTap: onTap,
//       hasSymbol: hasSymbol,
//       symbol: symbol,
//       margin: margin,
//       fillColor: fillColor,
//       onFieldSubmitted: onFieldSubmitted,
//       contentPadding: contentPadding,
//       hoverColor: hoverColor,
//     );
//   }
//
//   @override
//   void init() {
//     controller ??= TextEditingController();
//     controller!.text = textInputFormatter?.formatUpdate(value) ?? value ?? '';
//     // log.d('$runtimeType id: $id label: $label value: $value controller.text: ${controller.text}');
//     oldValue = value;
//     controller!.removeListener(() {
//       controllerListener!(this);
//     });
//     controller!.addListener(() {
//       controllerListener!(this);
//     });
//
//     focus ??= FocusNode();
//     focus!.removeListener(() {
//       focusListener!(this);
//     });
//     focus!.addListener(() {
//       focusListener!(this);
//     });
//   }
//
//   @override
//   void refresh() {
//     controller?.text = getText();
//   }
//
//   @override
//   String getText() {
//     return value ?? '';
//   }
//
//   @override
//   String getValue() {
//     return FuncBaseControl.toStr(value);
//   }
//
//   bool valueIsNullOrEmpty() {
//     String val = getValue();
//     if (val == "" || val.length == 0) return true;
//     return false;
//   }
//
//   bool isEmpty() {
//     return valueIsNullOrEmpty();
//   }
//
//   bool isNotEmpty() {
//     String val = getValue();
//     if (val.isNotEmpty) return true;
//     return false;
//   }
//
//   @override
//   void setValue(String val) {
//     value = val;
//     oldValue = val;
//   }
//
//   double getDoubleValue({TextBoxControl? appendValueCtl}) {
//     if (value == null) return 0;
//     if (appendValueCtl == null) {
//       return textInputFormatter?.numberRealValue(FuncBaseControl.toStr(value)) ?? FuncBaseControl.toDouble(value, thousandSeparator: ",");
//     } else {
//       //return textInputFormatter?.numberRealValue('${FuncBaseControl.toStr(value)}.${FuncBaseControl.toInt(appendValueCtl?.value)}') ?? FuncBaseControl.toDouble('$value.${FuncBaseControl.toInt(appendValueCtl.value)}', thousandSeparator: ",");
//       return textInputFormatter?.numberRealValue('${FuncBaseControl.toStr(value)}.${appendValueCtl.value ?? ''}') ??
//           FuncBaseControl.toDouble('$value.${appendValueCtl.value ?? ''}', thousandSeparator: ",");
//     }
//   }
//
//   bool valueIsZero() {
//     double val = getDoubleValue();
//     if (val == 0) return true;
//     return false;
//   }
//
//   double? getDoubleValueOrMinVal() {
//     if (value == null) return min;
//
//     ///v1.0
// //    if(value is String){
// //      return double.tryParse(value.replaceAll(',',''));
// //    }
//
//     return textInputFormatter?.numberRealValue(value) ?? min;
//   }
//
//   double? getDoubleValueInterval() {
//     if (value == null) return min;
//     double v = textInputFormatter?.numberRealValue(value) ?? min!;
//     if (v < min!) {
//       v = min!;
//     }
//     if (v > max!) {
//       v = max!;
//     }
//
//     return v;
//   }
//
//   @override
//   void dispose() {
//     //log.d('$runtimeType !!!!!!!!!!!!!!!!! id: $id, currentBloc: ${currentBloc.state}');
//     super.dispose();
//   }
// }
// //
// //class NumberControl extends BaseControl {
// //  NumberControl({
// //    // CONTROL_FIELD_TYPE fieldType,
// //    MEMBER_ID id,
// //    String hint,
// //    String label,
// //    String value,
// //    BaseControlBloc currentBloc,
// //    List<BaseControlBloc> relatedBlocs,
// //    TextEditingController controller,
// //    FocusNode focus,
// //    IconData icon,
// //  }) : super(
// //            // fieldType: fieldType,
// //            id: id,
// //            value: value,
// //            hint: hint,
// //            label: label,
// //            currentBloc: currentBloc,
// //            relatedBlocs: relatedBlocs,
// //            controller: controller,
// //            focus: focus,
// //            icon: icon);
// //
// //  @override
// //  String getText() {
// //    return value;
// //  }
// //
// //  @override
// //  String getValue() {
// //    return value;
// //  }
// //
// //  @override
// //  void setValue(String val) {
// //    value = val;
// //  }
// //}
// //
// //class AmountControl extends BaseControl {
// //  AmountControl({
// //    // CONTROL_FIELD_TYPE fieldType,
// //    MEMBER_ID id,
// //    String hint,
// //    String label,
// //    String value,
// //    BaseControlBloc currentBloc,
// //    List<BaseControlBloc> relatedBlocs,
// //    TextEditingController controller,
// //    FocusNode focus,
// //    IconData icon,
// //  }) : super(
// //            // fieldType: fieldType,
// //            id: id,
// //            value: value,
// //            hint: hint,
// //            label: label,
// //            currentBloc: currentBloc,
// //            relatedBlocs: relatedBlocs,
// //            controller: controller,
// //            focus: focus,
// //            icon: icon);
// //
// //  @override
// //  String getText() {
// //    return value;
// //  }
// //
// //  @override
// //  String getValue() {
// //    return value;
// //  }
// //
// //  @override
// //  void setValue(String val) {
// //    value = val;
// //  }
// //}
