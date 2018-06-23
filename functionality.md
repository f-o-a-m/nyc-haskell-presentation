---

# Data Access and Streaming

---

## The Problem

- Node's primary concern is block production, propogation, and verification
- Internal storage model is cryptographic (Merkle) trees
- Query performance not a concern

---

## Block Model

```json
{
  hash: "0xfc31...",
  number: 5840941,
  parentHash: "0x6a4d...",
  receiptsRoot: "0x17e8...",
  stateRoot: "0x5d10...",
  logsBloom: "0x4503...",
  transactionsRoot: "0xe7f0...",
  transactions: [
    "0x5465...",
    "0x7ce7...",
    ...
  ],
...
}
```
Takeaway: Lots of *roots*

---

## Ethereum Progression Graphic

Blocks carry an index into a storage tree, called a *state root*
<center>
<a href="https://raw.githubusercontent.com/f-o-a-m/recurse-presentation/master/images/foam-architecture.png">
<img src="images/bc-tree1.png" height="450">
</a>
</center>

** <sup>Images shamelessly adapted from Git Internals by Scott Chacon</sup>

---

## Ethereum Progression Graphic

Block progression gives a series of indices into storage
<center>
<a href="https://raw.githubusercontent.com/f-o-a-m/recurse-presentation/master/images/foam-architecture.png">
<img src="images/bc-tree2.png" height="450">
</a>
</center>

---

## Ethereum Progression Graphic

- want to stream relevant application updates
- want to access history (e.g. indexing, auditing, replaying)
<center>
<a href="https://raw.githubusercontent.com/f-o-a-m/recurse-presentation/master/images/foam-architecture.png">
<img src="images/bc-tree3.png" height="450">
</a>
</center>

---
