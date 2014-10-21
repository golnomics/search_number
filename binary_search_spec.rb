require_relative 'binary_search'

describe BinarySearchArray do
  context '二分探索で答えを見つけるクラス' do

	context '関数 research_numbers_many? の検証' do
      before do
	    @binary_search = BinarySearchArray.new 'numbers.csv'
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立つ場合はtrueを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 1, :expect_last_value => 10000)
        expect(@binary_search.research_numbers_many?).to eq true
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立つ場合はtrueを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 1, :expect_last_value => 2)
        expect(@binary_search.research_numbers_many?).to eq true
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立つ場合はtrueを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 9999, :expect_last_value => 10000)
        expect(@binary_search.research_numbers_many?).to eq true
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立たないのでfalseを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 1, :expect_last_value => 1)
        expect(@binary_search.research_numbers_many?).to eq false
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立たないのでfalseを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 5000, :expect_last_value => 5000)
        expect(@binary_search.research_numbers_many?).to eq false
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立たないのでfalseを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 10000, :expect_last_value => 10000)
        expect(@binary_search.research_numbers_many?).to eq false
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立たないのでfalseを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 2, :expect_last_value => 1)
        expect(@binary_search.research_numbers_many?).to eq false
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立たないのでfalseを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 5000, :expect_last_value => 4999)
        expect(@binary_search.research_numbers_many?).to eq false
      end
	  it '配列先頭の期待値（expect_head_value）＜ 配列末尾の期待値（expect_last_value）が成り立たないのでfalseを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 10000, :expect_last_value => 9999)
        expect(@binary_search.research_numbers_many?).to eq false
      end
    end

	context '関数 check_head の検証' do
      before do
	    @binary_search = BinarySearchArray.new 'numbers.csv'
      end
	  it '期待値（expect_head_value）と調査値（inspect_head_value）が同じなのでnilを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 1, :inspect_head_value => 1)
        expect(@binary_search.check_head).to eq nil
      end
	  it '期待値（expect_head_value）と調査値（inspect_head_value）が異なる場合は期待値が答えとなるので、１を返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_head_value => 1, :inspect_head_value => 2)
        expect(@binary_search.check_head).to eq 1
      end
    end

	context '関数 check_last の検証' do
      before do
	    @binary_search = BinarySearchArray.new 'numbers.csv'
      end
	  it '期待値（expect_last_value）と調査値（inspect_last_value）が同じなのでnilを返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_last_value => 1, :inspect_last_value => 1)
        expect(@binary_search.check_last).to eq nil
      end
	  it '期待値（expect_last_value）と調査値（inspect_last_value）が異なる場合は期待値が答えとなるので、１を返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_last_value => 1, :inspect_last_value => 2)
        expect(@binary_search.check_last).to eq 1
      end
    end

	context '関数 check_center の検証' do
      before do
	    @binary_search = BinarySearchArray.new 'numbers.csv'
      end
	  it '期待値（expect_center_value）と調査値（inspect_center_value）が同じなので"omit_first_half"を返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_center_value => 5000, :inspect_center_value => 5000)
        expect(@binary_search.check_center).to eq 'omit_first_half'
      end
	  it '期待値（expect_center_value）と調査値（inspect_center_value）が異なるので"omit_second_half"を返す' do
	    allow(@binary_search.research_numbers).to receive_messages(:expect_center_value => 5000, :inspect_center_value => 4999)
        expect(@binary_search.check_center).to eq 'omit_second_half'
      end
    end

	context '関数 set_research_range の検証' do
      before do
	    @binary_search = BinarySearchArray.new 'numbers.csv'
	    allow(@binary_search.research_numbers).to receive_messages(:expect_center_value => 5000)
      end
	  it '引数がomit_first_halfの場合は配列前半を調査対象から外す為、expect_head_valueの値はexpect_center_valueに1をプラスした値になる' do
		@binary_search.set_research_numbers_range 'omit_first_half'
        expect(@binary_search.research_numbers.expect_head_value).to eq 5001
      end
	  it '引数がomit_second_halfの場合は配列後半を調査対象から外す為、expect_head_valueの値はexpect_center_valueと同じ値になる' do
		@binary_search.set_research_numbers_range 'omit_second_half'
        expect(@binary_search.research_numbers.expect_last_value).to eq 5000
      end
    end

	context '関数 answer_target_number の検証' do
	  it '答えが1の場合、1を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_1.csv'
	    expect(@binary_search.answer_target_number).to eq 1
	  end
	  it '答えが2の場合、2を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_2.csv'
	    expect(@binary_search.answer_target_number).to eq 2
	  end
	  it '答え2499がの場合、2499を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_2499.csv'
	    expect(@binary_search.answer_target_number).to eq 2499
	  end
	  it '答えが2500の場合、2500を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_2500.csv'
	    expect(@binary_search.answer_target_number).to eq 2500
	  end
	  it '答えが2501の場合、2501を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_2501.csv'
	    expect(@binary_search.answer_target_number).to eq 2501
	  end
	  it '答えがの4999場合、4999を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_4999.csv'
	    expect(@binary_search.answer_target_number).to eq 4999
	  end
	  it '答えが5000の場合、5000を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_5000.csv'
	    expect(@binary_search.answer_target_number).to eq 5000
	  end
	  it '答えが5001の場合、5001を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_5001.csv'
	    expect(@binary_search.answer_target_number).to eq 5001
	  end
	  it '答えが7499の場合、7499を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_7499.csv'
	    expect(@binary_search.answer_target_number).to eq 7499
	  end
	  it '答えが7500の場合、7500を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_7500.csv'
	    expect(@binary_search.answer_target_number).to eq 7500
	  end
	  it '答えが7501の場合、7501を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_7501.csv'
	    expect(@binary_search.answer_target_number).to eq 7501
	  end
	  it '答えが9999の場合、9999を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_9999.csv'
	    expect(@binary_search.answer_target_number).to eq 9999
	  end
	  it '答えが10000の場合、10000を返す' do
	    @binary_search = BinarySearchArray.new 'numbers_missing_10000.csv'
	    expect(@binary_search.answer_target_number).to eq 10000
	  end
    end
  end
end
