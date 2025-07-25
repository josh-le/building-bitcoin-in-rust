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
## brief history and overview of bitcoin
just basic outline of bitcoin
## the whitepaper pulled apart
__important terms:__
- __hash__ - we know
- __node__ - in the context of bitcoin, it is a program that stores either a complete or partial part of the timechain, and takes care of validation, propagation and mining
- __private and public keys__ - quote:
    In the context of encryption, the public key can only encrypt data, but not decrypt. In the context of digital signatures, the public key can only verify signatures, but cannot sign. The private key can do both and the public key is typically calculated from it. Asymmetric cryptography is typically slower than symmetric, and so it is commonly used to securely exchange a symmetric key when you want to establish encrypted communication with another party.
- __symmetric encryption__ - one key that handles encryption and decryption
- __asymmetric encryption__ - there is a private key with more capabilities than the public key
### introduction
going over the commercial applications of bitcoin - irreversible transactions, decentralized - eliminating the need for third parties to verify and mediate financial transactions.

cool quote:
"The system is secure as long as honest nodes collectively control more CPU power than any cooperating group of attacker nodes." - meaning that you could take over the blockchain if you got a majority of malicious nodes
### transactions
we define an __electronic coin__ as a chain of digital signatures
    each owner transfers the coin to the next by signing a hash of the previous transaction and the public key of the next owner and adding these to the end of the coin

to prevent _double-spending_, we need a public log of all transactions that the majority of nodes agree on to see if the coin has been spent before
### timestamp server
alright so the timestamp server just takes a block of items and hashes it
(probably with the time), then "widely publishes" it.
### proof-of-work
Hashcash by Adam Back was an idea for limiting the ability of email spammers - forcing them to compute a hash function every time they want to send an email.

bitcoin does basically the same thing but harder - increment a 'nonce' until the number of zeros at the start of the hash is satisfied

ensures that the 'majority' which decides the correct chain to use (?) is determined by cpu count rather than ip addr count

the proof of work difficulty is dynamically adjusted so that the blocks take about 10 minutes to compute on average
### network
__steps to run the network:__
1. new transactions broadcast to all nodes
2. each node collects new transactions into a block
3. each node works on finding a difficult proof of work for its block
4. when a node finds a proof of work, it broadcasts the block to all nodes
5. nodes accept the block only if all transactions in it are valid and not already spent
    a. nodes express their acceptance of the block by working on creating the next block in the chain using the hash they received as the previous hash
### incentive
there is a diminishing reward for mining bitcoin as the chain gets longer and longer, there is a formula here in the paper
    this is where the 21 million number comes from
