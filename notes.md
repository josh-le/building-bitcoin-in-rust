# book
/home/gump/programming/books/building-bitcoin-in-rust/Building\ bitcoin\ in\ Rust.pdf
# prelude
## who is this book for?
me.
## online resources
[github repo](https://github.com/braiins/building-bitcoin-in-rust)
## requirements
### pointers
main difference from what we know is that they can be 'shared' if they are borrowed immutable, or if they are borrowed mutably they are 'exclusive' to that reference
### allocations
similar to what we know, just more strict about enforcement
### stack and heap
we know
### threads
also what we know, allows concurrent execution without context switching out of the process
# foreword
LFG and learn some shit :)
# ch 1. introduction
## why are rust and bitcoin handsome together?
they both share the same philosophy of zero-trust

ok, this is awesome. this is the hexdump of the beginning of the first bitcoin:
```
00000000 ................
00000010 ................
00000020 ....;£íýz{.²zÇ,>
00000030 gv.a.È.ÃˆŠQ2:Ÿ¸ª
00000040 K.^J)«_Iÿÿ...¬+|
00000050 ................
00000060 ................
00000070 ......ÿÿÿÿM.ÿÿ..
00000080 ..EThe Times 03/
00000090 Jan/2009 Chancel
000000A0 lor on brink of 
000000B0 second bailout f
000000C0 or banksÿÿÿÿ..ò.
000000D0 *....CA.gŠý°þUH'
000000E0 .gñ¦q0·.\Ö¨(à9.¦
000000F0 ybàê.aÞ¶Iö¼?Lï8Ä
00000100 óU.å.Á.Þ\8M÷º..W
00000110 ŠLp+kñ._¬....
```
# ch. 2 analyzing the whitepaper
