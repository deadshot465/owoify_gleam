import gleam/erlang/atom

pub type OwoifyLevel {
  Owo
  Uwu
  Uvu
}

/// The main entry point of `owoify_gleam`.
/// This function will use the `Owo` owoness to owoify the source string.
/// Returns the owoified string according to the passed owoify level.
pub fn owoify(source: String) {
  erl_owoify(source)
}

/// The main entry point of `owoify_gleam`.
/// This function will use the `Uwu` owoness to owoify the source string.
/// Returns the owoified string according to the passed owoify level.
pub fn uwuify(source: String) {
  erl_uwuify(source)
}

/// The main entry point of `owoify_gleam`.
/// This function will use the `Uvu` owoness to owoify the source string.
/// Returns the owoified string according to the passed owoify level.
pub fn uvuify(source: String) {
  erl_uvuify(source)
}

/// The main entry point of `owoify_gleam`.
/// This function will require the user to explicitly pass the desired owoness to owoify the source string.
/// Currently three owoify levels are supported: `Owo`, `Uwu`, `Uvu`.
/// Returns the owoified string according to the passed owoify level.
pub fn owoify_with_level(source: String, level: OwoifyLevel) {
  let owoness_level = case level {
    Owo -> atom.create_from_string("owo")
    Uwu -> atom.create_from_string("uwu")
    Uvu -> atom.create_from_string("uvu")
  }

  erl_owoify_with_level(source, owoness_level)
}

@external(erlang, "owoify_erl", "owoify")
fn erl_owoify(source: String) -> String

@external(erlang, "owoify_erl", "uwuify")
fn erl_uwuify(source: String) -> String

@external(erlang, "owoify_erl", "uvuify")
fn erl_uvuify(source: String) -> String

@external(erlang, "owoify_erl", "owoify")
fn erl_owoify_with_level(source: String, level: atom.Atom) -> String
