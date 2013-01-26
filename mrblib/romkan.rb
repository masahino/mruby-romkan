# -*- coding: utf-8 -*-
#
# Ruby/Romkan - a Romaji <-> Kana conversion library for Ruby.
#
# Copyright (C) 2001 Satoru Takabayashi <satoru@namazu.org>
#     All rights reserved.
#     This is free software with ABSOLUTELY NO WARRANTY.
#
# You can redistribute it and/or modify it under the terms of 
# the Ruby's licence.
#
# NOTE: Ruby/Romkan can work only with EUC_JP encoding. ($KCODE="e")
#

module Romkan
  VERSION = '0.4'
end

class Array
  def pairs(s=2)
    0.step(self.size-1,s){
      |x| yield self.slice(x,s)
    }
  end
end
	
class String
# This table is imported from KAKASI <http://kakasi.namazu.org/> and modified.
  KUNREITAB = [
"ぁ	xa	あ	a	ぃ	xi	い	i	ぅ	xu",
"う	u	う゛	vu	う゛ぁ	va	う゛ぃ	vi 	う゛ぇ	ve",
"う゛ぉ	vo	ぇ	xe	え	e	ぉ	xo	お	o ",

"か	ka	が	ga	き	ki	きゃ	kya	きゅ	kyu",
"きょ	kyo	ぎ	gi	ぎゃ	gya	ぎゅ	gyu	ぎょ	gyo",
"く	ku	ぐ	gu	け	ke	げ	ge	こ	ko",
"ご	go ",

"さ	sa	ざ	za	し	si	しゃ	sya	しゅ	syu",
"しょ	syo	じ	zi	じゃ	zya	じゅ	zyu	じょ	zyo",
"す	su	ず	zu	せ	se	ぜ	ze	そ	so",
"ぞ	zo ",

"た	ta	だ	da	ち	ti	ちゃ	tya	ちゅ	tyu",
"ちょ	tyo	ぢ	di	ぢゃ	dya	ぢゅ	dyu	ぢょ	dyo",

"っ	xtu ",
"っう゛	vvu	っう゛ぁ	vva	っう゛ぃ	vvi",
"っう゛ぇ	vve	っう゛ぉ	vvo ",
"っか	kka	っが	gga	っき	kki	っきゃ	kkya",
"っきゅ	kkyu	っきょ	kkyo	っぎ	ggi	っぎゃ	ggya",
"っぎゅ	ggyu	っぎょ	ggyo	っく	kku	っぐ	ggu",
"っけ	kke	っげ	gge	っこ	kko	っご	ggo	っさ	ssa",
"っざ	zza	っし	ssi	っしゃ	ssya",
"っしゅ	ssyu	っしょ	ssho",
"っじ	zzi	っじゃ	zzya	っじゅ	zzyu	っじょ	zzyo",
"っす	ssu	っず	zzu	っせ	sse	っぜ	zze	っそ	sso",
"っぞ	zzo	った	tta	っだ	dda	っち	tti",
"っちゃ	ttya	っちゅ	ttyu	っちょ	ttyo	っぢ	ddi",
"っぢゃ	ddya	っぢゅ	ddyu	っぢょ	ddyo	っつ	ttu",
"っづ	ddu	って	tte	っで	dde	っと	tto	っど	ddo",
"っは	hha	っば	bba	っぱ	ppa	っひ	hhi",
"っひゃ	hhya	っひゅ	hhyu	っひょ	hhyo	っび	bbi",
"っびゃ	bbya	っびゅ	bbyu	っびょ	bbyo	っぴ	ppi",
"っぴゃ	ppya	っぴゅ	ppyu	っぴょ	ppyo	っふ	hhu",
"っふぁ	ffa	っふぃ	ffi	っふぇ	ffe	っふぉ	ffo",
"っぶ	bbu	っぷ	ppu	っへ	hhe	っべ	bbe	っぺ    ppe",
"っほ	hho	っぼ	bbo	っぽ	ppo	っや	yya	っゆ	yyu",
"っよ	yyo	っら	rra	っり	rri	っりゃ	rrya",
"っりゅ	rryu	っりょ	rryo	っる	rru	っれ	rre",
"っろ	rro",

"つ	tu	づ	du	て	te	で	de	と	to",
"ど	do",

"な	na	に	ni	にゃ	nya	にゅ	nyu	にょ	nyo",
"ぬ	nu	ね	ne	の	no",

"は	ha	ば	ba	ぱ	pa	ひ	hi	ひゃ	hya",
"ひゅ	hyu	ひょ	hyo	び	bi	びゃ	bya	びゅ	byu",
"びょ	byo	ぴ	pi	ぴゃ	pya	ぴゅ	pyu	ぴょ	pyo",
"ふ	hu	ふぁ	fa	ふぃ	fi	ふぇ	fe	ふぉ	fo",
"ぶ	bu	ぷ	pu	へ	he	べ	be	ぺ	pe",
"ほ	ho	ぼ	bo	ぽ	po",

"ま	ma	み	mi	みゃ	mya	みゅ	myu	みょ	myo",
"む	mu	め	me	も	mo",

"ゃ	xya	や	ya	ゅ	xyu	ゆ	yu	ょ	xyo",
"よ	yo",

"ら	ra	り	ri	りゃ	rya	りゅ	ryu	りょ	ryo",
"る	ru	れ	re	ろ	ro",

"ゎ	xwa	わ	wa	ゐ	wi	ゑ	we",
"を	wo	ん	n ",

"ん     n'",
"でぃ   dyi",
"ー     -",
"ちぇ    tye",
"っちぇ	ttye",
"じぇ	zye",
]

  HEPBURNTAB = [
"ぁ	xa	あ	a	ぃ	xi	い	i	ぅ	xu",
"う	u	う゛	vu	う゛ぁ	va	う゛ぃ	vi	う゛ぇ	ve",
"う゛ぉ	vo	ぇ	xe	え	e	ぉ	xo	お	o",
	

"か	ka	が	ga	き	ki	きゃ	kya	きゅ	kyu",
"きょ	kyo	ぎ	gi	ぎゃ	gya	ぎゅ	gyu	ぎょ	gyo",
"く	ku	ぐ	gu	け	ke	げ	ge	こ	ko",
"ご	go	",

"さ	sa	ざ	za	し	shi	しゃ	sha	しゅ	shu",
"しょ	sho	じ	ji	じゃ	ja	じゅ	ju	じょ	jo",
"す	su	ず	zu	せ	se	ぜ	ze	そ	so",
"ぞ	zo",

"た	ta	だ	da	ち	chi	ちゃ	cha	ちゅ	chu",
"ちょ	cho	ぢ	di	ぢゃ	dya	ぢゅ	dyu	ぢょ	dyo",

"っ	xtsu",
"っう゛	vvu	っう゛ぁ	vva	っう゛ぃ	vvi",
"っう゛ぇ	vve	っう゛ぉ	vvo",
"っか	kka	っが	gga	っき	kki	っきゃ	kkya",
"っきゅ	kkyu	っきょ	kkyo	っぎ	ggi	っぎゃ	ggya",
"っぎゅ	ggyu	っぎょ	ggyo	っく	kku	っぐ	ggu",
"っけ	kke	っげ	gge	っこ	kko	っご	ggo	っさ	ssa",
"っざ	zza	っし	sshi	っしゃ	ssha",
"っしゅ	sshu	っしょ	ssho",
"っじ	jji	っじゃ	jja	っじゅ	jju	っじょ	jjo",
"っす	ssu	っず	zzu	っせ	sse	っぜ	zze	っそ	sso",
"っぞ	zzo	った	tta	っだ	dda	っち	cchi",
"っちゃ	ccha	っちゅ	cchu	っちょ	ccho	っぢ	ddi",
"っぢゃ	ddya	っぢゅ	ddyu	っぢょ	ddyo	っつ	ttsu",
"っづ	ddu	って	tte	っで	dde	っと	tto	っど	ddo",
"っは	hha	っば	bba	っぱ	ppa	っひ	hhi",
"っひゃ	hhya	っひゅ	hhyu	っひょ	hhyo	っび	bbi",
"っびゃ	bbya	っびゅ	bbyu	っびょ	bbyo	っぴ	ppi",
"っぴゃ	ppya	っぴゅ	ppyu	っぴょ	ppyo	っふ	ffu",
"っふぁ	ffa	っふぃ	ffi	っふぇ	ffe	っふぉ	ffo",
"っぶ	bbu	っぷ	ppu	っへ	hhe	っべ	bbe	っぺ	ppe",
"っほ	hho	っぼ	bbo	っぽ	ppo	っや	yya	っゆ	yyu",
"っよ	yyo	っら	rra	っり	rri	っりゃ	rrya",
"っりゅ	rryu	っりょ	rryo	っる	rru	っれ	rre",
"っろ	rro",

"つ	tsu	づ	du	て	te	で	de	と	to",
"ど	do",

"な	na	に	ni	にゃ	nya	にゅ	nyu	にょ	nyo",
"ぬ	nu	ね	ne	の	no",

"は	ha	ば	ba	ぱ	pa	ひ	hi	ひゃ	hya",
"ひゅ	hyu	ひょ	hyo	び	bi	びゃ	bya	びゅ	byu",
"びょ	byo	ぴ	pi	ぴゃ	pya	ぴゅ	pyu	ぴょ	pyo",
"ふ	fu	ふぁ	fa	ふぃ	fi	ふぇ	fe	ふぉ	fo",
"ぶ	bu	ぷ	pu	へ	he	べ	be	ぺ	pe",
"ほ	ho	ぼ	bo	ぽ	po",

"ま	ma	み	mi	みゃ	mya	みゅ	myu	みょ	myo",
"む	mu	め	me	も	mo",

"ゃ	xya	や	ya	ゅ	xyu	ゆ	yu	ょ	xyo",
"よ	yo",

"ら	ra	り	ri	りゃ	rya	りゅ	ryu	りょ	ryo",
"る	ru	れ	re	ろ	ro",

"ゎ	xwa	わ	wa	ゐ	wi	ゑ	we",
"を	wo	ん	n",

"ん     n'",
"でぃ   dyi",
"ー     -",
"ちぇ	che",
"っちぇ	cche",
"じぇ	je",
]

  KANROM = (kanaroma = Hash.new
	    (KUNREITAB + HEPBURNTAB).each {|a|
              a.split().pairs {|x|
                kana, roma = x
                kanaroma[kana] = roma
              }
            }
	    kanaroma)

  ROMKAN = (romakana = Hash.new
	    (KUNREITAB + HEPBURNTAB).each {|a|
              a.split().pairs {|x|
                kana, roma = x
                romakana[roma] = kana
              }
            }
	    romakana)

  # Sort in long order so that a longer Romaji sequence precedes.
