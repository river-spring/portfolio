require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  	let(:user) { User.new(name: "テスト太郎", user_id: "test0", email: "zzz@zzz", password: "000000") }
  	context "データが正しく保存される" do
	  	it "正しく新規登録ができる" do
		  	user.save
		  	expect(user).to be_valid
	  	end
	end
	context "データが正しく保存されない" do
	  	it "nameが入力されていないので保存できない" do
	  		user.name = ""
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "nameが20文字以上なので保存できない" do
	  		user.name = "a" * 21
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "user_idが入力されていないので保存できない" do
	  		user.user_id = ""
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "user_idが5文字以下なので保存できない" do
	  		user.user_id = "test"
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "user_idが12文字以上なので保存できない" do
	  		user.user_id = "t" * 13
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "user_idが半角英数字以外なので保存できない" do
	  		user.user_id = "テストだよ"
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "user_idが重複しているので保存できない" do
	  		user.save
	  		@user2 = User.new(
				name: "テスト太郎",
				user_id:"test0",
				email: "zzz@zzz",
				password:"000000")
	  		expect(@user2.valid?).to eq(false)
	  	end
	  	it "passwordが半角英数字以外なので保存できない" do
	  		user.password = "ああああああ"
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	  	it "introductionが300文字以上なので保存できない" do
	  		user.introduction = "a" * 301
	  		user.save
	  		expect(user).to be_invalid
	  		expect(user.valid?).to eq(false)
	  	end
	end
end
