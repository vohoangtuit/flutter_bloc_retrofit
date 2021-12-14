
import 'package:flutter/material.dart';
import 'package:flutter_bloc_retrofit/helpers/email_validate.dart';

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    contentPadding: EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 12),
    // padding
    isDense: true,
    // padding
    hintStyle: TextStyle(color: Colors.blue, fontSize: 13),
  );
}

TextFormField baseInput(String hintText, TextEditingController textController,
    int length, String error) {
  return TextFormField(
    decoration: inputDecoration(hintText),
    controller: textController,
    keyboardType: TextInputType.text,
    style: TextStyle(color: Colors.blue, fontSize: 15),
    validator: (val) {
      return val!.length >= length ? null : error;
    },
  );
}

TextFormField baseInputNotValidator(
    String hintText, TextEditingController textController) {
  return TextFormField(
    decoration: inputDecoration(hintText),
    controller: textController,
    keyboardType: TextInputType.text,
    style: TextStyle(color: Colors.blue, fontSize: 15),
  );
}

TextFormField emailInput(
    TextEditingController textController) {
  return TextFormField(
    decoration: inputDecoration('Email'),
    controller: textController,
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(color: Colors.blue, fontSize: 15),
    validator: (val) {
      return EmailValidator.regex.hasMatch(val!) ? null : 'Email không hợp lệ';
    },
  );
}
TextFormField usernameInput(
    TextEditingController textController) {
  return TextFormField(
    decoration: inputDecoration(''),
    controller: textController,
    keyboardType: TextInputType.emailAddress,
    style: TextStyle(color: Colors.blue, fontSize: 15),
    validator: (val) {
      return val!.length >= 1 ? null: 'vui lòng nhập username';
    },
  );
}

TextFormField phoneInput(TextEditingController textController) {
  return TextFormField(
    decoration: inputDecoration(''),
    controller: textController,
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.blue, fontSize: 15),
    validator: (val) {
      return val!.length >= 10 ? null : 'Số điện thoại không hợp lệ';
    },
  );
}

TextFormField passwordInput(
    String hintText, TextEditingController textController) {
  return TextFormField(
    decoration: inputDecoration(hintText),
    controller: textController,
    obscureText: true,
    keyboardType: TextInputType.text,
    style: TextStyle(color: Colors.blue, fontSize: 15),
    validator: (val) {
      return val!.length >= 1 ? null : 'Vui lòng nhập mật khẩu';
    },
  );
}

TextFormField commentInput(
    String hintText, TextEditingController textController) {
  return TextFormField(
    decoration: inputDecoration(hintText),
    controller: textController,
    keyboardType: TextInputType.multiline,
    minLines: 3,
    maxLines: 5,
    style: TextStyle(color: Colors.blue, fontSize: 15),
    validator: (val) {
      return val!.length >= 1 ? null : 'Vui lòng nhập nội dung';
    },
  );
}

Container customTextFormFieldBorder(
  TextEditingController textController,
  TextInputType inputType,
  String hintText,
  bool isPass,
) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      obscureText: isPass,
      controller: textController,
      keyboardType: inputType,
      decoration: inputDecoration(hintText),
      style: TextStyle(color: Colors.blue, fontSize: 15),
    ),
  );
}

Container baseInputBGWhite(String hintText,
    TextEditingController textController, int length, String error) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      decoration: inputDecoration(hintText),
      controller: textController,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.blue, fontSize: 15),
      validator: (val) {
        return val!.length >= length ? null : error;
      },
    ),
  );
}
Container emailInputBGWhite(String hintText,
    TextEditingController textController) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      decoration: inputDecoration(hintText),
      controller: textController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.blue, fontSize: 15),
      validator: (val) {
        return EmailValidator.regex.hasMatch(val!) ? null : 'Email không hợp lệ';
      },
    ),
  );
}
Container phoneInputBGWhite(TextEditingController textController) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      decoration: inputDecoration(''),
      controller: textController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.blue, fontSize: 15),
      validator: (val) {
        return val!.length >= 10 ? null : 'Số điện thoại không hợp lệ';
      },
    ),
  );
}
Container passwordInputBGWhite(String hintText,
    TextEditingController textController) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      decoration: inputDecoration(hintText),
      obscureText: true,
      controller: textController,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.blue, fontSize: 15),
      validator: (val) {
        return val!.length >= 1 ? null : 'Vui lòng nhập mật khẩu';
      },
    ),
  );
}
Container commentInputBGWhite(String hintText,
    TextEditingController textController) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      decoration: inputDecoration(hintText),
      controller: textController,
      keyboardType: TextInputType.multiline,
      minLines: 3,
      maxLines: 5,
      style: TextStyle(color: Colors.blue, fontSize: 15),
      validator: (val) {
        return val!.length >= 1 ? null : 'Vui lòng nhập nội dung';
      },
    ),
  );
}
Container baseInputBGWhiteNotValidator(String hintText,
    TextEditingController textController,TextInputType inputType) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: TextFormField(
      decoration: inputDecoration(hintText),
      controller: textController,
      keyboardType: inputType,
      style: TextStyle(color: Colors.blue, fontSize: 15),
    ),
  );
}
