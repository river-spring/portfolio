# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 User.create!(name: "花子",user_id: "hanako", password: "111111",introduction: "ホラー映画が好きです。海外のおすすめ作品などありましたら教えて下さい。",email: "aaa@aaa")
 User.create!(name: "太郎",user_id: "tarosan", password: "222222",email: "bbb@bbb")
 User.create!(name: "皐月",user_id: "5moon", password: "333333",introduction: "身内用アカウント。フレンド申請はリア友のみ許可します。",email: "ccc@ccc")
 User.create!(name: "一郎＠コメディマニア",user_id: "ichiro", password: "444444",introduction: "何でもよく見ます。いろんな作品オススメして欲しいです！成人済みなので年齢指定OK。ミュージカル映画も最近気になっていてグループ立ち上げました。参加希望の方はお気軽にフレンド申請お願いします。",email: "ddd@ddd")
 User.create!(name: "やまだ＠不定期",user_id: "yamada", password: "555555",introduction: "不定期ですが見に行った映画やおすすめのアニメ等紹介していきたいと思っています。平成のオススメアニメをまとめたグループ作ってます。",email: "eee@eee")

 Admin.create!(user_id: "admin", password: "pfadmin", email: "zzz@zzz")
