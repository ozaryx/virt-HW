package main

import (
        "testing"
)

func TestMin(t *testing.T) {
  var x int
  x = min([]int{1,2,3,})
  if x != 1 {
    t.Error("Expected 1, got ", x)
  }
}
