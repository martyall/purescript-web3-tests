module Test.Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (Milliseconds(..), launchAff_)
import Effect.Class (liftEffect)
import Network.Ethereum.Web3.Types.Provider (httpProvider)
import Test.Spec (parallel)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (defaultConfig, runSpecT)
import Web3Spec.Live.SimpleStorageSpec as SimpleStorageSpec
import Web3Spec.Live.ComplexStorageSpec as ComplexStorageSpec
import Web3Spec.Live.MockERC20Spec as MockERC20Spec
import Web3Spec.Live.PayableTestSpec as PayableTestSpec
import Web3Spec.Live.SimpleErrorTestSpec as SimpleErrorTestSpec
import Web3Spec.Live.MultifilterSpec as MultifilterSpec
import Web3Spec.Live.FilterSpec as FilterSpec

main :: Effect Unit
main =
  launchAff_ do
    let
      cfg = defaultConfig { timeout = Just (Milliseconds $ 120.0 * 1000.0) }
    p <- liftEffect $ httpProvider "http://localhost:8545"
    void $ join
      $ runSpecT cfg [ consoleReporter ] do
          FilterSpec.spec p
          -- payable spec can't be run in parallel :/
          PayableTestSpec.spec p
          -- all of these tests only have one `it` statement and
          -- are dealing with separate contracts so they can be run
          -- in parallel
          parallel do
            SimpleStorageSpec.spec p
            ComplexStorageSpec.spec p
            MockERC20Spec.spec p
            SimpleErrorTestSpec.spec p
            MultifilterSpec.spec p
