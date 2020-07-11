# -*- coding: utf-8 -*-
#
# ruby -Ke test.rb </dev/null && echo ok
#
assert('to_kana') do
  assert_equal "かんじ", "kanji".to_kana
  assert_equal "かんじ", "kanzi".to_kana
  assert_equal "かんじ", "kannji".to_kana
  assert_equal "ちえ", "chie".to_kana
  assert_equal "ちえ", "tie".to_kana
  assert_equal "きょうじゅ", "kyouju".to_kana
  assert_equal "しゅうきょう", "syuukyou".to_kana
  assert_equal "しゅうきょう", "shuukyou".to_kana
  assert_equal "さいちゅう", "saichuu".to_kana
  assert_equal "さいちゅう", "saityuu".to_kana
  assert_equal "ちぇりー", "cheri-".to_kana
  assert_equal "ちぇりー", "tyeri-".to_kana
  assert_equal "しんらい", "shinrai".to_kana
  assert_equal "しんらい", "sinrai".to_kana
  assert_equal "はんのう", "hannnou".to_kana
  assert_equal "はんのう", "han'nou".to_kana

  assert_equal "じぇ", "je".to_kana
  assert_equal "えーじぇんと", "e-jento".to_kana  
end

assert('to_hepburn') do
  assert_equal "kanji", "kannzi".to_hepburn
  assert_equal "chie", "tie".to_hepburn

  assert_equal "kanzi", "kanji".to_kunrei
  assert_equal "tie", "chie".to_kunrei
end

assert('to_roma') do
  assert_equal "kanji", "かんじ".to_roma
  assert_equal "chau", "ちゃう".to_roma
  assert_equal "han'nou", "はんのう".to_roma
end

assert('consonant?') do
  assert_equal false, "a".consonant?
  assert_equal true, "k".consonant?

  assert_equal ["ka", "ke", "ki", "ko", "ku"], "k".expand_consonant.sort
  assert_equal ["sa", "se", "si", "so", "su"], "s".expand_consonant.sort
  assert_equal ["ta", "te", "ti", "to", "tu"], "t".expand_consonant.sort
  assert_equal ["kya", "kyo", "kyu"], "ky".expand_consonant.sort
  assert_equal ["kka", "kke", "kki", "kko", "kku"], "kk".expand_consonant.sort
  assert_equal ["sha", "shi", "sho", "shu"], "sh".expand_consonant.sort
  assert_equal ["sya", "syo", "syu"], "sy".expand_consonant.sort
  assert_equal ["cha", "che", "chi", "cho", "chu"], "ch".expand_consonant.sort
end
