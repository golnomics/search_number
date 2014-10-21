class WrapperBinarySearchCsv
	
  def initialize csv_data

	# csvを調査する用の配列に格納
	research_a = CSV.parse(csv_data)[0]
	# 数値に型変換
    research_a.map!{|s|s.to_i}
	# ソート
    research_a.sort!
    @research_numbers = research_a         #調査する整数の配列
	
	# csvの文字列の長さから答えの数値の桁数が判明するので調査対象の配列の先頭（head）と末尾（last）をセット
	case csv_data.length
	when 48892
	  self.set_research_head=(1)     #配列先頭の期待値と調査対象の設定
	  self.set_research_last=(9)     #配列末尾の期待値と調査対象の設定
	when 48891
	  self.set_research_head=(10)    #配列先頭の期待値と調査対象の設定
	  self.set_research_last=(99)    #配列末尾の期待値と調査対象の設定
	when 48890
	  self.set_research_head=(100)   #配列先頭の期待値と調査対象の設定
	  self.set_research_last=(999)   #配列末尾の期待値と調査対象の設定
	when 48889
	  self.set_research_head=(1000)  #配列先頭の期待値と調査対象の設定
	  self.set_research_last=(9999)  #配列末尾の期待値と調査対象の設定
	when 48888
	  self.set_research_head=(9999)  #配列先頭の期待値と調査対象の設定
	  self.set_research_last=(10000) #配列末尾の期待値と調査対象の設定
	else
	end

    expect_center_value=(self.expect_last_value / 2)    #配列センターの期待値
    inspect_center_index=(self.expect_center_value - 1) #調査対象の配列センターのインデックス
  end

  #gettersetter 配列先頭の期待値
  attr_accessor :expect_head_value

  #setter 調査対象の配列先頭のインデックス
  attr_writer :inspect_head_index

  #getter 調査対象の配列先頭の値
  def inspect_head_value
    @research_numbers[@inspect_head_index]
  end

  # 調査する配列先頭をセット
  def set_research_head=(range_min_value)
    # 配列先頭の期待値をセット
    self.expect_head_value=(range_min_value)
    # 調査対象の配列先頭のインデックスをセット
    self.inspect_head_index=(range_min_value - 1)
  end

  #getter 配列のセンター期待値
  #       調査対象の配列センターのインデックスをセット
  def expect_center_value
    array_half_length = ( @expect_last_value - @expect_head_value ) / 2
    @expect_center_value = @expect_head_value + array_half_length 
    self.inspect_center_index=(@expect_center_value - 1)
    return @expect_center_value
  end

  #setter 調査対象の配列センターのインデックス
  attr_writer :inspect_center_index

  #getter 調査対象の配列センターの値
  def inspect_center_value
    @research_numbers[@inspect_center_index]
  end

  #gettersetter 調査対象の配列末尾の期待値
  attr_accessor :expect_last_value

  #setter 調査対象の配列末尾のインデックス
  attr_writer :inspect_last_index

  #getter 調査対象の配列末尾の値
  def inspect_last_value
    @research_numbers[@inspect_last_index]
  end

  # 調査する配列末尾をセット
  def set_research_last=(range_max_value)
    # 配列末尾の期待値をセット
    self.expect_last_value=(range_max_value)
    # 調査対象の配列末尾のインデックスをセット
    self.inspect_last_index=(range_max_value - 2)
  end

end
