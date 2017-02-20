// Copyright (c) 2017, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'lib/mud.dart';

int x = 0, y = 0;

void main() {
  querySelector('#output').text = 'Please enter account:';
  querySelector("#enter").onClick.listen(clickedOnEnter);
}

Environment environment = new Environment("wood");
String account = 'yubao';
String password = '1+1=?';
String hints = '1+1=?';
bool accountPassed = false;
bool passwordPassed = false;
int hintsHitLeft = 5;
clickedOnEnter(e) {
  InputElement input = querySelector("#commands");
  input.style.borderColor = "#55FF55";
  String output = "";
  if (!accountPassed) {
    if (input.value != account) {
      output += "Invalid account. Please reenter: ";
      var outputHtml = "<div>${output}</div>";
      querySelector('#output').appendHtml(outputHtml);
      return;
    }
    accountPassed = true;
    output += "Correct! Please enter the password:";
    var outputHtml = "<div>${output}</div>";
    querySelector('#output').appendHtml(outputHtml);
    return;
  }
  if (!passwordPassed) {
    if (input.value != password) {
      output += "Incorrect password. Please reenter: ";
      if (--hintsHitLeft == 0) {
        output += " (hint: ${hints})";
      }
      var outputHtml = "<div>${output}</div>";
      querySelector('#output').appendHtml(outputHtml);
      return;
    }
    passwordPassed = true;
    output += "Login successfully. Love u yubao!";
    var outputHtml = "<div>${output}</div>";
    querySelector('#output').appendHtml(outputHtml);
    outputHtml = "<div>Welcome to the game!</div>";
    querySelector('#output').appendHtml(outputHtml);
    return;
  }

  switch (input.value) {
    case "left":
      output = "You are going left now.";
      break;
    case "right":
      output = "You are going right now.";
      break;
    case "up":
      output = "You are going up now.";
      break;
    case "down":
      output = "You are going down now.";
      break;
    default:
      output = "Please enter one of up, down, left, and right.";
      var outputHtml = "<div>${output}</div>";
      querySelector('#output').appendHtml(outputHtml);
      return;
  }
  var outputHtml = "<div>${output}</div>";
  querySelector('#output').appendHtml(outputHtml);

  var interaction = environment.stumbleUpon();
  outputHtml = "<div>${interaction}</div>";
  querySelector('#output').appendHtml(outputHtml);
}

updateCoordinates(int rel_x, int rel_y) {
  x += rel_x;
  y += rel_y;
  querySelector("#coordinates").innerHtml = "place : $x, $y";
}
