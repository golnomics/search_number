require_relative 'wrapper_binary_search_csv'

require 'csv'
describe WrapperBinarySearchCsv do
  context '調査するcsvを二分探索用の配列オブジェクトにラップするクラス' do

    context 'ゲッターセッター検証' do
      before do
        csv_file = open("numbers_missing_6789.csv")
        while line = csv_file.gets
          @csv_data = line
        end
        @research_numbers = WrapperBinarySearchCsv.new @csv_data
      end
      it 'セッターexpect_head_value後のゲッターの値が正しいのでOK' do
    	@research_numbers.expect_head_value = 1
        expect(@research_numbers.expect_head_value).to eq 1 
      end
      it 'セッターinspect_head_index 配列インデックスをセットしその配列の値が正しいのでOK' do
    	@research_numbers.inspect_head_index = 0
    	expect(@research_numbers.inspect_head_value).to eq 1
      end
    
      it 'セッターinspect_center_index 配列インデックスをセットしその配列の値が正しいのでOK' do
    	  @research_numbers.inspect_center_index = 4999
    	  expect(@research_numbers.inspect_center_value).to eq 5000
      end
    
      it 'セッターexpect_last_value後のゲッターの値が正しいのでOK ' do
    	@research_numbers.expect_last_value = 10000 
    	expect(@research_numbers.expect_last_value).to eq 10000
      end
      it 'セッターinspect_last_index 配列インデックスをセットしその配列の値を正しいのでOK' do
    	@research_numbers.inspect_last_index = 9998
    	expect(@research_numbers.inspect_last_value).to eq 10000
      end
    end

    context'関数 set_research_head 検証' do
      before do
        csv_file = open("numbers_missing_6789.csv")
        while line = csv_file.gets
          @csv_data = line
        end
        @research_numbers = WrapperBinarySearchCsv.new @csv_data
        @research_numbers.set_research_head = 5001
      end
	  context '引数が 5001 の場合' do
        it 'expect_head_valueの取得値が5001である' do
          expect(@research_numbers.expect_head_value).to eq 5001
        end
        it 'inspect_head_valueの取得が5001である' do
          expect(@research_numbers.inspect_head_value).to eq 5001
        end
	  end
    end
    
    context'関数 set_research_last 検証' do
      before do
        csv_file = open("numbers_missing_6789.csv")
        while line = csv_file.gets
          @csv_data = line
        end
        @research_numbers = WrapperBinarySearchCsv.new @csv_data
        @research_numbers.set_research_last = 9999
      end
	  context '引数が9999の場合' do
        it 'expect_last_valueの取得値が9999である' do
          expect(@research_numbers.expect_last_value).to eq 9999
        end
        it 'inspect_last_valueの取得が9999である' do
          expect(@research_numbers.inspect_last_value).to eq 9999
        end
	  end
    end


    context 'initialize後の初期値の確認' do

      context '答えが6（1桁）の場合' do
        before do
          csv_file = open("numbers_missing_6.csv")
          while line = csv_file.gets
            @csv_data = line
          end
          @research_numbers = WrapperBinarySearchCsv.new @csv_data
        end
        it '答えが1桁なので配列先頭の期待値（expect_head_value）は1である' do
          expect(@research_numbers.expect_head_value).to eq 1
        end
        it '答えが1桁なので配列末尾の調査値（inspect_head_value）は1である' do
          expect(@research_numbers.inspect_head_value).to eq 1
        end
        it '答えが1桁なので配列センターの期待値（expect_center_value）は5である' do
          expect(@research_numbers.expect_center_value).to eq 5
        end
        it '答えが1桁なので配列センターの調査値（inspect_center_value）は5である' do
          expect(@research_numbers.inspect_center_value).to eq 5
        end
        it '答えが1桁なので配列末尾の期待値（expect_last_value）は9である' do
          expect(@research_numbers.expect_last_value).to eq 9
        end
        it '答えが1桁なので配列末尾の調査値（inspect_last_value）は9である' do
          expect(@research_numbers.inspect_last_value).to eq 9
        end
      end

      context '答えが66（2桁）の場合' do
        before do
          csv_file = open("numbers_missing_66.csv")
          while line = csv_file.gets
            @csv_data = line
          end
          @research_numbers = WrapperBinarySearchCsv.new @csv_data
        end
        it '答えが2桁なので配列先頭の期待値（expect_head_value）は10である' do
          expect(@research_numbers.expect_head_value).to eq 10
        end
        it '答えが2桁なので配列先頭の調査値（inspect_head_value）は10である' do
          expect(@research_numbers.inspect_head_value).to eq 10
        end
        it '答えが2桁なので配列センターの期待値（expect_center_value）は54である' do
          expect(@research_numbers.expect_center_value).to eq 54
        end
        it '答えが2桁なので配列センターの調査値（inspect_center_value）は54である' do
          expect(@research_numbers.inspect_center_value).to eq 54
        end
        it '答えが2桁なので配列末尾の期待値（expect_last_value）は99である' do
          expect(@research_numbers.expect_last_value).to eq 99
        end
        it '答えが2桁なので配列末尾の調査値（inspect_last_value）は99である' do
          expect(@research_numbers.inspect_last_value).to eq 99
        end
      end

      context '答えが666（3桁）の場合' do
        before do
          csv_file = open("numbers_missing_666.csv")
          while line = csv_file.gets
            @csv_data = line
          end
          @research_numbers = WrapperBinarySearchCsv.new @csv_data
        end
        it '答えが3桁なので配列先頭の期待値（expect_head_value）は100である' do
          expect(@research_numbers.expect_head_value).to eq 100
        end
        it '答えが3桁なので配列先頭の調査値（inspect_head_value）は100である' do
          expect(@research_numbers.inspect_head_value).to eq 100
        end
        it '答えが3桁なので配列センターの期待値（expect_center_value）は549である' do
          expect(@research_numbers.expect_center_value).to eq 549
        end
        it '答えが3桁なので配列センターの調査値（inspect_center_value）は549である' do
          expect(@research_numbers.inspect_center_value).to eq 549
        end
        it '答えが3桁なので配列末尾の期待値（expect_last_value）は999である' do
          expect(@research_numbers.expect_last_value).to eq 999
        end
        it '答えが3桁なので配列末尾の調査値（inspect_last_value）は999である' do
          expect(@research_numbers.inspect_last_value).to eq 999
        end
      end

      context '答えが6789（4桁）の場合' do
        before do
          csv_file = open("numbers_missing_6789.csv")
          while line = csv_file.gets
            @csv_data = line
          end
          @research_numbers = WrapperBinarySearchCsv.new @csv_data
        end
        it '答えが4桁なので配列先頭の期待値（expect_head_value）は1000である' do
          expect(@research_numbers.expect_head_value).to eq 1000
        end
        it '答えが4桁なので配列先頭の調査値（inspect_head_value）は1000である' do
          expect(@research_numbers.inspect_head_value).to eq 1000
        end
        it '答えが4桁なので配列センターの期待値（expect_center_value）は5499である' do
          expect(@research_numbers.expect_center_value).to eq 5499
        end
        it '答えが4桁なので配列センターの調査値（inspect_center_value）は5499である' do
          expect(@research_numbers.inspect_center_value).to eq 5499
        end
        it '答えが4桁なので配列末尾の期待値（expect_last_value）は9999である' do
          expect(@research_numbers.expect_last_value).to eq 9999
        end
        it '答えが4桁なので配列末尾の調査値（inspect_last_value）は9999である' do
          expect(@research_numbers.inspect_last_value).to eq 9999
        end
      end

      context '境界値検証' do

        context '答えが1（1桁）の場合' do
          before do
            csv_file = open("numbers_missing_1.csv")
            while line = csv_file.gets
              @csv_data = line
            end
            @research_numbers = WrapperBinarySearchCsv.new @csv_data
          end
          it '答えが1桁なので配列先頭の期待値（expect_head_value）は1である' do
            expect(@research_numbers.expect_head_value).to eq 1
          end
          it '答えが1桁なので配列先頭の調査値（inspect_head_value）は2である' do
            expect(@research_numbers.inspect_head_value).to eq 2
          end
          it '答えが1桁なので配列センターの期待値（expect_center_value）は5である' do
            expect(@research_numbers.expect_center_value).to eq 5
          end
          it '答えが1桁なので配列センターの調査値（inspect_center_value）は6である' do
            expect(@research_numbers.inspect_center_value).to eq 6
          end
          it '答えが1桁なので配列末尾の期待値（expect_last_value）は9である' do
            expect(@research_numbers.expect_last_value).to eq 9
          end
          it '答えが1桁なので配列末尾の調査値（inspect_last_value）は9である' do
            expect(@research_numbers.inspect_last_value).to eq 9
          end
        end

        context '答えが10000（5桁）の場合' do
          before do
            csv_file = open("numbers_missing_10000.csv")
            while line = csv_file.gets
              @csv_data = line
            end
            @research_numbers = WrapperBinarySearchCsv.new @csv_data
          end
          it '答えが5桁なので配列先頭の期待値（expect_head_value）は9999である' do
            expect(@research_numbers.expect_head_value).to eq 9999
          end
          it '答えが5桁なので配列先頭の調査値（inspect_head_value）は9999である' do
            expect(@research_numbers.inspect_head_value).to eq 9999
          end
          it '答えが5桁なので配列センターの期待値（expect_center_value）は9999である' do
            expect(@research_numbers.expect_center_value).to eq 9999
          end
          it '答えが5桁なので配列センターの調査値（inspect_center_value）は9999である' do
            expect(@research_numbers.inspect_center_value).to eq 9999
          end
          it '答えが5桁なので配列末尾の期待値（expect_last_value）は10000である' do
            expect(@research_numbers.expect_last_value).to eq 10000
          end
          it '答えが5桁なので配列末尾の調査値（inspect_last_value）は9999である' do
            expect(@research_numbers.inspect_last_value).to eq 9999
          end
        end

      end
    end
  end
end
