package main
   
import "testing"
   
func TestM2f(t *testing.T) {
  var x float64
  x = m2f(0.3048)                 
  if x != 1 {
    t.Error("Expected 1, got ", x)
  }
}  
