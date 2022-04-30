import gleam/bool
import gleam/list
import gleam/option
import gleam/regex
import gleam/result
import gleam/set
import gleam/string

pub type Word {
    Word(word: String, replaced_words: set.Set(String))
}

fn search_value_contains_replaced_words(word: Word, search_value: regex.Regex, replace_value: String) -> Bool {
    set.to_list(word.replaced_words) |> list.any(fn(s) { 
        case regex.check(search_value, s) {
            True -> {
                let match_result = regex.scan(search_value, s) |> list.at(0) |> result.map(fn(x) { x.content })
                string.replace(in: s, each: result.unwrap(match_result, ""), with: replace_value) == s
            }
            False ->
                False
        }
     })
}

pub fn replace(word: Word, search_value: regex.Regex, replace_value: String, replace_replaced_words: Bool) -> Word {
    case bool.negate(replace_replaced_words) && search_value_contains_replaced_words(word, search_value, replace_value)  {
        True -> word
        False -> {
            let collection = regex.scan(search_value, word.word)
            let replacing_word = case regex.check(search_value, word.word) {
                True -> collection
                    |> list.at(0)
                    |> result.map(fn(x) { string.replace(x.content, x.content, replace_value) })
                    |> result.unwrap("")
                False -> word.word
            }

            let replaced_words = case list.length(collection) {
                x if x > 1 -> {
                    list.map(collection, fn(x) {
                        string.replace(x.content, x.content, replace_value)
                    })
                }
                _ -> []
            }

            case replacing_word == word.word {
                False -> {
                    let new_replaced_words = list.fold(replaced_words, word.replaced_words, fn(acc, elem) {
                        set.insert(acc, elem)
                    })
                    Word(replacing_word, new_replaced_words)
                }
                True -> word
            }
        }
    }
}

pub fn replace_with_func_single(word: Word, search_value: regex.Regex, func: fn() -> String, replace_replaced_words: Bool) -> Word {
    let replace_value = func()

    case bool.negate(replace_replaced_words) && search_value_contains_replaced_words(word, search_value, replace_value) {
        True -> word
        False -> {
            let collection = regex.scan(search_value, word.word)
            let replacing_word = case regex.check(search_value, word.word) {
                True -> {
                    let match_item = collection
                        |> list.at(0)
                        |> result.map(fn(x) { x.content })
                        |> result.unwrap("")
                    string.replace(word.word, match_item, replace_value)
                }
                False -> word.word
            }

            let replaced_words = case list.length(collection) {
                x if x > 1 -> {
                    list.map(collection, fn(x) {
                        string.replace(x.content, x.content, replace_value)
                    })
                }
                _ -> []
            }

            case replacing_word == word.word {
                False -> {
                    let new_replaced_words = list.fold(replaced_words, word.replaced_words, fn(acc, elem) {
                        set.insert(acc, elem)
                    })
                    Word(replacing_word, new_replaced_words)
                }
                True -> word
            }
        }
    }
}

pub fn replace_with_func_multiple(word: Word, search_value: regex.Regex, func: fn(String, String) -> String, replace_replaced_words: Bool) -> Word {
    case regex.check(search_value, word.word) {
        False -> word
        True -> {
            let collection = regex.scan(search_value, word.word)
            let group1 = collection
                |> list.at(0)
                |> result.map(fn(x) { x.submatches
                    |> list.at(0)
                    |> result.unwrap(option.None)
                    |> option.unwrap("") })
                |> result.unwrap("")
            let group2 = collection
                |> list.at(0)
                |> result.map(fn(x) { x.submatches
                    |> list.at(1)
                    |> result.unwrap(option.None)
                    |> option.unwrap("") })
                |> result.unwrap("")
            let replace_value = func(group1, group2)

            case bool.negate(replace_replaced_words) && search_value_contains_replaced_words(word, search_value, replace_value) {
                True -> word
                False -> {
                    let replacing_word = collection |> list.at(0) |> result.map(fn(x) { x.content |> string.replace(x.content, replace_value) }) |> result.unwrap("")
                    let replaced_words = case list.length(collection) {
                        x if x > 1 -> {
                            list.map(collection, fn(x) {
                                string.replace(x.content, x.content, replace_value)
                            })
                        }
                        _ -> []
                    }

                    case replacing_word == word.word {
                        False -> {
                            let new_replaced_words = list.fold(replaced_words, word.replaced_words, fn(acc, elem) {
                                set.insert(acc, elem)
                            })
                            Word(replacing_word, new_replaced_words)
                        }
                        True -> word
                    }
                }
            }
        }
    }
}