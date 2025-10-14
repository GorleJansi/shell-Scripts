#!/bin/bash
# String, integer, boolean -by default every variable is string

str="Hello"
num=10
float=1.5
bool=true
arr=(1 2 "a" "b")
echo "String: $str"
echo "Number: $num"
echo "Boolean: $bool"
echo "Float: $float"
echo "array: ${arr[@]}"
