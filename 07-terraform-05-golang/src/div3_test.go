package main

import "testing"

func TestDiv3(t *testing.T) {
  xt := [...]int{3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,63,66,69,72,75,78,81,84,87,90,93,96,99}
  x := [33]int{}
  v := [100]int{}
  x = *(*[33]int)(div3(v))
  if xt != x {
    t.Error("Expected ,", xt, " , got ", x)
  }
}
