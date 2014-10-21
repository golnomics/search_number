class BinarySearchArray

  # 二分探索用にcsvをラップするクラス
  load 'wrapper_binary_search_csv.rb'

  require 'csv'

  def initialize csv_file
	# ファイルからcsv取得
	csv_data = get_csv_from csv_file

	# 二分探索用のクラスにラップ
    @research_numbers = WrapperBinarySearchCsv.new csv_data
  end

  # rsepcのテストで使う為のゲッター
  attr_reader :research_numbers

  #ファイルからcsv取得
  def get_csv_from (csv_file)
    csv_file = open(csv_file)
    while line = csv_file.gets
      @csv_data = line
    end
    return @csv_data
  end
  
  # 調査対象がある場合（調査を続けるので）trueを返す
  def research_numbers_many?
    if @research_numbers.expect_last_value - @research_numbers.expect_head_value > 0
      true
    else
      false
    end
  end
  
  #チェック対象の配列の先頭（最小値）のチェック
  def check_head
    if @research_numbers.expect_head_value != @research_numbers.inspect_head_value
	  answer_number = @research_numbers.expect_head_value
	else
	  nil
	end
  end

  #チェック対象の配列の末尾（最大値）のチェック
  def check_last
    if @research_numbers.expect_last_value != @research_numbers.inspect_last_value
	  answer_number = @research_numbers.expect_last_value
	else
	  nil
	end
  end
  
  #チェック対象の配列のセンター（中央）のチェックする
  def check_center
    if @research_numbers.expect_center_value == @research_numbers.inspect_center_value
	  # 探索範囲の変更、センターより前の配列を調査対象から外す
	  range_condition = 'omit_first_half'
    else
	  # 探索範囲の変更、センターより後の配列を調査対象から外す
	  range_condition = 'omit_second_half'
    end
  end
 
  #チェック対象の配列の範囲を狭める
  def set_research_numbers_range range_condition
    if range_condition == 'omit_first_half' 
	  # 調査対象の配列の先頭を変更
      @research_numbers.set_research_head = @research_numbers.expect_center_value + 1
    elsif range_condition == 'omit_second_half'
	  # 調査対象の配列の末尾を変更
      @research_numbers.set_research_last = @research_numbers.expect_center_value
    end
  end
 
  #答えが判明するまでチェック対象配列のセンター値をチェックし対象配列のエリアを狭めていく（二分探索）
  def answer_target_number
    
	# 対象の配列が複数ある場合（答えが判明できるまで）に処理を続ける
    while research_numbers_many? do

	  # 配列の先頭の期待値と調査値を比較し答え探す 
      answer_number = check_head 
	  # 答えが判明した場合
      return answer_number if answer_number

	  # 配列の末尾の期待値と調査値を比較し答えを探す
      answer_number = check_last 
	  # 答えが判明した場合
      return answer_number if answer_number

	  # 配列のセンターチェックし、調査対象の配列を狭める条件を取得する
      range_condition = check_center
	  # 調査対象の配列の先頭か末尾を変更し、対象範囲を狭める
	  set_research_numbers_range range_condition
    end
  end

end
