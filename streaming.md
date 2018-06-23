---

# Streaming Logs

---

## Machines - *Ceci n'est pas une pipe*
- similar libraries:
  - *conduit*
  - *purescript-coroutines*
  - *pipes*
- Idea: build up data processing machines<sup>1</sup>, compose them, join them, split them.
- Useful for cases when streaming from one IO source to another with intermediate processing phases.


<sub>1. Usually build something called a _Plan_, which is a DSL describing what the machine should do and how to terminate.</sub>

---

## Filter Type Description

We send out a description of what we want to monitor.

```haskell
-- | Filter has a phantom type for the specific event.
data Filter e =
  Filter { address   :: [Address]
         -- ^ contract addresses for event origin.
         , fromBlock :: ChainCursor
         , toBlock   :: ChainCursor
         , topics    :: [Maybe ByteString]
         -- ^ Bloom filter to narrow this event filter.
         }         
```
Each match that comes back looks like this:

```haskell
data FilterChange e = 
  FilterChange { rawChange :: Change
               -- ^ event metadata (e.g. tx hash)
               , event     :: e
               -- ^ particular event (e.g. Transfer)
               }
```

---

## Filter Machines (slightly simplified)

There's an internal distinction between folding over past blocks and subscribing to current events.

Folding over past events:
```haskell
-- | Take a filter and split it into smaller intervals.
filterStream 
  :: FilterStreamState e
  -> MachineT Web3 k (Filter e)

-- | Stream past events until you are caught up to 
-- | ChainHead or the end of the filter's interval.
playLogs 
  :: DecodeEvent i ni e
  => FilterStreamState e
  -> MachineT Web3 k [FilterChange e]
```

<sub> Weirdly, all of these machines are polymorphic in `k` </sub>
  
---

## Filter Machines (slightly simplified)

Subscribing to current events:

```haskell
-- | Poll the filter until a given block number
-- | TODO: support websockets
pollFilter 
  :: forall i ni e k . 
     DecodeEvent i ni e
  => Filter e
  -> MachineT Web3 k [FilterChange e]
```

Running a machine:

```haskell
data EventAction = Continue | Terminate

-- | run while 'mapM_'ing with the given handler.
reduceEventStream 
  :: Monad m
  => MachineT m k [FilterChange e]
  -> (e -> ReaderT Change m EventAction)
  -> m (Maybe (EventAction, BlockNumber))
```

---

## High level functions

There are also high level functions that take care of all the 
machines logic for you.

```haskell
-- | Subscribe to the given filter, processing a number
-- | of blocks at a time with the handler until 
-- | possibly transitioning to polling.
eventMany 
  :: DecodeEvent i ni e
  => Filter e
  -> Int
  -> (e -> ReaderT Change Web3 EventAction)
  -> Web3 ()
```
Ironically, I usually use this to feed a `Conduit` in all the data processing work that I do.

---