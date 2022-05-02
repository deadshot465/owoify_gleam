import gleam/int
import gleam/regex
import gleam/result
import word/word

fn default_options() {
    regex.Options(False, False)
}

fn o_to_owo() {
    regex.compile("o", default_options())
}

fn ew_to_uwu() {
    regex.compile("ew", default_options())
}

fn hey_to_hay() {
    regex.compile("([Hh])ey", default_options())
}

fn dead_to_ded_upper() {
    regex.compile("Dead", default_options())
}

fn dead_to_ded_lower() {
    regex.compile("dead", default_options())
}

fn n_vowel_t_to_nd() {
    regex.compile("n[aeiou]*t", default_options())
}

fn read_to_wead_upper() {
    regex.compile("Read", default_options())
}

fn read_to_wead_lower() {
    regex.compile("read", default_options())
}

fn brackets_to_startrails_fore() {
    regex.compile("[({<]", default_options())
}

fn brackets_to_startrails_rear() {
    regex.compile("[)}>]", default_options())
}

fn period_comma_exclamation_semicolon_to_kaomojis_first() {
    regex.compile("[.,](?![0-9])", default_options())
}

fn period_comma_exclamation_semicolon_to_kaomojis_second() {
    regex.compile("[!;]+", default_options())
}

fn that_to_dat_upper() {
    regex.compile("That", default_options())
}

fn that_to_dat_lower() {
    regex.compile("that", default_options())
}

fn th_to_f_upper() {
    regex.compile("TH(?!E)", default_options())
}

fn th_to_f_lower() {
    regex.compile("[Tt]h(?![Ee])", default_options())
}

fn le_to_wal() {
    regex.compile("le$", default_options())
}

fn ve_to_we_upper() {
    regex.compile("Ve", default_options())
}

fn ve_to_we_lower() {
    regex.compile("ve", default_options())
}

fn ry_to_wwy() {
    regex.compile("ry", default_options())
}

fn rorl_to_w_upper() {
    regex.compile("(?:R|L)", default_options())
}

fn rorl_to_w_lower() {
    regex.compile("(?:r|l)", default_options())
}

fn ll_to_ww() {
    regex.compile("ll", default_options())
}

fn vowel_or_r_except_o_l_to_wl_upper() {
    regex.compile("[AEIUR]([lL])$", default_options())
}

fn vowel_or_r_except_o_l_to_wl_lower() {
    regex.compile("[aeiur]l$", default_options())
}

fn old_to_owld_upper() {
    regex.compile("OLD", default_options())
}

fn old_to_owld_lower() {
    regex.compile("([Oo])ld", default_options())
}

fn ol_to_owl_upper() {
    regex.compile("OL", default_options())
}

fn ol_to_owl_lower() {
    regex.compile("([Oo])l", default_options())
}

fn lorr_o_to_wo_upper() {
    regex.compile("[LR]([oO])", default_options())
}

fn lorr_o_to_wo_lower() {
    regex.compile("[lr]o", default_options())
}

fn specific_consonants_o_to_letter_and_wo_upper() {
    regex.compile("([BCDFGHJKMNPQSTXYZ])([oO])", default_options())
}

fn specific_consonants_o_to_letter_and_wo_lower() {
    regex.compile("([bcdfghjkmnpqstxyz])o", default_options())
}

fn vorw_le_to_wal() {
    regex.compile("[vw]le", default_options())
}

fn fi_to_fwi_upper() {
    regex.compile("FI", default_options())
}

fn fi_to_fwi_lower() {
    regex.compile("([Ff])i", default_options())
}

fn ver_to_wer() {
    regex.compile("([Vv])er", default_options())
}

fn poi_to_pwoi() {
    regex.compile("([Pp])oi", default_options())
}

fn specific_consonants_le_to_letter_and_wal() {
    regex.compile("([DdFfGgHhJjPpQqRrSsTtXxYyZz])le$", default_options())
}

fn consonant_r_to_consonant_w() {
    regex.compile("([BbCcDdFfGgKkPpQqSsTtWwXxZz])r", default_options())
}

fn ly_to_wy_upper() {
    regex.compile("Ly", default_options())
}

fn ly_to_wy_lower() {
    regex.compile("ly", default_options())
}

fn ple_to_pwe() {
    regex.compile("([Pp])le", default_options())
}

fn nr_to_nw_upper() {
    regex.compile("NR", default_options())
}

fn nr_to_nw_lower() {
    regex.compile("nr", default_options())
}

fn fuc_to_fwuc() {
    regex.compile("([Ff])uc", default_options())
}

fn mom_to_mwom() {
    regex.compile("([Mm])om", default_options())
}

fn me_to_mwe() {
    regex.compile("([Mm])e", default_options())
}

fn n_vowel_to_ny_first() {
    regex.compile("n([aeiou])", default_options())
}

fn n_vowel_to_ny_second() {
    regex.compile("N([aeiou])", default_options())
}

fn n_vowel_to_ny_third() {
    regex.compile("N([AEIOU])", default_options())
}

fn ove_to_uv_upper() {
    regex.compile("OVE", default_options())
}

fn ove_to_uv_lower() {
    regex.compile("ove", default_options())
}

fn haha_to_hehe_xd() {
    regex.compile("\\b(ha|hah|heh|hehe)+\\b", default_options())
}

fn the_to_teh() {
    regex.compile("\\b([Tt])he\\b", default_options())
}

fn you_to_u_upper() {
    regex.compile("\\bYou\\b", default_options())
}

fn you_to_u_lower() {
    regex.compile("\\byou\\b", default_options())
}

fn time_to_tim() {
    regex.compile("\\b([Tt])ime\\b", default_options())
}

fn over_to_owor() {
    regex.compile("([Oo])ver", default_options())
}

fn worse_to_wose() {
    regex.compile("([Ww])orse", default_options())
}

fn faces() {
    [
    "(・`ω´・)",
    ";;w;;",
    "owo",
    "UwU",
    ">w<",
    "^w^",
    "(* ^ ω ^)",
    "(⌒ω⌒)",
    "ヽ(*・ω・)ﾉ",
    "(o´∀`o)",
    "(o･ω･o)",
    "＼(＾▽＾)／",
    "(*^ω^)",
    "(◕‿◕✿)",
    "(◕ᴥ◕)",
    "ʕ•ᴥ•ʔ",
    "ʕ￫ᴥ￩ʔ",
    "(*^.^*)",
    "(｡♥‿♥｡)",
    "OwO",
    "uwu",
    "uvu",
    "UvU",
    "(*￣з￣)",
    "(つ✧ω✧)つ",
    "(/ =ω=)/",
    "(╯°□°）╯︵ ┻━┻",
    "┬─┬ ノ( ゜-゜ノ)",
    "¯\\_(ツ)_/¯",
    ]
}

pub fn map_o_to_owo(word: word.Word) {
    let replacement = case int.random(0, 2) {
        0 -> "owo"
        _ -> "o"
    }
    result.map(o_to_owo(), fn(r) {
        word.replace(word, r, replacement, False)
    })
}

pub fn map_ew_to_uwu(word: word.Word) {
    result.map(ew_to_uwu(), fn(r) {
        word.replace(word, r, "uwu", False)
    })
}