#  ROMPAT = ROMKAN.keys.sort {|a, b| b.length <=> a.length}.join "|"

#  KANPAT = KANROM.keys.sort {|a, b| 
#    b.length <=> a.length ||
#      KANROM[a].length <=> KANROM[b].length
#  }.join "|"

  KUNREI  = (kunrei = Array.new
             KUNREITAB.each {|a|
               i = 0
               kunrei += a.split().select {i += 1; i % 2 == 0}
             }
             kunrei)
  HEPBURN = (hepburn = Array.new
             HEPBURNTAB.each {|a|
               i = 0
               hepburn += a.split().select {i += 1; i % 2 == 0}
             }
             hepburn)

#  KUNPAT = KUNREI.sort  {|a, b| b.length <=> a.length }.join "|"
#  HEPPAT = HEPBURN.sort {|a, b| b.length <=> a.length }.join "|"

  TO_HEPBURN = (romrom = Hash.new
		KUNREI.each_with_index {|x, i|
		  romrom[KUNREI[i]] = HEPBURN[i]}
		romrom)
  TO_KUNREI =  (romrom = Hash.new
		HEPBURN.each_with_index {|x, i|
		  romrom[HEPBURN[i]] = KUNREI[i]}
		romrom)

  # FIXME: ad hod solution
  # tanni   => tan'i
  # kannji  => kanji
  # hannnou => han'nou
  # hannnya => han'nya
  def normalize_double_n
    tmp = self
    if tmp.index("nn")
      tmp["nn"] = "n'"
    end

    i = tmp.index("n'")
    if i
      if ['a', 'e', 'i', 'u', 'o', 'y', 'n'].include?(tmp[i+2]) == false
        tmp[i, 2] = "n"
      end
    end
    tmp
