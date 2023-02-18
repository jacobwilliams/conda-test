
! gfortran --shared foo.f90 -o foo.so

integer(c_int) function foo() bind (c, name='foo')
  !DEC$ ATTRIBUTES DLLEXPORT :: foo
  use iso_c_binding
  implicit none
  foo = 99
end function foo