---

# Functional Tools

---


## Core Functional Ethereum Libraries
 - ### hs-web3
 - purescript-web3
 - chanterelle

---

# High Level Overview

---

## Minimal web3 Library Requirements
 - query blockchain metadata (blocks, transactions, etc)
 - interact with smart contracts 
 - stream logs

---

## Interacting with Smart Contracts

- Ethereum smart contracts expose an interface
- Example: ERC20 standard

<a href="https://theethereum.wiki/w/index.php/ERC20_Token_Standard">
<img src="images/erc20-abi.png" height="350">
</a>
</center>

---

## Interacting with Smart Contracts (ABI)
- Compliation artifact called ABI
- JSON object specifying interface:
  - function calls
  - events / topics
- Straightforward to generate FFI with Template Haskell

---

## Interacting with Smart Contracts (QuasiQuoter)

```haskell
[abiFrom|".abis/ERC20.json"]
```
```haskell
...
-- | Transfer a quantity of tokens to an address.  
transfer :: Call -> Address -> UIntN 256 -> Web3 Hash

-- | Represents a 'Transfer' event log.
data Transfer = 
  Transfer { transferFrom :: Address
           , transferTo :: Address
           , transferValue :: UIntN 256
           } deriving (Show, Eq, Ord, Generic)
...
```

---

## Interacting with Smart Contracts (Encodings)

- Ethereum has its own encoding schema (ABI)
  - transactions are serialized closures
  - events / topics
- codecs derived generically (`generics-sop`)
- instances declared in QQ

---

#### Conclusion:
All datatypes and FFI needed to interact with *any* Smart Contract can be generated from the QuasiQuoter and used natively in any application.

---

<center>
  
## What does it look like?
<a href="https://raw.githubusercontent.com/f-o-a-m/recurse-presentation/master/images/foam-architecture.png">
<img src="images/foam-architecture.png" height="450">
</a>
</center>

---