#    self.gsub(/nn/, "n'").gsub(/n\'(?=[^aiueoyn]|$)/, "n")
  end

  def normalize_double_n!
    if self.index("nn")
      self["nn"] = "n'"
    end
    i = self.index("n'")
    if i
      if ['a', 'e', 'i', 'u', 'o', 'y', 'n'].include?(self[i+2]) == false
        self[i, 2] = "n"
      end
    end
#    self.gsub!(/nn/, "n'")
#    self.gsub!(/n\'(?=[^aiueoyn]|$)/, "n")
    self
  end

  def convert_romkan(table)
    pos = 0
    k = nil
    result_str = ""
    tmp = self.normalize_double_n
    while true
      4.downto(1) do |i|
        substr = tmp.slice(pos, i)
        k = table[substr]
        if k
          result_str += k
          pos += i
          break
        end
      end
      unless k
        result_str += tmp.slice(pos, 1)
        pos += 1
      end
      if pos >= tmp.size
        break
      end
    end
    result_str
  end

  # Romaji -> Kana
  # It can handle both Hepburn and Kunrei sequences.
  def to_kana 
    pos = 0
    k = nil
    romaji = ""
    tmp = self.normalize_double_n
    while true
      4.downto(1) do |i|
        substr = tmp.slice(pos, i)
        k = ROMKAN[substr]
        if k
          romaji += k
          pos += i
          break
        end
      end
      unless k
        romaji += tmp.slice(pos, 1)
        pos += 1
      end
      if pos >= tmp.size
        break
      end
    end
    romaji
