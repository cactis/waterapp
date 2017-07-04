# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: dmovies.first)

# a = Category.create(name: "A")
# b = Category.create(name: "B")
# a1 = a.children.create(name: "a1")
# a.children.create(name: "a2")

u1 = User.create!(email: "oxcart.us@gmail.com", password: "waterapp")
u2 = User.create!(email: "den990037@gmail.com", password: "waterapp")
u3 = User.create!(email: "7en1030003@gmail.com", password: "waterapp")

a = Category.create(name: "UFRO")
b = Category.create(name: "柴油引擎系統")
c = Category.create(name:"工業廢氣處理系統")
d = Category.create(name: "空氣壓縮系統")

a1 = a.children.create(name: "開機程序")
a2 = a.children.create(name: "原水處理")
a3 = a.children.create(name: "快濾及活性碳")
a4 = a.children.create(name: "離子交換樹酯設備處理")
a5 = a.children.create(name: "預過濾器")
a6 = a.children.create(name: "UF超過濾處理")
a7 = a.children.create(name: "配電盤")
a8 = a.children.create(name: "RO逆滲透處理")
a9 = a.children.create(name: "關機程序")

a1_1 = a1.children.create(name: "環境") 
a1_2 = a1.children.create(name: "開關閥")
a1_3 = a1.children.create(name: "桶槽")
a1_4 = a1.children.create(name: "配電盤")

a2_1 = a2.children.create(name: "原水桶槽")
a2_2 = a2.children.create(name: "泵浦")
a2_3 = a2.children.create(name: "水管")

a3_1 = a3.children.create(name: "壓力計")
a3_2 = a3.children.create(name: "WS1-TC")

a4_1 = a4.children.create(name: "WS1-TC")
a4_2 = a4.children.create(name: "鹽水桶槽")

a5_1 = a5.children.create(name: "進出口閥")
a5_2 = a5.children.create(name: "WS1-TC")
a5_3 = a5.children.create(name: "壓差計")
a5_4 = a5.children.create(name: "壓力計")

a6_1 = a6.children.create(name: "泵浦")
a6_2 = a6.children.create(name: "電動閥")
a6_3 = a6.children.create(name: "水管")

a7_1 = a7.children.create(name: "電流表")
a7_2 = a7.children.create(name: "電壓表")
a7_3 = a7.children.create(name: "原水導電度")
a7_4 = a7.children.create(name: "RO產水導電度")
a7_5 = a7.children.create(name: "UF進水導電度")
a7_6 = a7.children.create(name: "原水儲桶液位")
a7_7 = a7.children.create(name: "UF儲桶液位")
a7_8 = a7.children.create(name: "RO儲桶液位")

a8_1 = a8.children.create(name: "泵浦")
a8_2 = a8.children.create(name: "水管")
a8_3 = a8.children.create(name: "壓力計")

a9_1 = a9.children.create(name: "電動閥")
a9_2 = a9.children.create(name: "電磁開關")
a9_3 = a9.children.create(name: "開關閥")
a9_4 = a9.children.create(name: "配電盤")

a1_1_1 = a1_1.children.create(name: "週遭是否潮濕", options: "正常|異常")
a1_1_2 = a1_1.children.create(name: "使用驗電筆檢查機電設備", options: "正常|異常")
a1_2_1 = a1_2.children.create(name: "檢視各單元進出水管開 關閥是否開啟", options: "正常|異常")
a1_3_1 = a1_3.children.create(name: "檢視各桶槽液位是否在正常位置", options: "正常|異常")
a1_4_1 = a1_4.children.create(name: "盤面電壓值是否顯示正常", options: "正常|異常")

a2_1_1 = a2_1.children.create(name: "液位", unit: "CM")
a2_2_1 = a2_2.children.create(name: "出入口閥是否全部開啟", options: "正常|異常")
a2_2_2 = a2_2.children.create(name: "設備運轉是否有異音", options: "正常|異常")
a2_2_3 = a2_2.children.create(name: "泵浦是否已進行排氣", options: "正常|異常")
a2_3_1 = a2_3.children.create(name: "管路是否有漏水" , options: "正常|異常")

a3_1_1 = a3_1.children.create(name: "進水壓力", unit: "LPM")
a3_2_1 = a3_2.children.create(name: "是否校正", options: "正常|異常")

a4_1_1 = a4_1.children.create(name: "是否校正", options: "正常|異常")
a4_2_1 = a4_2.children.create(name: "桶內鹽水是否達到標線", options: "正常|異常")

a5_1_1 = a5_1.children.create(name: "檢視進出口閥是否開啟", options: "正常|異常")
a5_2_1 = a5_2.children.create(name: "是否校正", options: "正常|異常")
a5_3_1 = a5_3.children.create(name: "壓差是否增加", options: "正常|異常")
a5_4_1 = a5_4.children.create(name: "出水壓力", unit: "kg/cm2")

a6_1_1 = a6_1.children.create(name: "出入口閥是否全部開啟", options: "正常|異常")
a6_1_2 = a6_1.children.create(name: "設備運轉是否有異音", options: "正常|異常")
a6_1_3 = a6_1.children.create(name: "泵浦是否已進行排氣", options: "正常|異常")
a6_2_1 = a6_2.children.create(name: "UF系統電動閥是否開啟", options: "正常|異常")
a6_3_1 = a6_3.children.create(name: "管路是否有漏水", options: "正常|異常")

a7_1_1 = a7_1.children.create(name: "電流表", unit: "A")
a7_2_1 = a7_2.children.create(name: "電壓表", unit: "V")
a7_3_1 = a7_3.children.create(name: "原水導電度", unit: "uS/CM")
a7_4_1 = a7_4.children.create(name: "RO產水導電度", unit: "uS/CM")
a7_5_1 = a7_5.children.create(name: "UF進水導電度", unit: "uS/CM")
a7_6_1 = a7_6.children.create(name: "原水儲桶液位", unit: "CM")
a7_7_1 = a7_7.children.create(name: "UF儲桶液位", unit: "CM")
a7_8_1 = a7_8.children.create(name: "RO儲桶液位", unit: "CM")

a8_1_1 = a8_1.children.create(name: "出入口閥是否全部開啟", options: "正常|異常")
a8_1_2 = a8_1.children.create(name: "設備運轉是否有異音", options: "正常|異常")
a8_1_3 = a8_1.children.create(name: "泵浦是否已進行排氣", options: "正常|異常")
a8_2_1 = a8_2.children.create(name: "管路是否有漏水", options: "正常|異常" )
a8_3_1 = a8_3.children.create(name: "進水壓力", unit: "Kg/cm2")
a8_3_2 = a8_3.children.create(name: "產水壓力", unit: "Kg/cm2")

a9_1_1 = a9_1.children.create(name:"檢視UF系統電動閥是否關閉", options: "正常|異常")
a9_2_1 = a9_2.children.create(name: "視RO系統電磁開關是否關閉", options: "正常|異常")
a9_3_1 = a9_3.children.create(name: "檢視各單元水管開關閥是否關閉", options: "正常|異常")
a9_4_1 = a9_4.children.create(name: "檢視盤面電壓值是否顯示為0", options: "正常|異常")

u1.inspections.create(category_id: 8, value: "3.4")