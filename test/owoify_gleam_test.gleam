import gleam/erlang/atom
import gleam/list
import gleam/string
import gleeunit
import gleeunit/should
import owoify_gleam
import simplifile

pub fn main() {
  gleeunit.main()
}

pub fn owo_level_test() {
  let length =
    source()
    |> owoify_gleam.owoify()
    |> string.length()

  should.be_true(length > 0)
}

pub fn uwu_level_test() {
  let length =
    source()
    |> owoify_gleam.uwuify()
    |> string.length()

  should.be_true(length > 0)
}

pub fn uvu_level_test() {
  let length =
    source()
    |> owoify_gleam.uvuify()
    |> string.length()

  should.be_true(length > 0)
}

pub fn not_equal_to_source_test() {
  let source = source()
  let result = owoify_gleam.owoify(source)
  should.not_equal(source, result)

  let result = owoify_gleam.uwuify(source)
  should.not_equal(source, result)

  let result = owoify_gleam.uvuify(source)
  should.not_equal(source, result)
}

pub fn owo_not_equal_to_uwu_test() {
  let source = source()
  let owo_result = owoify_gleam.owoify(source)
  let uwu_result = owoify_gleam.uwuify(source)
  should.not_equal(owo_result, uwu_result)
}

pub fn uwu_not_equal_to_uvu_test() {
  let source = source()
  let uwu_result = owoify_gleam.uwuify(source)
  let uvu_result = owoify_gleam.uvuify(source)
  should.not_equal(uwu_result, uvu_result)
}

pub fn owo_not_equal_to_uvu_test() {
  let source = source()
  let owo_result = owoify_gleam.owoify(source)
  let uvu_result = owoify_gleam.uvuify(source)
  should.not_equal(owo_result, uvu_result)
}

pub fn pokemon_names_test() {
  let path = "./assets/pokemons.txt"
  let assert Ok(pokemon_names) = simplifile.read(from: path)
  let names = string.split(pokemon_names, on: "\n")
  list.each(names, fn(name) {
    let owo_name_length =
      owoify_gleam.owoify(name)
      |> string.length()
    let uwu_name_length =
      owoify_gleam.uwuify(name)
      |> string.length()
    let uvu_name_length =
      owoify_gleam.uvuify(name)
      |> string.length()
    should.be_true(owo_name_length > 0)
    should.be_true(uwu_name_length > 0)
    should.be_true(uvu_name_length > 0)
  })
}

pub fn long_texts_test_() {
  let path = "./assets/war_and_peace_chapter01-20.txt"
  let assert Ok(text) = simplifile.read(from: path)
  let assert Ok(timeout) = atom.from_string("timeout")
  #(timeout, 600, [
    fn() {
      let owo_text_length =
        owoify_gleam.owoify(text)
        |> string.length()
      let uwu_text_length =
        owoify_gleam.uwuify(text)
        |> string.length()
      let uvu_text_length =
        owoify_gleam.uvuify(text)
        |> string.length()
      should.be_true(owo_text_length > 0)
      should.be_true(uwu_text_length > 0)
      should.be_true(uvu_text_length > 0)
    },
  ])
}

fn source() {
  "This is the string to owo! Kinda cute isn't it?"
}
