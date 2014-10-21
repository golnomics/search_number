def selenium operation_list

  if operation_list[3] == 0
    @driver = Selenium::WebDriver.for :safari # ブラウザ起動
    @driver.navigate.to operation_list[2] # URLを開く
  end

  if operation_list[5].length > 0
    case operation_list[6]
    when 'click' then
      case operation_list[4]
      when 'xpath'
      @driver.find_element(:xpath, operation_list[5]).click
      when 'name'
      @driver.find_element(:name, operation_list[5]).click
      when 'id'
      @driver.find_element(:id, operation_list[5]).click
      when 'class'
      @driver.find_element(:class, operation_list[5]).click
      when 'tag_name'
      @driver.find_element(:tag_name, operation_list[5]).click
      else
      end
      sleep(operation_list[8])
    when 'set_value' then
      case operation_list[4]
      when 'xpath'
      element = @driver.find_element(:xpath, operation_list[5])
      when 'name'
      element = @driver.find_element(:name, operation_list[5])
      when 'id'
      element = @driver.find_element(:id, operation_list[5])
      when 'class'
      element = @driver.find_element(:class, operation_list[5])
      when 'tag_name'
      element = @driver.find_element(:tag_name, operation_list[5])
      else
      end
      element.clear
      element.send_keys(operation_list[7])
      sleep(operation_list[8])
    end
  end

  if operation_list[6] == "end"
    @driver.quit # ブラウザ終了
  end
end

require 'selenium-webdriver'
require 'mysql'

connection = Mysql::new("127.0.0.1", "root", "root", "golnomics")

statement = connection.prepare("SELECT * FROM selenium order by id, no")
begin
  result = statement.execute()
  result.each do |val|
    if val[5].length > 0
      if val[0] > 0
        p "id: " << val[0].to_s # id
      end
      if val[1].length > 0
        p "name: " << val[1]  # name
      end
      if val[2].length > 0
        p "url: " << val[2]  # url
      end
      if val[3] > 0
        p "no: " << val[3].to_s  # no
      end
      if val[4].length > 0
        p "selector_type: " << val[4]  # selector_type
      end
      if val[5].length > 0
        p "selector: " << val[5]  # selector
      end
      if val[6].length > 0
        p "event: " << val[6]  # event
      end
      if val[7].length > 0
        p "value: " << val[7]  # value
      end
      if val[8] > 0
        p "wait_time: " << val[8].to_s  # wait_time
      end
      if val[9].length > 0
        p "despriction: " << val[9]  # despriction
      end
      if val[10].length > 0 
        p "image :" << val[10]  # image
      end
    end

    selenium val
  end
ensure
  statement.close
end




#driver = Selenium::WebDriver.for :safari # ブラウザ起動
#driver.navigate.to 'http://bizipo.jp' # URLを開く
##driver.switch_to.frame(1)               # 1つめの子フレームに移動
##driver.switch_to.frame("frameid")       # フレームのnameを指定して移動
#
## テキストフィールドへ入力・削除
#element = driver.find_element(:xpath,'//*[@id="main"]/div[2]/form/dl/dd[1]/input')
#element.clear
#element.send_keys('48')
#element = driver.find_element(:xpath,'//*[@id="main"]/div[2]/form/dl/dd[2]/input')
#element.clear
#element.send_keys('1')
#
## リンクやボタンを押す
#driver.find_element(:xpath, '//*[@id="main"]/div[2]/form/p[1]/input').click
#sleep(2)
#
#driver.find_element(:xpath, '//*[@id="buttonmenuarea"]/li[3]/a/img').click
#sleep(2)
#
#driver.find_element(:xpath, '//*[@id="maincontents"]/div[5]/table/tbody/tr[10]/td[1]/a').click
#sleep(2)
#
#driver.find_element(:xpath, '//*[@id="maincontents"]/div[5]/form/input').click
#sleep(2)
#
#element = driver.find_element(:xpath, '//*[@id="maincontents"]/form/div[1]/table/tbody/tr[2]/td/input')
#element.clear
#element.send_keys('69');
#element = driver.find_element(:xpath, '//*[@id="maincontents"]/form/div[1]/table/tbody/tr[3]/td/input')
#element.clear
#element.send_keys('69');
#
##driver.find_element(:xpath, '//*[@id="maincontents"]/form/div[2]/input').click
#sleep(5)
#
#driver.quit # ブラウザ終了
