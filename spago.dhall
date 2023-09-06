{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "web3-tests"
, dependencies =
  [ "console", "effect", "psci-support", "prelude", "chanterelle" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
