#
# ruby -Ke test.rb </dev/null && echo ok
#
require 'romkan'

raise unless "kanji".to_kana == "����"
raise unless "kanzi".to_kana == "����"
raise unless "kannji".to_kana == "����"
raise unless "chie".to_kana == "����"
raise unless "tie".to_kana == "����"
raise unless "kyouju".to_kana == "���礦����"
raise unless "syuukyou".to_kana == "���夦���礦"
raise unless "shuukyou".to_kana == "���夦���礦"
raise unless "saichuu".to_kana == "�������夦"
raise unless "saityuu".to_kana == "�������夦"
raise unless "cheri-".to_kana == "�����꡼"
raise unless "tyeri-".to_kana == "�����꡼"
raise unless "shinrai".to_kana == "����餤"
raise unless "sinrai".to_kana == "����餤"
raise unless "hannnou".to_kana == "�Ϥ�Τ�"
raise unless "han'nou".to_kana == "�Ϥ�Τ�"

raise unless "je".to_kana == "����"
raise unless "e-jento".to_kana == "�����������"

raise unless "kannzi".to_hepburn == "kanji"
raise unless "tie".to_hepburn == "chie"

raise unless "kanji".to_kunrei == "kanzi"
raise unless "chie".to_kunrei == "tie"

raise unless "����".to_roma == "kanji"
raise unless "���㤦".to_roma == "chau"
raise unless "�Ϥ�Τ�".to_roma == "han'nou"

raise unless "a".consonant? == false
raise unless "k".consonant? == true

raise unless "k".expand_consonant.sort == ["ka", "ke", "ki", "ko", "ku"]
raise unless "s".expand_consonant.sort == ["sa", "se", "si", "so", "su"]
raise unless "t".expand_consonant.sort == ["ta", "te", "ti", "to", "tu"]
raise unless "ky".expand_consonant.sort == ["kya", "kyo", "kyu"]
raise unless "kk".expand_consonant.sort == ["kka", "kke", "kki", "kko", "kku"]
raise unless "sh".expand_consonant.sort == ["sha", "shi", "sho", "shu"]
raise unless "sy".expand_consonant.sort == ["sya", "syo", "syu"]
raise unless "ch".expand_consonant.sort == ["cha", "che", "chi", "cho", "chu"]

while gets
  puts $_.to_kana
end

exit 0
