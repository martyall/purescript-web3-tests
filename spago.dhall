{ name = "web3-tests"
, dependencies =
  [ "aff"
  , "argonaut"
  , "arrays"
  , "avar"
  , "bifunctors"
  , "bytestrings"
  , "console"
  , "control"
  , "effect"
  , "either"
  , "eth-core"
  , "exceptions"
  , "foldable-traversable"
  , "foreign-object"
  , "identity"
  , "integers"
  , "lists"
  , "maybe"
  , "newtype"
  , "node-buffer"
  , "orders"
  , "parallel"
  , "partial"
  , "prelude"
  , "profunctor-lenses"
  , "quotient"
  , "record"
  , "ring-modules"
  , "simple-json"
  , "spec"
  , "strings"
  , "tagged"
  , "tailrec"
  , "transformers"
  , "tuples"
  , "unfoldable"
  , "unsafe-coerce"
  , "web3"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