#    tmp.gsub(/(#{ROMPAT})/) { ROMKAN[$1] }
  end

  # Kana -> Romaji.  
  # Return Hepburn sequences.
  def to_roma
    tmp = convert_romkan(KANROM)
    i = tmp.index("n'")
    if i != nil
      if ['a', 'e', 'i', 'u', 'o', 'y', 'n'].include?(tmp[i+2]) == false
        tmp[i, 2] = "n"
      end
    end
    tmp
#    tmp = self.gsub(/(#{KANPAT})/) { KANROM[$1] }
#    tmp.gsub(/n'(?=[^aeiuoyn]|$)/, "n")
  end

  # Romaji -> Romaji
  # Normalize into Hepburn sequences.
  # e.g. kannzi -> kanji, tiezo -> chiezo
  def to_hepburn
    convert_romkan(TO_HEPBURN)
#   tmp.gsub(/\G((?:#{HEPPAT})*?)(#{KUNPAT})/) { $1 + TO_HEPBURN[$2]}
  end

  # Romaji -> Romaji
  # Normalize into Kunrei sequences.
  # e.g. kanji -> kanzi, chiezo -> tiezo
  def to_kunrei
    convert_romkan(TO_KUNREI)
#    tmp.gsub(/\G((?:#{KUNPAT})*?)(#{HEPPAT})/) { $1 + TO_KUNREI[$2]}
  end

  def to_kana!
#    self.normalize_double_n!
#    self.gsub!(/(#{ROMPAT})/) { ROMKAN[$1] }
    self
  end

  def to_roma!
#    self.gsub!(/(#{KANPAT})/) { KANROM[$1] }
#    self.gsub!(/n'(?=[^aeiuoyn]|$)/, "n")
    self
  end

  def to_hepburn!
#    self.normalize_double_n!
#    self.gsub!(/\G((?:#{HEPPAT})*?)(#{KUNPAT})/) { $1 + TO_HEPBURN[$2]}
    self
  end

  def to_kunrei!
#    tmp = self.normalize_double_n!
#    tmp.gsub!(/\G((?:#{KUNPAT})*?)(#{HEPPAT})/) { $1 + TO_KUNREI[$2]}
  end

  def consonant?
    "ckgszjtdhfpbmyrwxn".each_char {|c|
      if self.index(c)
        return true
      end
    }
    false
#   if /^[ckgszjtdhfpbmyrwxn]$/.match(self)
#      true
#    else
#      false
#    end
  end

  def vowel?
    "aeiou".each_char {|c|
      if self.index(c)
        return true
      end
    }
    false
#    if /^[aeiou]$/.match(self)
#      true
#    else
#      false
#    end
  end

  # `z' => (za ze zi zo zu)
  def expand_consonant 
    ROMKAN.keys.select do |x|
      x.size == self.length+1 and x.index(self)
#      /^#{self}.$/ =~ x 
    end
  end
end

