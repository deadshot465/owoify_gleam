# owoify_gleam
Turning your worst nightmare into a Gleam package on Hex.

[![Package Version](https://img.shields.io/hexpm/v/owoify_gleam)](https://hex.pm/packages/owoify_gleam)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/owoify_gleam/)

- [Hex package](https://hex.pm/packages/owoify_gleam)

This is a Gleam port of [mohan-cao's owoify-js](https://github.com/mohan-cao/owoify-js), which will help you turn any string into nonsensical babyspeak similar to LeafySweet's infamous Chrome extension.

Just like my other Owoify ports, three levels of owoness are available:

1. **owo (default):** The most vanilla one.
2. **uwu:** The moderate one.
3. **uvu:** Litewawwy unweadabwal.

Please refer to the [original owoify-js](https://github.com/mohan-cao/owoify-js) repository for more information.

Right now Gleam's stdlib doesn't have a comprehensive regular expression support. Thankfully, Gleam has wonderful support for Erlang FFI. Therefore, currently this library is just a thin wrapper of my [owoify_erl](https://github.com/deadshot465/owoify_erl). 

# Reason for development

Even though Gleam's Erlang FFI support is excellent, calling functions written in Erlang still requires you manually write external functions, which can be painstaking depending on how many external functions you want to call. Therefore, [owoify_gleam](https://github.com/deadshot465/owoify_gleam) is just a thin wrapper of my [owoify_erl](https://github.com/deadshot465/owoify_erl) that does exactly that for you.

Also Gleam is cool! 😌

# Installation

```sh
gleam add owoify_gleam
```

# Usage

```gleam
import gleam/io
import owoify_gleam

pub fn main() {
  owoify_gleam.owoify("This is the string to owo! Kinda cute isn't it?")
  |> io.println()

  owoify_gleam.owoify_with_level("This is the string to owo! Kinda cute isn't it?", owoify_gleam.Uvu)
  |> io.println()
}

// Possible output
// This is teh stwing two owo! Kinda cute isn't it?
// fwis is teh stwing two owowowouwu Kinda cute isn't it?
```

Further documentation can be found at <https://hexdocs.pm/owoify_gleam>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```

## Disclaimer

As always, this package is written for practicing and bots' needs. Performance is **NOT** guaranteed.

That being said, PRs are always welcomed.

## See also
- [owoify-js](https://github.com/mohan-cao/owoify-js) - The original owoify-js repository.
- [Owoify.Net](https://www.nuget.org/packages/Owoify.Net/1.0.1) - The C# port of Owoify written by me.
- [Owoify++](https://github.com/deadshot465/OwoifyCpp) - The C++ header-only port of Owoify written by me.
- [owoify_rs](https://crates.io/crates/owoify_rs) - The Rust port of Owoify written by me.
- [owoify-py](https://pypi.org/project/owoify-py/) - The Python port of Owoify written by me.
- [owoify_dart](https://pub.dev/packages/owoify_dart) - The Dart port of Owoify written by me.
- [owoify_rb](https://rubygems.org/gems/owoify_rb) - The Ruby port of Owoify written by me.
- [owoify-go](https://pkg.go.dev/github.com/deadshot465/owoify-go) - The Go port of Owoify written by me.
- [owoifySwift](https://github.com/deadshot465/OwoifySwift) - The Swift port of Owoify written by me.
- [owoifyKt](https://search.maven.org/search?q=g:%22io.github.deadshot465%22%20AND%20a:%22owoifyKt%22) - The Kotlin port of Owoify written by me.
- [owoify_ex](https://hex.pm/packages/owoify_ex) - The Elixir port of Owoify written by me.
- [owoify_cr](https://crystalshards.org/shards/github/deadshot465/owoify_cr) - The Crystal port of Owoify written by me.
- [owoifynim](https://nimble.directory/pkg/owoifynim) - The Nim port of Owoify written by me.
- [owoify-clj](https://clojars.org/net.clojars.deadshot465/owoify-clj) - The Clojure port of Owoify written by me.
- [purescript-owoify](https://pursuit.purescript.org/packages/purescript-owoify) - The PureScript port of Owoify written by me.
- [owoify-hs](https://hackage.haskell.org/package/owoify-hs) - The Haskell port of Owoify written by me.
- [owoify_erl](https://hex.pm/packages/owoify_erl) - The Erlang port of Owoify written by me.