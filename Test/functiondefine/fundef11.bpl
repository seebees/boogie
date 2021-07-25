// RUN: %boogie  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function {:define} foo(x:int) returns(int)
  { foo1(x) + 1 }
function foo1(x:int) returns(int)
  { foo2(x) }
function {:inline} foo2(x:int) returns(int)
  { foo(x) + 2 }

procedure test(x:int) returns (r:int)
  ensures r > 0;
{
  if (foo(x) > 0) {
    r := foo2(x);
  } else {
    r := 1;
  }
}