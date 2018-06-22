---
author: Martin Allen & Kristoffer Josefsson, FOAM
title: Functional Ethereum
date: May 27, 2018
---

# Ethereum ... and Cats

---

## Cryptokitties, what are they?

<center>
<a href="https://www.cryptokitties.co/marketplace">
<img src="images/crypto-kitties-marketplace.png" height="400">
</a>
</center>

---

## What are they worth?

Turns out over 12 million dollars!

<center>
<a href="http://www.kittyexplorer.com/stats/">
<img src="images/crypto-kitties.png" height="350">
</a>
</center>


---

## Ethereum Market Cap

- Second highest cryptocurrency market cap
- Doesn't include the sum of the value of tokens

<center>
<a href="https://etherscan.io/chart/marketcap">
<img src="images/marketcap.png" height="400">
</a>
</center>


---

## Kitty Monitor

- Monitor the sales in real time with the [kitty-monitor](https://github.com/f-o-a-m/purescript-kitty-monitor)
- Backed by purescript-web3

<center>
<a href="https://f-o-a-m.github.io/purescript-kitty-monitor/">
<img src="images/kitty-monitor.png" height="400">
</a>
</center>


## Solidity

- Javascript like syntax
- Special blockchain, crypto and signature-recovery primitives
- Types for EVM primitives such as `uint48`
- Interface through `ABI`

---

```javascript
contract GreedyStorage is Owned {
  uint public m; // automatically generate "getter" m()
  event Overidden(address overrider);
  function increase (uint n) onlyOwner returns (uint) {
     m = m + n;
     return m;
  }
  function override (uint n) payable {
    require(msg.value > 100000);  // this is the price
    m = n;
    Overidden(msg.sender);
  }
}
```

[edit on remix](https://ethereum.github.io/browser-solidity/#version=soljson-v0.4.19+commit.c4cbbb05.js&optimize=false&gist=e4e6f665ca0d85dc30b6879e275fd84c)

---

The **selector** is how we speficy the function to execute

```haskell
selector :: FunctionSignature -> ByteString
selector = take 8 $ sha3

> selector "increase(uint256)"
> "30f3f0db"
```

so for `GreedyStorage` we get

```json
{
    "increase(uint256)" : "30f3f0db",
    "m()"               : "5a2ee019",
    "override(uint256)" : "94d9e61c"
}
```

---

## Typesafety (on-chain)

- Typesafe EVM language wouldn't necessarily have prevented infamous bugs. We'd need session types or similar.
- Fundamental problem is call-out from turingcomplete executable to turing complete executable. Type level information not preserved on EVM.

---

## Typesafety (off-chain)

### Prevent catastrophes

- Encoding errors
- Improper value transfer
- Function/argument mismatch

---

Subtle changes leading to broken application code

```javascript
contract A {
  uint n;
  function A (uint _arg) {
    n = _arg;
  }
}
```

```javascript
contract A {
  int n;
  function A (uint _arg) {
    n = _arg;
  }
}
```
