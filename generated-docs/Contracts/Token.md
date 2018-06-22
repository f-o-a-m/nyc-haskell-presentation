## Module Contracts.Token

Token

#### `ApproveFn`

``` purescript
type ApproveFn = Tagged (SProxy "approve(address,uint256)") (Tuple2 Address (UIntN (D2 :& D5 :& (DOne D6))))
```

ApproveFn

#### `approve`

``` purescript
approve :: forall e. TransactionOptions NoPay -> { _spender :: Address, _value :: UIntN (D2 :& D5 :& (DOne D6)) } -> Web3 e HexString
```

#### `TotalSupplyFn`

``` purescript
type TotalSupplyFn = Tagged (SProxy "totalSupply()") (Tuple0)
```

TotalSupplyFn

#### `totalSupply`

``` purescript
totalSupply :: forall e. TransactionOptions NoPay -> ChainCursor -> Web3 e (Either CallError (UIntN (D2 :& D5 :& (DOne D6))))
```

#### `TransferFromFn`

``` purescript
type TransferFromFn = Tagged (SProxy "transferFrom(address,address,uint256)") (Tuple3 Address Address (UIntN (D2 :& D5 :& (DOne D6))))
```

TransferFromFn

#### `transferFrom`

``` purescript
transferFrom :: forall e. TransactionOptions NoPay -> { _from :: Address, _to :: Address, _value :: UIntN (D2 :& D5 :& (DOne D6)) } -> Web3 e HexString
```

#### `DecreaseApprovalFn`

``` purescript
type DecreaseApprovalFn = Tagged (SProxy "decreaseApproval(address,uint256)") (Tuple2 Address (UIntN (D2 :& D5 :& (DOne D6))))
```

DecreaseApprovalFn

#### `decreaseApproval`

``` purescript
decreaseApproval :: forall e. TransactionOptions NoPay -> { _spender :: Address, _subtractedValue :: UIntN (D2 :& D5 :& (DOne D6)) } -> Web3 e HexString
```

#### `BalanceOfFn`

``` purescript
type BalanceOfFn = Tagged (SProxy "balanceOf(address)") (Tuple1 Address)
```

BalanceOfFn

#### `balanceOf`

``` purescript
balanceOf :: forall e. TransactionOptions NoPay -> ChainCursor -> { _owner :: Address } -> Web3 e (Either CallError (UIntN (D2 :& D5 :& (DOne D6))))
```

#### `TransferFn`

``` purescript
type TransferFn = Tagged (SProxy "transfer(address,uint256)") (Tuple2 Address (UIntN (D2 :& D5 :& (DOne D6))))
```

TransferFn

#### `transfer`

``` purescript
transfer :: forall e. TransactionOptions NoPay -> { _to :: Address, _value :: UIntN (D2 :& D5 :& (DOne D6)) } -> Web3 e HexString
```

#### `SUPPLYFn`

``` purescript
type SUPPLYFn = Tagged (SProxy "SUPPLY()") (Tuple0)
```

SUPPLYFn

#### `sUPPLY`

``` purescript
sUPPLY :: forall e. TransactionOptions NoPay -> ChainCursor -> Web3 e (Either CallError (UIntN (D2 :& D5 :& (DOne D6))))
```

#### `IncreaseApprovalFn`

``` purescript
type IncreaseApprovalFn = Tagged (SProxy "increaseApproval(address,uint256)") (Tuple2 Address (UIntN (D2 :& D5 :& (DOne D6))))
```

IncreaseApprovalFn

#### `increaseApproval`

``` purescript
increaseApproval :: forall e. TransactionOptions NoPay -> { _spender :: Address, _addedValue :: UIntN (D2 :& D5 :& (DOne D6)) } -> Web3 e HexString
```

#### `AllowanceFn`

``` purescript
type AllowanceFn = Tagged (SProxy "allowance(address,address)") (Tuple2 Address Address)
```

AllowanceFn

#### `allowance`

``` purescript
allowance :: forall e. TransactionOptions NoPay -> ChainCursor -> { _owner :: Address, _spender :: Address } -> Web3 e (Either CallError (UIntN (D2 :& D5 :& (DOne D6))))
```

#### `ConstructorFn`

``` purescript
type ConstructorFn = Tagged (SProxy "constructor()") (Tuple0)
```

ConstructorFn

#### `constructor`

``` purescript
constructor :: forall e. TransactionOptions NoPay -> HexString -> Web3 e HexString
```

#### `TokenConstructor`

``` purescript
newtype TokenConstructor
  = TokenConstructor { _from :: Address, _value :: UIntN (D2 :& D5 :& (DOne D6)) }
```

TokenConstructor

##### Instances
``` purescript
Newtype TokenConstructor _
EventFilter TokenConstructor
IndexedEvent Tuple0 (Tuple2 (Tagged (SProxy "_from") Address) (Tagged (SProxy "_value") (UIntN (DCons D2 (DCons D5 (DOne D6)))))) TokenConstructor
Generic TokenConstructor _
Show TokenConstructor
Eq TokenConstructor
```

#### `Approval`

``` purescript
newtype Approval
  = Approval { owner :: Address, spender :: Address, value :: UIntN (D2 :& D5 :& (DOne D6)) }
```

Approval

##### Instances
``` purescript
Newtype Approval _
EventFilter Approval
IndexedEvent (Tuple2 (Tagged (SProxy "owner") Address) (Tagged (SProxy "spender") Address)) (Tuple1 (Tagged (SProxy "value") (UIntN (DCons D2 (DCons D5 (DOne D6)))))) Approval
Generic Approval _
Show Approval
Eq Approval
```

#### `Transfer`

``` purescript
newtype Transfer
  = Transfer { from :: Address, to :: Address, value :: UIntN (D2 :& D5 :& (DOne D6)) }
```

Transfer

##### Instances
``` purescript
Newtype Transfer _
EventFilter Transfer
IndexedEvent (Tuple2 (Tagged (SProxy "from") Address) (Tagged (SProxy "to") Address)) (Tuple1 (Tagged (SProxy "value") (UIntN (DCons D2 (DCons D5 (DOne D6)))))) Transfer
Generic Transfer _
Show Transfer
Eq Transfer
```


