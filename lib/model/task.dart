import 'package:flutter/material.dart';

class Task{
  String text;
  bool done = false;
  Task(this.text, this.done);

  void click(){
    this.done = !this.done;
  }

  Map<String, dynamic> toJosn(){
    return {
      'text' : this.text,
      'done' : this.done,
    };
  }

}

Task get(record){
  Task result = Task(record['text'], record['done']);
  return result;
}